<?php

namespace Addons\Weiba\Model;

use Think\Model;

/**
 * 点赞模型
 */
class DiggModel extends Model {
	var $tableName = 'feed_digg';
	// 增加点赞
	function addDigg($feed_id, $uid) {
		$data ['feed_id'] = $feed_id;
		$data ['uid'] = $uid;
		$data ['cTime'] = NOW_TIME;
		$id = $this->add ( $data );
		return $id;
	}
	// 取消点赞
	function delDigg($feed_id, $uid) {
		$map ['feed_id'] = $feed_id;
		$map ['uid'] = $uid;
		$res = $this->where ( $map )->delete ();
		return $res;
	}
	// 获取动态的点赞总数
	function getCount($feed_id) {
		$map ['feed_id'] = $feed_id;
		$count = $this->where ( $map )->count ();
		return $count;
	}
	// 判断当前用户是否已经点赞
	function hasDigg($feed_ids, $uid) {
		$map ['uid'] = $uid;
		if (is_array ( $feed_ids )) {
			$map ['feed_id'] = array (
					'in',
					$feed_ids 
			);
		} else {
			$map ['feed_id'] = $feed_ids;
		}
		$list = $this->where ( $map )->getFields ( 'feed_id,id' );
		if (is_array ( $feed_ids )) {
			return $list;
		} else {
			return empty ( $list ) ? 0 : 1;
		}
	}
	function allDigg($uid){//所有我点过的赞
	    $map['uid'] =$uid;
	    $feed_id =$this->where($map)->getFields('feed_id');
	    $map1['id'] =array('in',$feed_id);
	    $list =D('Feed')->where($map1)->select();
	    return $list;
	}
}
