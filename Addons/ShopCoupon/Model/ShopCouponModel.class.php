<?php

namespace Addons\ShopCoupon\Model;
use Think\Model;

/**
 * ShopCoupon模型
 */
class ShopCouponModel extends Model{
    var $tableName = 'shop_coupon';
    function getInfo($id, $update = false, $data = array()) {
        $key = 'ShopCoupon_getInfo_' . $id;
        $info = S ( $key );
        if ($info === false || $update || true) { // TODO 关闭缓存
            $info = ( array ) (empty ( $data ) ? $this->find ( $id ) : $data);
            	
            S ( $key, $info, 86400 );
        }
    
        return $info;
    }
    function updateCollectCount($id, $update = false) {
        $key = 'ShopCoupon_updateCollectCount_' . $id;
        $cache = S ( $key );
    
        $info = $this->getInfo ( $id );
        if (! $cache || $cache >= 100 || $update || true) { // TODO 关闭缓存
            $info ['collect_count'] = D ( 'Common/SnCode' )->getCollectCount ( $id, 'ShopCoupon' );
            	
            // 更新数据库
            $this->where ( 'id=' . $id )->setField ( "collect_count", $info ['collect_count'] );
            	
            $cache = 1;
        } else {
            // 更新缓存
            $info ['collect_count'] += 1;
            $cache += 1;
        }
        S ( $key, $cache, 300 );
        $this->getInfo ( $id, true, $info );
    }
    function update($id, $save = array()) {
        $map ['id'] = $id;
        $res = $this->where ( $map )->save ( $save );
        if ($res) {
            $this->getInfo ( $id, true );
        }
        return $res;
    }
    // 通用的清缓存的方法
    function clear($ids, $type = '', $uid = '') {
        is_array ( $ids ) || $ids = explode ( ',', $ids );
    
        foreach ( $ids as $id ) {
            $this->updateCollectCount ( $id, true );
            $this->getInfo ( $id, true );
        }
    }
    
    // 素材相关
    function getSucaiList($search = '') {
        $map ['token'] = get_token ();
        $map ['uid'] = session ( 'mid' );
        empty ( $search ) || $map ['title'] = array (
            'like',
            "%$search%"
        );
    
        $data_list = $this->where ( $map )->field ( 'id' )->order ( 'id desc' )->selectPage ();
        foreach ( $data_list ['list_data'] as &$v ) {
            $data = $this->getInfo ( $v ['id'] );
            $v ['title'] = $data ['title'];
        }
    
        return $data_list;
    }
    function getPackageData($id) {
        $info = get_token_appinfo ();
        $param ['publicid'] = $info ['id'];
        $param ['id'] = $id;
        $data ['jumpURL'] = addons_url ( "ShopCoupon://Wap/set_sn_code", $param );
    
        $data ['info'] = $this->getInfo ( $id );
    
        return $data;
    }
    // 赠送代金券
    function sendCoupon($id, $uid) {
        $param ['id'] = $id;
    
        $info = $this->getInfo ( $id );
    
        $snDao = D('Common/SnCode');
        $snMap['target_id'] = $info['id'];
        $snMap['addon'] = "ShopCoupon";
        $info['collect_count'] = $snDao->where($snMap)->count();
    
        $flat = true;
        if ($info['is_del']){
            $flat=false;
        }
        if ($info ['collect_count'] >= $info ['num']) {
            $flat = false;
        } else if (! empty ( $info ['start_time'] ) && $info ['start_time'] > NOW_TIME) {
            $flat = false;
        } else if (! empty ( $info ['end_time'] ) && $info ['end_time'] < NOW_TIME) {
            $flat = false;
        }
        if ($uid <= 0){
            $flat == false;
        }
    
        $list = $snDao->getMyList ( $uid, $id, 'ShopCoupon' );
        $my_count = count ( $list );
    
        if ($info ['limit_num'] > 0 && $my_count >= $info ['limit_num']) {
            $flat = false;
        }
        if (! $flat)
            return false;
    
        $data ['target_id'] = $id;
        $data ['uid'] = $uid;
        $data ['addon'] = 'ShopCoupon';
        $data ['sn'] = uniqid ();
        $data ['cTime'] = NOW_TIME;
        $data ['token'] = $info ['token'];
        // 金额
        $data ['prize_title'] = $info ['money'];
        if ($info ['is_money_rand']) {
            $data ['prize_title'] = rand ( $info ['money'] * 100, $info ['money_max'] * 100 ) / 100;
        }
        $sn_id = $snDao->add ( $data );
        return $sn_id;
    }
    function getSelectList() {
        $map ['end_time'] = array (
            'gt',
            NOW_TIME
        );
        $map ['token'] = get_token ();
        $map ['is_del']=0;
        $list = $this->where ( $map )->field ( 'id,title' )->order ( 'id desc' )->select ();
        return $list;
    }
}
