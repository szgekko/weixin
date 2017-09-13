<?php

namespace Addons\Wuguai\Controller;

use Home\Controller\AddonsController;

class WapController extends AddonsController {
	function edit() {
		$model = $this->getModel ( 'Wuguai' );
		
		// 获取数据
		$map ['uid'] = $this->mid;
		$data = M ( get_table_name ( $model ['id'] ) )->where ( $map )->find ();
		
		$token = get_token ();
		if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
			$this->error ( '非法访问！' );
		}
		
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			
			$act = empty ( $data ['id'] ) ? 'add' : 'save';
			
			if ($Model->create () && $Model->$act ()) {
				$this->success ( '寻人广播发布成功！', U ( 'detail' ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			
			$this->display ( 'moblieForm' );
		}
	}
	function detail() {
		$model = $this->getModel ( 'Wuguai' );
		
		// 获取数据
		$map ['uid'] = $this->uid;
		$data = M ( get_table_name ( $model ['id'] ) )->where ( $map )->find ();
		
		$this->assign ( 'data', $data );
		
		$this->display ();
	}
	function notice() {
		echo '建设中';
	}
	function lists() {
		// 优先显示周边最新的广播TODO 目前只能先显示最新的
		$list_data = M ( 'wuguai' )->order ( 'id desc' )->findPage ();
		$this->assign ( $list_data );
		// dump ( $list_data );
		
		$this->display ();
	}
	function myinfo() {
		$this->error ( '建设中' );
	}
	function pay() {
		$this->error ( '建设中' );
	}
	function map() {
		$this->error ( '建设中' );
	}
}
