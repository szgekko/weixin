<?php

namespace Addons\WeMedia\Controller;

use Home\Controller\AddonsController;

class CategoryController extends AddonsController {
	var $model;
	function _initialize() {
		$controller = strtolower ( _CONTROLLER );
		
		$res ['title'] = '内容管理';
		$res ['url'] = addons_url ( 'WeMedia://WeMedia/lists' );
		$res ['class'] = $controller == 'wemedia' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '分类设置';
		$res ['url'] = addons_url ( 'WeMedia://Category/lists' );
		$res ['class'] = $controller == 'category' ? 'current' : '';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
		
		$this->model = 'we_media_category';
	}
	function lists() {
		$map ['uid'] = $this->mid;
		session ( 'common_condition', $map );
		
		parent::common_lists ( $this->model );
	}
	function add() {
		parent::common_add ( $this->model );
	}
	function edit() {
		parent::common_edit ( $this->model );
	}
	function del() {
		parent::common_del ( $this->model );
	}
}
