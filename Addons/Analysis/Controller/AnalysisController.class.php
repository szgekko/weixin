<?php

namespace Addons\Analysis\Controller;

use Home\Controller\AddonsController;

class AnalysisController extends AddonsController {
	function _initialize() {
		parent::_initialize ();
		
		$action = strtolower ( _ACTION );
		$res ['title'] = '数据统计';
		$res ['url'] = addons_url ( 'Analysis://Analysis/lists' ,$this->get_param );
		$res ['class'] = $action == 'lists' || $action == 'lists2' ? 'current' : '';
		$nav [] = $res;
		$param['mdm']=$_GET['mdm'];
		$param ['sports_id'] = I ( 'sports_id' );
		if ($action == 'yaotv') {
			$res ['title'] = '摇一摇统计';
			$res ['url'] = addons_url ( 'Analysis://Analysis/yaotv', $param );
			$res ['class'] = 'current';
			$nav [] = $res;
		} else if ($action == 'drum') {
			$res ['title'] = '擂鼓次数统计';
			$res ['url'] = addons_url ( 'Analysis://Analysis/drum', $param );
			$res ['class'] = 'current';
			$nav [] = $res;
		} else if ($action == 'draw') {
			$res ['title'] = '抽奖统计';
			$res ['url'] = addons_url ( 'Analysis://Analysis/draw', $param );
			$res ['class'] = 'current';
			$nav [] = $res;
		}
		
		$this->assign ( 'nav', $nav );
	}
	function lists() {
		$publicid = get_token_appinfo ( '', 'id' );
		// 更新memcache中摇电视的缓存
		wp_file_get_contents ( SITE_URL . '/online_check.php?deal_cache=1&publicid=' . $publicid . '&addon=Sports&aim_id=0' );
		
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'search_button', false );
		$this->assign ( 'check_all', false );
		
		$model = $this->getModel ( 'sports' );
		
		$list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
		
		$grid ['field'] [0] = 'start_time|time_format';
		$grid ['title'] = '比赛场次';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'vs_team';
		$grid ['title'] = '对战球队（主场VS客场）';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'yaotv_count';
		$grid ['title'] = '摇一摇总次数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'drum_count';
		$grid ['title'] = '助威总次数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'draw_count';
		$grid ['title'] = '抽奖总次数';
		$list_grids [] = $grid;
		$list_data ['list_grids'] = $list_grids;
		
		$dao = D ( 'Addons://Sports/Sports' );
		$daos = D ( 'Analysis' );
		$draw_log = D ( 'DrawFollowLog' );
		foreach ( $list_data ['list_data'] as &$vo ) {
			$yaotvCount = $dao->getYaotvCount ( $vo ['id'] );
			$vo = $dao->getInfo ( $vo ['id'] );
			$param ['sports_id'] = $vo ['id'];
			
			$map ['sports_id'] = $vo ['id'];
			$map ['type'] = 'drum';
			$drum_total = $daos->where ( $map )->field ( 'sum(total_count) as drum_total' )->select ();
			$vo ['yaotv_count'] = "<a href='" . U ( 'yaotv', $param ) . "'>" . $yaotvCount ['yaotv_count'] . '</a>';
			$vo ['drum_count'] = "<a href='" . U ( 'drum', $param ) . "'>" . intval ( $drum_total [0] ['drum_total'] ) . '</a>';
			// $vo ['drum_count'] = "<a href='" . U ( 'drum', $param ) . "'>" . $vo ['drum_count'] . '</a>';
			// $vo ['draw_count'] = "<a href='" . U ( 'draw', $param ) . "'>" . $vo ['draw_count'] . '</a>';
			$map2 ['sports_id'] = $vo ['id'];
			$map2['uid']=$this->mid;
			$draw_total = $draw_log->where ( $map2 )->field ( 'sum(count) as draw_total' )->select ();
			$vo ['draw_count'] = "<a href='" . U ( 'draw', $param ) . "'>" . intval ( $draw_total [0] ['draw_total'] ) . '</a>';
			
			$daos->run ( $vo );
		}
		$this->assign ( $list_data );
		// dump($list_data);
		
