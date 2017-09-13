<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class CollectModel extends Model {
	protected $tableName = 'shop_collect';
	function getMyCollect($uid,$update=false) {
	    $key = 'Collect_getMyCollect_' . $uid;
	    $info = S ( $key );
	    if ($info === false || $update) {
	        $map ['uid'] = $uid;
	        $info = $this->where ( $map )->field ( 'goods_id,cTime' )->order ( 'cTime desc' )->select ();
	        $goodsDao=D('Addons://Shop/Goods');
	        foreach ( $info as &$v ) {
// 	            $res [$v ['goods_id']] = $v ['goods_id'];
                $goods=$goodsDao->getInfo($v['goods_id']);
                $v=array_merge($v,$goods);
	        }
	        S($key,$info);
	    }
		
		
		return $info;
	}
	function addToCollect($uid, $goods_id) {
		$data ['uid'] = $uid;
		$data ['goods_id'] = $goods_id;
		
		$oldData=$this->where ( $data )->find();
		if ($oldData){
            $this->where($data)->delete();
            $res = - 1;
// 			$sdata ['cTime'] = NOW_TIME;
// 			$res1=$this->where($data)->save ( $sdata );
// 			if ($res1){
// 				$res = $oldData['id'];
// 			}
		}else{
			$data ['cTime'] = NOW_TIME;
			$res=$this->add ( $data );
		}
		if($res){
			$this->getMyCollect($uid,true);
		}
		return $res;
	}
}
