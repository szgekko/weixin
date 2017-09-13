<?php

namespace Addons\Weiba\Model;

use Think\Model;

/**
 * 活动报名表模型
 */
class JoinModel extends Model {
	var $tableName = 'feed_join';
	function getJoinFeed($uid){//获取参与的活动
	    $map['uid'] =$uid;
	    $feed_id =$this->where($map)->getFields('feed_id');
	    return $feed_id;
	}
	function getAllJoin($feed_id){//获取活动的参与者
	    $map['feed_id'] =$feed_id;
	    $list =$this->where($map)->select();
	    return $list;
	}
	function hasJoin($feed_id,$uid){
	    $map['feed_id'] =$feed_id;
	    $map['uid'] =$uid;
	    $join =$this->where($map)->find();
	    return $join ? 1 : 0;
	    
	}
}