		$this->display ();
	}
	function lists2() {
		$publicid = get_token_appinfo ( '', 'id' );
		// 更新memcache中摇电视的缓存
		wp_file_get_contents ( SITE_URL . '/online_check.php?deal_cache=1&publicid=' . $publicid . '&addon=Lzwg&aim_id=0' );
		
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'search_button', false );
		$this->assign ( 'check_all', false );
		
		$model = $this->getModel ( 'lzwg_activities' );
		
		$list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
		
		$grid ['field'] [0] = 'title';
		$grid ['title'] = '活动名称';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'join_count';
		$grid ['title'] = '参与人次';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'join_follow';
		$grid ['title'] = '参与人数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'comment_follow';
		$grid ['title'] = '评论人数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'comment_count';
		$grid ['title'] = '评论总数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'draw_follow';
		$grid ['title'] = '抽奖人数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'lucky_follow';
		$grid ['title'] = '中奖人数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'vote_follow';
		$grid ['title'] = '答题投票人数';
		$list_grids [] = $grid;
		
		$list_data ['list_grids'] = $list_grids;
		
		foreach ( $list_data ['list_data'] as $v ) {
			$ids [$v ['id']] = $v ['id'];
		}
		$ids = implode ( ',', $ids );
		if (! empty ( $ids )) {
			//$sql = 'SELECT lzwg_id, count(follow_id) as follow, sum(count) as count FROM `wp_lzwg_log` WHERE lzwg_id IN(' . $ids . ') GROUP BY lzwg_id';
			//$res = M ()->query ( $sql );
			foreach ( $res as $r ) {
				$joinArr [$r ['lzwg_id']] ['count'] = $r ['count'];
				$joinArr [$r ['lzwg_id']] ['follow'] = $r ['follow'];
			}
			
			$sql = 'SELECT aim_id, count(1) as count, count(DISTINCT follow_id) as follow FROM `wp_comment` WHERE aim_table="lzwg" AND aim_id IN(' . $ids . ') GROUP BY aim_id';
			$res = M ()->query ( $sql );
			foreach ( $res as $r ) {
				$commentArr [$r ['aim_id']] ['count'] = $r ['count'];
				$commentArr [$r ['aim_id']] ['follow'] = $r ['follow'];
			}
			
			$sql = 'SELECT draw_id, count(DISTINCT follow_id) as follow FROM `wp_lucky_follow` WHERE uid=' . $this->mid . ' GROUP BY draw_id';
			$res = M ()->query ( $sql );
			foreach ( $res as $r ) {
				$luckyArr [$r ['draw_id']] ['follow'] = $r ['follow'];
			}
			
			$sql = 'SELECT sports_id, count(DISTINCT follow_id) as follow FROM `wp_draw_follow_log` WHERE uid=' . $this->mid . ' GROUP BY sports_id';
			$res = M ()->query ( $sql );
			foreach ( $res as $r ) {
				$drawArr [$r ['sports_id']] ['follow'] = $r ['follow'];
			}
			
			//$sql = 'SELECT activity_id, count(DISTINCT user_id) as follow FROM `wp_lzwg_vote_log` WHERE activity_id IN(' . $ids . ') GROUP BY activity_id';
			//$res = M ()->query ( $sql );
			//foreach ( $res as $r ) {
				//$voteArr [$r ['activity_id']] ['follow'] = $r ['follow'];
			//}
		}
		
		foreach ( $list_data ['list_data'] as &$vo ) {
			$id = $vo ['id'];
			$vo ['join_count'] = intval ( $joinArr [$id] ['count'] );
			$vo ['join_follow'] = intval ( $joinArr [$id] ['follow'] );
			$vo ['comment_follow'] = intval ( $commentArr [$id] ['follow'] );
			$vo ['comment_count'] = intval ( $commentArr [$id] ['count'] );
			$vo ['draw_follow'] = intval ( $drawArr [$id] ['follow'] );
			$vo ['lucky_follow'] = intval ( $luckyArr [$id] ['follow'] );
			$vo ['vote_follow'] = intval ( $voteArr [$id] ['follow'] );
		}
		$this->assign ( $list_data );
		// dump($list_data);
		
		$this->display ( 'lists' );
	}
	function yaotv() {
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'search_button', false );
		$this->assign ( 'check_all', false );
		
		$sports_id = I ( 'sports_id' );
		
		$grid ['field'] [0] = 'time';
		$grid ['title'] = '赛时时间';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'total_count';
		$grid ['title'] = '摇奖总人次';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'follow_count';
		$grid ['title'] = '参与摇奖总人数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'aver_count';
		$grid ['title'] = '每人平均摇次数';
		$list_grids [] = $grid;
		$list_data ['list_grids'] = $list_grids;
		
		$info = D ( 'Addons://Sports/Sports' )->getInfo ( $sports_id );
		$yaotvCount = D ( 'Addons://Sports/Sports' )->getYaotvCount ( $sports_id );
		$info ['yaotv_follow_count'] = $yaotvCount ['yaotv_follow_count'];
		$info ['yaotv_count'] = $yaotvCount ['yaotv_count'];
		// dump ( $info );
		$this->assign ( 'info', $info );
		
		// D ( 'Analysis' )->udpateYaotv ( $info ['id'], $info ['start_time'] );
		
		$map ['sports_id'] = $sports_id;
		$map ['type'] = 'yaotv';
		$list_data ['list_data'] = D ( 'Analysis' )->where ( $map )->select ();
		
		$this->assign ( $list_data );
		// dump($list_data);
		
		$this->display ();
	}
	function drum() {
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'search_button', false );
		$this->assign ( 'check_all', false );
		
		$sports_id = I ( 'sports_id' );
		
		$grid ['field'] [0] = 'time';
		$grid ['title'] = '赛时时间';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'total_count';
		$grid ['title'] = '参与擂鼓总次数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'follow_count';
		$grid ['title'] = '参与擂鼓总人数';
		$list_grids [] = $grid;
		
		$grid ['field'] [0] = 'aver_count';
		$grid ['title'] = '每人平均擂鼓次数';
		$list_grids [] = $grid;
		$list_data ['list_grids'] = $list_grids;
		
		$info = D ( 'Addons://Sports/Sports' )->getInfo ( $sports_id );
		$this->assign ( 'info', $info );
		
		// D ( 'Analysis' )->udpateDrum ( $info ['id'], $info ['start_time'] );
		
		$map ['sports_id'] = $sports_id;
		$map ['type'] = 'drum';
		$list_data ['list_data'] = D ( 'Analysis' )->where ( $map )->select ();
		// 擂鼓总次数
		$drum_total = D ( 'Analysis' )->where ( $map )->field ( 'sum(total_count) as drum_total,sum(follow_count) as follow_total' )->select ();
		$this->assign ( 'drum_total', intval ( $drum_total [0] ['drum_total'] ) );
		$this->assign ( 'follow_total', intval ( $drum_total [0] ['follow_total'] ) );
		$this->assign ( $list_data );
		// dump($list_data);
		
		$this->display ();
	}
	function draw() {
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'search_button', false );
		$this->assign ( 'check_all', false );
		
		$sports_id = I ( 'sports_id' );
		
		$dao = D ( 'Addons://Sports/Sports' );
		
		$info = $dao->getInfo ( $sports_id );
		
		$map2 ['sports_id'] = $sports_id;
		$draw_total = D ( 'DrawFollowLog' )->where ( $map2 )->field ( 'sum(count) as draw_total,count(follow_id) as draw_follow_count' )->select ();
		
		$list = $dao->query ( 'SELECT count(1) as total, sum(state) as num FROM `wp_lucky_follow` WHERE sport_id=' . $sports_id );
		$info ['has_count'] = intval ( $list [0] ['total'] );
		$info ['use_count'] = intval ( $list [0] ['num'] );
		$info ['draw_count'] = intval ( $draw_total [0] ['draw_total'] );
		$info ['draw_follow_count'] = intval ( $draw_total [0] ['draw_follow_count'] );
		// dump ( $info );
		$this->assign ( 'info', $info );
		
		$this->display ();
	}
}
