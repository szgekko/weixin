<?php

namespace Addons\MiniLive\Model;
use Think\Model;

/**
 * Sponsor模型
 * 赞助商
 */
class MiniShakeModel extends Model{
    
    function getInfo($id, $field = '', $update = false, $data = array()) {
		$key = 'MiniShake_getInfo_' . $id;
		$info = S ( $key );
		if ($info === false || $update) {
			$info = empty ( $data ) ? $this->field ( true )->find ( $id ) : $data;
			S ( $key, $info, 86400 );
		}
		return empty ( $field ) ? $info : $info [$field];
	}
    
    // 通用的清缓存的方法
    function clear($shakeIds, $type = '', $uid = '') {
        is_array ( $shakeIds ) || $shakeIds = explode ( ',', $shakeIds );
    
        foreach ( $shakeIds as $shakeId ) {
            $this->getInfo($shakeId,'',true);
            $this->getAwardlists ( $shakeId, true );
        }
    }
    //获取设置的奖品
    function getAwardlists($shakeId,$update=false){
        $key = 'MiniShake_getAwardlists_' . $shakeId;
        $info = S ( $key );
        if ($info === false || $update) {
            $map['shake_id']=$shakeId;
            $map['token']=get_token();
            $map ['is_del']=0;
            $awardDao=D('Addons://Draw/Award');
            $info=M('mini_shake_award')->where($map)->order('`order` asc')->select();
            foreach ($info as &$v){
                $award=$awardDao->getInfo($v['award_id']);
                if ($award){
                    unset($award['id']);
                    $v=array_merge($v,$award);
                }                
            }
            S ( $key, $info, 86400 );
        }
        return $info;
    }
    
    function setCount($id, $field = '', $num = 1, $info = array()) {
        $map ['id'] = $id;
//         $save [$field] = array (
//             'exp',
//             "`$field`+$num"
//         );
//         $res = $this->where ( $map )->setField ( $save );
        // lastsql ();
        // dump ( $res );
//         return $res;
    
        // addWeixinLog ( $field, 'set_count_' . $id );
        $info = $this->getInfo ( $id );
        if (! empty ( $field )) { // 更新到缓存中
            $info [$field] += $num;
            // dump ( '更新缓存：' . $field . '__' . $info [$field] );
            $this->getInfo ( $id, '', true, $info );
        }
        $key = 'MiniShake_setCount_' . $id;
        $cache = S ( $key );
    
        $falt1 = empty ( $cache ); // 首次保存，存入缓存
        $falt2 = NOW_TIME - $cache ['time'] > 100; // 缓存时间超过60秒存入数据库，否则存入缓存
        $falt3 = $info [$field] - $cache ['save'] [$field] > 5; // 缓存计数超过100时存入数据库，否则存入缓存
        $falt4 = empty ( $field ); // 清缓存操作，直接把缓存里已有的数据入库
    
        if (! $falt1 && ($falt2 || $falt3 || $falt4)) { // 存入数据库
            $map ['id'] = $id;
            $save = array ();
            foreach ( $cache ['save'] as $f => $vo ) {
                $save [$f] = $info [$f];
            }
            $this->where ( $map )->save ( $save );
            S ( $key, NULL );
        } elseif (! $falt4) { // 存入缓存
            if (empty ( $cache ['time'] )) {
                $cache ['time'] = NOW_TIME;
            }
            if (! isset ( $cache ['save'] [$field] )) {
                $cache ['save'] [$field] = $info [$field];
            }
            	
            S ( $key, $cache );
        }
    }
    
