<?php

namespace Addons\WeMedia\Controller;

use Home\Controller\AddonsController;

class WapController extends AddonsController {
	function _initialize() {
		define ( 'CUSTOM_TEMPLATE_PATH', ONETHINK_ADDON_PATH . 'WeMedia/View/default/Template' );
	}
	function lists() {
		$map ['uid'] = $map2 ['uid'] = I ( 'uid' );
		$category_list = M ( 'we_media_category' )->where ( $map2 )->select ();
		$this->assign ( 'category_list', $category_list );
		
		$cate_id = I ( 'cate_id', 0, 'intval' );
		$this->assign ( 'cate_id', $cate_id );
		if ($cate_id) {
			$map ['cate_id'] = $cate_id;
		}
		
		$page = I ( 'p', 1, 'intval' );
		$row = isset ( $_REQUEST ['list_row'] ) ? intval ( $_REQUEST ['list_row'] ) : 10;
		
		$data = M ( 'we_media' )->where ( $map )->order ( 'is_top desc, id DESC' )->page ( $page, $row )->select ();
		/* 查询记录总数 */
		$count = M ( 'we_media' )->where ( $map )->count ();
		$list_data ['list_data'] = $data;
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}
		
		$this->assign ( $list_data );
		// dump ( $list_data );
		
		$this->display ( ONETHINK_ADDON_PATH . 'WeMedia/View/default/TemplateLists/V4/lists.html' );
	}
	// 详情
	function detail() {
		$map ['id'] = $map2 ['media_id'] = I ( 'get.id', 0, 'intval' );
		$info = M ( 'we_media' )->where ( $map )->find ();
		
		$info ['digg_count'] += $info ['init_digg_count'];
		$info ['view_count'] += $info ['init_view_count'];
		
		$map2 ['uid'] = $this->mid;
		$info ['has_digg'] = intval ( M ( 'we_media_digg' )->where ( $map2 )->getField ( 'id' ) );
		
		$this->assign ( 'info', $info );
		
		M ( 'we_media' )->where ( $map )->setInc ( 'view_count' );
		
		// 相关阅读
		$map3 ['cate_id'] = $info ['cate_id'];
		$map3 ['id'] = array (
				'exp',
				'!=' . $info ['id'] 
		);
		$other_list = M ( 'we_media' )->where ( $map3 )->limit ( 3 )->order ( 'id desc' )->select ();
		$this->assign ( 'other_list', $other_list );
		
		$this->display ( ONETHINK_ADDON_PATH . 'WeMedia/View/default/TemplateDetail/V1/detail.html' );
	}
	function setCount() {
		$map ['id'] = I ( 'id' );
		$info = M ( 'we_media' )->where ( $map )->find ();
		
		$type = I ( 'type' );
		
		$param ['uid'] = $info ['uid'];
		$url = addons_url ( 'BusinessCard://Wap/detail', $param );
		
		if ($type == 'bottom' && $info ['ad_bottom_type'] == 2) {
			$url = $info ['ad_bottom_url'];
		} elseif ($type == 'top' && $info ['ad_top_type'] == 2) {
			$url = $info ['ad_top_url'];
		} elseif ($type == 'author' && $info ['author_url_type'] == 1) {
			$url = $info ['author_url'];
		}
		
		$field = 'ad_' . $type . '_count';
		$res = M ( 'we_media' )->where ( $map )->setInc ( $field );
		
		redirect ( $url );
	}
	function digg() {
		$data ['media_id'] = $map ['id'] = I ( 'id' );
		
		M ( 'we_media' )->where ( $map )->setInc ( 'digg_count' );
		
		$data ['uid'] = $this->mid;
		$data ['cTime'] = NOW_TIME;
		
		M ( 'we_media_digg' )->add ( $data );
		
		$this->success ( '谢谢您的支持' );
	}
	function comment() {
		$data ['media_id'] = $map ['id'] = I ( 'media_id' );
		$info = M ( 'we_media' )->where ( $map )->find ();
		$this->assign ( 'info', $info );
		
		$this->display ();
	}
}
