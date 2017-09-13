<?php

namespace Addons\YaoTV\Controller;

use Home\Controller\AddonsController;

class YaoTVController extends AddonsController {
	function _initialize() {
		parent::_initialize ();
		
		$action = strtolower ( _ACTION );
		
		$res ['title'] = '节目管理';
		$res ['url'] = addons_url ( 'YaoTV://YaoTV/lists' );
		$res ['class'] = $action == 'lists' ? 'current' : '';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
	}
	function main() {
		$this->display ();
	}
	function lists() {
		// exit ();
		// $map ['date'] = date ( 'Y-m-d' );
		$map ['end_stamp'] = array (
				'gt',
				NOW_TIME 
		);
		$list = M ( 'yaotv' )->where ( $map )->order ( 'begin_stamp asc' )->selectPage ();
		foreach ( $list ['list_data'] as $v ) {
			$yaotv_ids [$v ['id']] = $v ['id'];
			$datas [$v ['id']] = $v;
		}
		// dump ( $list );
		
		if (! empty ( $yaotv_ids )) {
			$map2 ['yaotv_id'] = array (
					'in',
					$yaotv_ids 
			);
			$activities = M ( 'yaotv_activities' )->where ( $map2 )->select ();
			foreach ( $activities as $act ) {
				$datas [$act ['yaotv_id']] ['activities'] [] = $act;
			}
		}
		$list ['list_data'] = $datas;
		$this->assign ( $list );
		// 初始化数据
		$this->assign ( 'now_day', date ( 'Y-m-d' ) );
		$this->assign ( 'end_day', date ( 'Y-m-d', NOW_TIME + 604800 ) );
		// 节目列表
		$this->display ();
	}
	function add_program() {
		$data ['date_format'] = I ( 'date' );
		$data ['date'] = $day = str_replace ( '-', '', $data ['date_format'] );
		$data ['begin_stamp'] = $this->_get_stamp ( I ( 'begin_stamp' ), $day );
		$data ['end_stamp'] = $this->_get_stamp ( I ( 'end_stamp' ), $day );
		$data ['name'] = I ( 'name' );
		$data ['uid'] = $this->mid;
		$res = $this->_check_program ( $data );
		if ($res ['status'] == 1) {
			$res ['id'] = M ( 'yaotv' )->add ( $data );
			
			$result = $this->sync_program ( $data ['date'] );
			if ($result ['errcode'] != 0) {
				$res ['status'] = 0;
				$res ['msg'] = error_msg ( $result );
			}
		}
		// dump ( $data );
		// dump ( $_POST );
		
		$res ['edit_act_url'] = U ( 'activities', array (
				'yaotv_id' => $res ['id'] 
		) );
		$this->ajaxReturn ( $res, 'JSON' );
	}
	function edit_program() {
		$map ['id'] = I ( 'id' );
		
		$data ['date_format'] = I ( 'date' );
		$data ['date'] = $day = str_replace ( '-', '', $data ['date_format'] );
		$data ['begin_stamp'] = $this->_get_stamp ( I ( 'begin_stamp' ), $day );
		$data ['end_stamp'] = $this->_get_stamp ( I ( 'end_stamp' ), $day );
		$data ['name'] = I ( 'name' );
		$res = $this->_check_program ( $data, $map ['id'] );
		if ($res ['status'] == 1) {
			$re = M ( 'yaotv' )->where ( $map )->save ( $data );
			$result = $this->sync_program ( $data ['date'] );
			if ($result ['errcode'] != 0) {
				$res ['status'] = 0;
				$res ['msg'] = error_msg ( $result );
			}
		}
		$res ['id'] = $map ['id'];
		
		$res ['edit_act_url'] = U ( 'activities', array (
				'yaotv_id' => $res ['id'] 
		) );
		$this->ajaxReturn ( $res, 'JSON' );
	}
	private function _check_program($data, $id = 0) {
		$msg ['status'] = 0;
		if ($data ['begin_stamp'] < NOW_TIME) {
			$msg ['msg'] = '开始时间不能早于当前时间';
			return $msg;
		}
		
		if ($data ['end_stamp'] <= $data ['begin_stamp']) {
			$msg ['msg'] = '结束时间不能早于开始时间';
			return $msg;
		}
		
		$map ['uid'] = $this->mid;
		$map ['begin_stamp'] = array (
				'gt',
				mktime ( 0, 0, 0, date ( 'm' ), date ( 'd' ), date ( 'Y' ) ) 
		);
		$id == 0 || $map ['id'] = array (
				'exp',
				'!=' . $id 
		);
		$list = M ( 'yaotv' )->where ( $map )->field ( 'name,begin_stamp,end_stamp' )->select ();
		if ($list) {
			foreach ( $list as $v ) {
				if (! ($data ['begin_stamp'] >= $v ['end_stamp'] || $data ['end_stamp'] <= $v ['begin_stamp'])) {
					$msg ['msg'] = '该时间段内与 ' . $v ['name'] . ' 节目冲突';
					return $msg;
				}
			}
		}
		
		if (empty ( $data ['name'] )) {
			$msg ['msg'] = '节目名称不能为空';
			return $msg;
		}
		$msg ['status'] = 1;
		return $msg;
	}
	function _get_stamp($time, $date) {
		return strtotime ( $date . ' ' . $time );
	}
	function del_yaotv() {
		$map ['id'] = $map2 ['yaotv_id'] = I ( 'id' );
		$date = M ( 'yaotv' )->where ( $map )->getField ( 'date' );
		$res = M ( 'yaotv' )->where ( $map )->delete ();
		if ($res) {
			M ( 'yaotv_activities' )->where ( $map2 )->delete ();
			
			$this->sync_program ( $date );
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败' );
		}
	}
	function import_yaotv() {
		$attach_id = I ( 'id' );
		
		$column = array (
				'A' => 'date',
				'B' => 'id',
				'C' => 'name',
				'D' => 'begin',
				'E' => 'end' 
		);
		
		$res = importFormExcel ( $attach_id, $column );
		// dump ( $res );
		// exit ();
		if ($res ['status'] == 0) {
			$this->error ( $res ['data'] );
		}
		
		foreach ( $res ['data'] as $v ) {
			$data ['date'] = $v ['date'];
			$data ['program_id'] = $v ['id'];
			$data ['begin_stamp'] = strtotime ( $v ['begin'] );
			$data ['end_stamp'] = strtotime ( $v ['end'] );
			$data ['name'] = $v ['name'];
			$data ['uid'] = $this->mid;
			$result = $this->_check_program ( $data );
			if ($result ['status'] != 1) {
				$this->error ( $result ['msg'] );
				exit ();
			}
			
			$lists [] = $data;
		}
		
		$dao = M ( 'yaotv' );
		foreach ( $lists as $data ) {
			$map ['uid'] = $this->mid;
			$map ['program_id'] = $data ['program_id'];
			$map2 ['id'] = $dao->where ( $map )->getField ( 'id' );
			if ($map2 ['id']) {
				$dao->where ( $map2 )->save ( $data );
			} else {
				$dao->add ( $data );
			}
			$dateArr [$data ['date']] = $data ['date'];
		}
		foreach ( $dateArr as $d ) {
			$this->sync_program ( $d );
		}
		
		redirect ( U ( 'lists' ) );
	}
	function activities() {
		if (IS_POST) {
			// dump ( $_POST );
			// exit ();
			$data ['yaotv_id'] = I ( 'yaotv_id' );
			M ( 'yaotv_activities' )->where ( $data )->delete ();
			foreach ( $_POST ['sucai_id'] as $k => $id ) {
				if (empty ( $id ))
					continue;
				
				$data ['res_id'] = intval ( $id );
				$data ['begin_offset'] = intval ( $_POST ['startTime'] [$k] );
				$data ['end_offset'] = intval ( $_POST ['endTime'] [$k] );
				
				$res = M ( 'sucai' )->find ( $data ['res_id'] );
				$data ['res_name'] = $res ['name'];
				$data ['res_url'] = $res ['url'];
				// $data ['res_name'] = $res ['name'];
				
				M ( 'yaotv_activities' )->add ( $data );
			}
			$this->sync_activity ( $data ['yaotv_id'] );
			
			redirect ( U ( 'lists' ) );
		} else {
			// 节目配置
			$map ['id'] = $map2 ['yaotv_id'] = I ( 'yaotv_id' );
			$info = M ( 'yaotv' )->where ( $map )->find ();
			$info ['total_time'] = intval ( $info ['end_stamp'] - $info ['begin_stamp'] );
			$info ['total_time_show'] = intval ( $info ['total_time'] / 60 ) . '分' . intval ( $info ['total_time'] % 60 ) . '秒';
			$this->assign ( 'info', $info );
			
			// 活动配置
			$list = M ( 'yaotv_activities' )->where ( $map2 )->select ();
			foreach ( $list as &$v ) {
				$v ['timeline'] = $this->_minute_format ( $v ['begin_offset'] ) . ' 至 ' . $this->_minute_format ( $v ['end_offset'] );
			}
			$this->assign ( 'list_data', $list );
			// 编辑
			$tips = "为保证活动设置及时生效，请提前24小时进行配置";
			$this->assign ( "normalTips", $tips );
			$this->display ( 'edit_program' );
		}
	}
	function _minute_format($number) {
		return intval ( $number / 60 ) . ':' . intval ( $number % 60 );
	}
	function del_activity() {
		$map ['id'] = I ( 'id' );
		echo M ( 'yaotv_activities' )->where ( $map )->delete ();
	}
	function my_meterial() {
		$tips = "为保证素材已入库可用，请在电视节目开播前两个工作日提交素材。";
		$this->assign ( "normalTips", $tips );
		// 我的素材
		$this->display ();
	}
	function meterial_center() {
		// 素材库
		$this->display ();
	}
	function ajax_page_list() {
		$map ['status'] = 'Success';
		session ( 'common_condition', $map );
		
		$model = $this->getModel ( 'Sucai' );
		
		$list_data = $this->_get_model_list ( $model );
		// dump($list_data);
		$this->assign ( $list_data );
		// ajax list
		$this->display ();
	}
	function sync_program($date) {
		$url = "https://api.weixin.qq.com/yaotv/program/sync.json?access_token=" . get_tv_access_token ();
		// dump ( $url );
		$param ['date'] = $param2 ['date'] = $date;
		$param ['version'] = $param2 ['version'] = NOW_TIME;
		$param2 ['programs'] = array ();
		// $res = post_data ( $url, $param2 ); // 先删除线上数据，解决无法编辑时间的问题
		// dump ( $url );
		// dump ( $param2 );
		// dump ( $res );
		// return false;
		$list = M ( 'yaotv' )->where ( $param )->select ();
		if (empty ( $list ))
			return false;
		
		foreach ( $list as $v ) {
			$arr ['id'] = $v ['id'];
			$arr ['name'] = $v ['name'];
			$arr ['begin_stamp'] = $v ['begin_stamp'];
			$arr ['end_stamp'] = $v ['end_stamp'];
			// $arr ['detail'] = $v ['detail'];
			$param ['programs'] [] = $arr;
		}
		
		// dump ( $param );
		$res = post_data ( $url, $param );
		// dump ( $res );
		return $res;
	}
	function sync_activity($program_id) {
		$url = "https://api.weixin.qq.com/yaotv/activity/sync.json?access_token=" . get_tv_access_token ();
		
		$param ['program_id'] = $map ['yaotv_id'] = $program_id;
		
		$list = M ( 'yaotv_activities' )->where ( $map )->select ();
		foreach ( $list as $v ) {
			$arr ['id'] = $v ['id'];
			$arr ['res_id'] = $v ['res_id'];
			$arr ['begin_offset'] = $v ['begin_offset'];
			$arr ['end_offset'] = $v ['end_offset'];
			
			// $arr ['detail'] = $v ['detail'];
			$param ['programs'] [] = $arr;
		}
		
		$res = post_data ( $url, $param );
		if ($res ['errcode'] == 0) {
			M ( 'yaotv_activities' )->where ( $map )->setField ( 'is_sync', 1 );
		}
		return $res;
	}
	function get_sync() {
		$d = I ( 'd' );
		$url = 'https://api.weixin.qq.com/yaotv/program/query.json?access_token=' . get_tv_access_token () . '&date=' . $d;
		$list = wp_file_get_contents ( $url );
		$list = json_decode ( $list, true );
		
		if ($list ['errcode'] != 0) {
			die ( error_msg ( $list ) );
		}
	}
}