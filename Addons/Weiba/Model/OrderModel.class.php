<?php

namespace Addons\Weiba\Model;

use Think\Model;

/**
 * Feed模型
 */
class OrderModel extends Model {
	var $tableName = 'feed_order';
	// 增加订单
	function addOrder($data) {
		$data ['cTime'] = NOW_TIME;
		$id = $this->add ( $data );
		return $id;
	}
	function getType($feed_id,$uid){
	    $map['feed_id'] =$feed_id;
	    $map['uid'] =$uid;
	    $type =$this->where($map)->find('send_type');
	    return $type;
	}
	function getOrders($uid){
	    $map['uid'] =$uid;
	   
	    $orders =$this->where($map)->select();
	   
	    return $orders;
	}
}