    function getLuckyUserLists($liveId,$shakeCount,$uid=0,$prizeId=0,$state='-1'){
        $map['token']=get_token();
        $map['live_id']=$liveId;
        if ($shakeCount != -1){
        	$map['shake_count']=$shakeCount;
        }
        if ($uid !=0){
            $map['uid']=$uid;
        }
        if ($state != '-1'){
            $map['state']=$state;
        }
        if ($uid !=0 && $prizeId !=0){
            $map['uid']=$uid;
            $map['award_id']=$prizeId;
        }
        $lists=M('shake_prize_user')->where($map)->order('id desc')->select();
        
        $liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($liveId);
        $awardLists=$this->getAwardlists($liveInfo['shake_id']);
        foreach ($awardLists as $a){
            $awardData[$a['id']]=$a;
        }
        foreach ($lists as &$v){
            if ($awardData[$v['award_id']]){
                $v=array_merge($v,$awardData[$v['award_id']]);
            }
            $user=get_userinfo($v['uid']);
            $v['nickname']=$user['nickname'];
            $v['headimgurl']=$user['headimgurl'];
        }
        return $lists;
    }
    //返回奖品信息
    function getPrize($livePrizeId){
        if(empty($livePrizeId)){
            return false;
        }
        $prizeInfo=M('mini_shake_award')->find($livePrizeId);
        $awardInfo=D('Addons://Draw/Award')->getInfo($prizeInfo['award_id']);
        unset($awardInfo['id']);
        $prizeInfo=array_merge($prizeInfo,$awardInfo);
        return $prizeInfo;
    }
    //已抽中奖品数量
    function getLuckyAwardNum($liveId){
        $map['token']=get_token();
        $map['live_id']=$liveId;
        $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveId);
        $map['shake_count']=$monitor['shake_count']+1;
        $lists=M('shake_prize_user')->where($map)->field('award_id,sum(num) as total')->group('award_id')->select();
        foreach ($lists as $vv){
            $data[$vv['award_id']]=$vv['total'];
        }
        return $data;
    }
    //获取排名
    function get_ranking($liveId,$prizeId=0){
        $map['live_id']=$liveId;
        if ($prizeId !=0) {
            $map['award_id']=$prizeId;
        }
        $count=M('shake_prize_user')->where($map)->count();
        $count++;
        return $count;
    }
    
    //是否可以发表获取感言
    function send_prize_content($live_id,$uid=0,$shake_count=0, $update = false, $data = array()){
        $key = 'MiniShake_send_prize_content_' . $uid.'_'.$live_id;
        $info = S ( $key );
        if ($info === false || $update) {
            if ($uid !=0){
                $map['uid']=$uid;
            }
            if ($shake_count !=0){
                $map['shake_count']=$shake_count;
            }
            $map['live_id']=$live_id;
            if (empty($data)){
                $info=M('shake_prize_content')->where($map)->find();
            }else{
                $info=$data;
            }
            S ( $key, $info, 86400 );
        }
        return $info ;
    }
    
    //获取参与人数 //返回参与人数user_num 参与次数 join_count"
    function get_user_attend($liveId,$shakeId,$shakeCount,$uid=0,$field='',$type='all'){
        $map['live_id']=$liveId;
        $map['shake_id']=$shakeId;
        $map['shake_count']=$shakeCount;
        if ($uid != 0){
            $map['uid']=$uid;
        }
        if ($type != 'all'){
        	$map['join_count']=array('gt',0);
        }
        $info=M('shake_user_attend')->where($map)->field('count(uid) as user_num,sum(join_count) as attend_num')->select();
        $data['user_num']=intval($info[0]['user_num']);
        $data['join_count']=intval($info[0]['attend_num']);
        return empty($field)?$data:$data[$field];
    }
    function getUserShake($liveId,$shakeId,$shakeCount,$uid,$update=false,$data=array()){
    	$key='MiniShake_getUserShake_'.$liveId.'_'.$shakeId.'_'.$shakeCount.'_'.$uid;
    	$info=S($key);
    	if($info === false || $update){
    		$map['live_id']=$liveId;
    		$map['shake_id']=$shakeId;
        	$map['shake_count']=$shakeCount;
        	$map['uid']=$uid;
    		$info = empty($data)?M('shake_user_attend')->where($map)->find():$data;
    		S ( $key, $info, 86400 );
    	}
    	return $info;
    }
    function setShakeCount($liveId,$shakeId,$shakeCount,$uid, $field = '', $num = 1, $info = array()) {
    	$map['live_id']=$liveId;
    	$map['shake_id']=$shakeId;
        $map['shake_count']=$shakeCount;
        $map['uid']=$uid;
    	//         $save [$field] = array (
    	//             'exp',
    	//             "`$field`+$num"
    	//         );
    	//         $res = $this->where ( $map )->setField ( $save );
    	// lastsql ();
    	// dump ( $res );
    	//         return $res;
    
    	// addWeixinLog ( $field, 'set_count_' . $id );
    	$info = $this->getUserShake($liveId,$shakeId,$shakeCount,$uid );
    	if (! empty ( $field )) { // 更新到缓存中
    		$info [$field] = $num;
    		// dump ( '更新缓存：' . $field . '__' . $info [$field] );
    		$this->getUserShake($liveId,$shakeId,$shakeCount,$uid,true,$info);
    	}
    	$key = 'MiniShake_setShakeCount_' . $liveId.'_'.$shakeId.'_'.$shakeCount.'_'.$uid;
    	$cache = S ( $key );
    
    	$falt1 = empty ( $cache ); // 首次保存，存入缓存
    	$falt2 = NOW_TIME - $cache ['time'] > 100; // 缓存时间超过60秒存入数据库，否则存入缓存
    	$falt3 = $info [$field] - $cache ['save'] [$field] > 5; // 缓存计数超过100时存入数据库，否则存入缓存
    	$falt4 = empty ( $field ); // 清缓存操作，直接把缓存里已有的数据入库
    
    	if (! $falt1 && ($falt2 || $falt3 || $falt4)) { // 存入数据库
    		$save = array ();
    		foreach ( $cache ['save'] as $f => $vo ) {
    			$save [$f] = $info [$f];
    		}
    		M('shake_user_attend')->where ( $map )->save ( $save );
    		S ( $key, NULL );
    	} elseif (! $falt4) { // 存入缓存
    		if (empty ( $cache ['time'] )) {
    			$cache ['time'] = NOW_TIME;
    		}
    		if (! isset ( $cache ['save'] [$field] )) {
    			$cache ['save'] [$field] = $info [$field];
    		}
    		S ( $key, $cache );
    	}
    }
    
}
