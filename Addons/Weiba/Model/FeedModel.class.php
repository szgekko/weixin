<?php

namespace Addons\Weiba\Model;

use Think\Model;

/**
 * Feed模型
 */
class FeedModel extends Model {
	function getInfo($id, $need_deal = true) {
		$map ['id'] = $id;
		$map ['is_del'] = 0;
		$feed = $this->where ( $map )->find ();
		$need_deal && $feed = $this->_deal_feed ( $feed, $icon_show );
		return $feed;
	}
	function getList($map) {
		$map ['is_del'] = 0;
		$list = $this->where ( $map )->field ( true )->limit ( 10 )->order ( 'id desc' )->selectPage ();
		foreach ( $list ['list_data'] as $k => $vo ) {
			$list ['list_data'] [$k] = $this->_deal_feed ( $vo );
		}
		return $list;
	}
	// 增加动态
	function addFeed($data) {
		$data ['cTime'] = NOW_TIME;
		$data ['img_ids'] = trim ( $data ['img_ids'], ',' );
		$data ['content'] = filter_badword ( $data ['content'] );
		empty ( $data ['event_time'] ) || $data ['event_time'] = strtotime ( $data ['event_time'] );
		$res = $this->add ( $data );
		return $res;
	}
	// 更新统计数
	function updateCount($feed_id, $field, $reply_count) {
		$map ['feed_id'] = $feed_id;
		$save [$field] = $reply_count;
		return $this->where ( $map )->save ( $save );
	}
	function _deal_feed($feed) {
		$feed ['cTime'] = time_format ( $feed ['cTime'] );
		
		// 图片转换
		if (! empty ( $feed ['img_ids'] )) {
			$feed ['img_ids'] = array_filter ( explode ( ',', $feed ['img_ids'] ) );
			foreach ( $feed ['img_ids'] as $key => $id ) {
				$feed ['img_ids'] [$key] = get_cover_url ( $id );
			}
		}
		
		// 表情图标转换
		preg_match_all ( '/\[\w+\]/i', $feed ['content'], $matches );
		$matches = array_unique ( $matches [0] );
		foreach ( $matches as $k => $m ) {
			$m = ltrim ( $m, '[' );
			$m = rtrim ( $m, ']' );
			$icons [$k] = '<img width="30px" height="30px" src="' . SITE_URL . '/Public/static/face/ts/' . $m . '.gif" />';
		}
		$feed ['content'] = str_replace ( $matches, $icons, $feed ['content'] );
		
		// 用户信息
		$user = get_userinfo ( $feed ['uid'] );
		if (empty ( $user )) {
			$user ['headimgurl'] = SITE_URL . '/Public/static/face/default_head_50.png';
			$user ['nickname'] = '匿名';
		}
		$feed = array_merge ( $feed, $user );
		
		// 活动报名列表
		if ($feed ['feed_type'] == 2 && $feed ['event_count'] > 0) {
			$map ['feed_id'] = $feed ['id'];
			$feed ['event_list'] = D ( 'Join' )->where ( $map )->limit ( 10 )->order ( 'id desc' )->select ();
			$map ['uid'] = $GLOBALS ['mid'];
			$feed ['has_join'] = intval ( D ( 'Join' )->where ( $map )->getField ( 'id' ) );
		}
		// 是否已点赞
		$feed ['has_digg'] = D ( 'Digg' )->hasDigg ( $feed ['id'], $GLOBALS ['mid'] );
		
		return $feed;
	}
	function getFeed($uid,$field=''){//获取动态
	    $map['uid'] =$uid;
	    
	 if($field){
	     $feed =$this->where($map)->getFields($field);
	 }else{
	     $feed =$this->where($map)->select();
	     }
	    
	    return $feed;
	}
	function getUid($feed_id){
	    $map['id'] =$feed_id;
	    
	    $uid =$this->where($map)->getField('uid');
	   
	    return $uid;
	    
	}
	
	    
}
