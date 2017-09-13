<?php

namespace Addons\Weiba\Model;

use Think\Model;

/**
 * 评论回复模型
 */
class ReplyModel extends Model {
	var $tableName = 'feed_reply';
	// 增加评论
	function addReply($feed_id, $uid, $content, $img_ids = '') {
		$data ['feed_id'] = $feed_id;
		$data ['uid'] = $uid;
		$data ['content'] = $content;
		$data ['img_ids'] = $img_ids;
		$data ['cTime'] = NOW_TIME;
		$id = $this->add ( $data );
		
		return $id;
	}
	// 获取某条评论的信息
	function getInfo($id) {
		$map ['id'] = $id;
		$info = $this->where ( $map )->find ();
		return $info;
	}
	// 获取评论列表，带分布
	function getList($feed_id) {
		$map ['feed_id'] = $feed_id;
		$map ['is_del'] = 0;
		$list = $this->where ( $map )->order ( 'id desc' )->selectPage ();
		foreach ( $list ['list_data'] as &$vo ) {
			$user = getUserInfo ( $vo ['uid'] );
			$vo ['headimgurl'] = $user ['headimgurl'];
			$vo ['nickname'] = $user ['nickname'];
		}
		return $list;
	}
	// 获取动态的评论总数
	function getCount($feed_id) {
		$map ['feed_id'] = $feed_id;
		$map ['is_del'] = 0;
		$count = $this->where ( $map )->count ();
		return $count;
	}
	// 删除某条评论
	function delReply($id) {
		$save ['is_del'] = 1;
		$map ['id'] = $id;
		return $this->where ( $map )->save ( $save );
	}
	function getReply($map){
	   
	    $reply_list =$this->where($map)->select();
	    foreach ($reply_list as &$v){
	        $map2['id'] =$v['feed_id'];
	        $v['feed_id'] = D('feed')->where($map2)->find();
	    }
	     
	   return $reply_list; 
	}
}
