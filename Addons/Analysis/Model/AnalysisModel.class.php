<?php

namespace Addons\Analysis\Model;

use Think\Model;

/**
 * Analysis模型
 */
class AnalysisModel extends Model {
	function run($sports) {
		$start_time = $sports ['start_time'];
		$end_time = $start_time + 7200; // 一场比赛按两小时算
		if ($start_time > NOW_TIME || $sports ['is_finish']) { // 比赛未开始 或者已经结束统计的
			return false;
		}
		
		$is_finish = false;
		if ($end_time < NOW_TIME && $sports ['is_finish'] == 0) { // 比赛已经结束
			$is_finish = true;
		}
		
		$save1 = $this->udpateYaotv ( $sports, $is_finish );
		$save2 = $this->udpateDraw ( $sports, $is_finish );
		$save3 = $this->udpateDrum ( $sports, $is_finish );
		
		if ($is_finish) {
			$save = array_merge ( $save1, $save2, $save3 );
			$save ['is_finish'] = 1;
			
			$dao = D ( 'Addons://Sports/Sports' );
			$map ['id'] = $sports ['id'];
			$dao->where ( $map )->save ( $save );
			$dao->getInfo ( $sports ['id'], true );
		}
	}
	function udpateYaotv($sports, $is_finish) {
		$data ['sports_id'] = $map ['sports_id'] = $sports ['id'];
		$data ['type'] = $map ['type'] = 'yaotv';
		$list = $this->where ( $map )->field ( 'time' )->select ();
		foreach ( $list as $v ) {
			$listArr [$v ['time']] = 1;
		}
		
		$stime = $sports ['start_time'];
		for($i = 0; $i < 7; $i ++) {
			$etime = $stime + 900;
			$time = date ( 'H:i', $stime ) . '-' . date ( 'H:i', $etime );
			if ($i == 3)
				$time .= '（中场休息）';
			
			if (! isset ( $listArr [$time] ) && $etime < NOW_TIME) {
				$recodeArr [$time] = array (
						$stime,
						$etime 
				);
			}
			
			$stime = $etime;
		}
		
		if (! empty ( $recodeArr )) {
			foreach ( $recodeArr as $t => $v ) {
				$data ['time'] = $t;
				
				$list = $this->query ( "SELECT sum(count) as total FROM `wp_online_count` WHERE addon='sports' AND time >=" . date ( 'YmdHi', $v [0] ) . ' AND time<=' . date ( 'YmdHi', $v [1] ) );
				$data ['total_count'] = $list [0] ['total'];
				
				$list = $this->query ( "SELECT count(1) as num FROM `wp_sports_join` WHERE time >=" . $v [0] . ' AND time<=' . $v [1] );
				$data ['follow_count'] = $list [0] ['num'];
				
				$data ['aver_count'] = ceil ( $data ['total_count'] / $data ['follow_count'] );
				
				$this->add ( $data );
			}
		}
		
		if ($is_finish) {
			$where = 'time >=' . date ( 'YmdHi', $sports ['start_time'] ) . ' AND time<=' . date ( 'YmdHi', ($sports ['start_time'] + 7200) );
			
			$list = $this->query ( "SELECT sum(count) as total FROM `wp_online_count` WHERE addon='sports' AND " . $where );
			$save ['yaotv_count'] = $list [0] ['total'];
			
			$list = $this->query ( "SELECT count(1) as num FROM `wp_sports_join` WHERE time >=" . $sports ['start_time'] . ' AND time<=' . ($sports ['start_time'] + 7200) );
			$save ['yaotv_follow_count'] = $list [0] ['num'];
			
			return $save;
		}
	}
	function udpateDraw($sports, $is_finish) {
		$data ['sports_id'] = $map ['sports_id'] = $sports_id = $sports ['id'];
		$data ['type'] = $map ['type'] = 'draw';
		$map ['id'] = $this->where ( $map )->field ( 'id' )->select ();
		
		$list = $this->query ( 'SELECT count(DISTINCT(follow_id)) as num,sum(count) as total FROM `wp_draw_follow_log` WHERE sports_id=' . $sports_id );
		$data ['time'] = $sports ['time'];
		$data ['total_count'] = intval ( $list [0] ['total'] );
		$data ['follow_count'] = intval ( $list [0] ['num'] );
		$data ['aver_count'] = ceil ( $data ['total_count'] / $data ['follow_count'] );
		
		if ($map ['id']) {
			$this->where ( $map )->save ( $data );
		} else {
			$this->add ( $data );
		}
		
		if ($is_finish) {
			$list = $this->query ( 'SELECT count(DISTINCT(follow_id)) as num,sum(count) as total FROM `wp_draw_follow_log` WHERE sports_id=' . $sports_id );
			$save ['draw_count'] = $list [0] ['total'];
			$save ['draw_follow_count'] = $list [0] ['num'];
			
			return $save;
		}
	}
	function udpateDrum($sports, $is_finish) {
		$data ['sports_id'] = $map ['sports_id'] = $sports_id = $sports ['id'];
		$data ['type'] = $map ['type'] = 'drum';
		$list = $this->where ( $map )->field ( 'time' )->select ();
		foreach ( $list as $v ) {
			$listArr [$v ['time']] = 1;
		}
		
		$stime = $sports ['start_time'];
		for($i = 0; $i < 7; $i ++) {
			$etime = $stime + 900;
			$time = date ( 'H:i', $stime ) . '-' . date ( 'H:i', $etime );
			if ($i == 3)
				$time .= '（中场休息）';
			
			if (! isset ( $listArr [$time] ) && $etime < NOW_TIME) {
				$recodeArr [$time] = array (
						$stime,
						$etime 
				);
			}
			
			$stime = $etime;
		}
		
		if (! empty ( $recodeArr )) {
			foreach ( $recodeArr as $t => $v ) {
				$list = $this->query ( 'SELECT count(DISTINCT(follow_id)) as num,sum(drum_count) as total FROM `wp_sports_drum` WHERE sports_id=' . $sports_id . ' AND cTime >' . $v [0] . ' AND cTime<' . $v [1] );
				$data ['time'] = $t;
				$data ['total_count'] = $list [0] ['total'];
				$data ['follow_count'] = $list [0] ['num'];
				$data ['aver_count'] = ceil ( $data ['total_count'] / $data ['follow_count'] );
				
				$this->add ( $data );
			}
		}
		
		if ($is_finish) {
			$list = $this->query ( 'SELECT count(DISTINCT(follow_id)) as num FROM `wp_sports_drum` WHERE sports_id=' . $sports_id );
			$save ['drum_follow_count'] = $list [0] ['num'];
			
			$list = $this->query ( "SELECT team_id, sum(drum_count) as num FROM `wp_sports_drum` WHERE sports_id='$sports_id' GROUP BY team_id" );
			foreach ( $list as $v ) {
				$save ['drum_count'] += $support ['team_id_' . $v ['team_id']] = $v ['num'];
			}
			
			$save ['home_team_support_count'] = intval ( $support ['team_id_' . $sports ['home_team_arr'] ['id']] );
			$save ['visit_team_support_count'] = intval ( $support ['team_id_' . $sports ['visit_team_arr'] ['id']] );
			
			return $save;
		}
	}
}
