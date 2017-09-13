<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class SpecController extends BaseController {
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop_spec' );
		parent::_initialize ();
		
		$res ['title'] = '商品规格管理列表';
		$res ['url'] = addons_url ( 'Shop://Spec/lists',$this->get_param );
		$res ['class'] = _ACTION == 'lists' ? 'current' : '';
		$nav [] = $res;
		
		if (_ACTION == 'edit') {
			$res ['title'] = '编辑商品';
			$res ['url'] = '#';
			$res ['class'] = 'current';
			$nav [] = $res;
		} else {
			$res ['title'] = '增加规格';
			$res ['url'] = addons_url ( 'Shop://Spec/add',$this->get_param );
			$res ['class'] = _ACTION == 'add' ? 'current' : '';
			$nav [] = $res;
		}
		
		$this->assign ( 'nav', $nav );
	}
	// 通用插件的列表模型
	public function lists() {
	    $map['uid']=$this->mid;
	    session('common_condition',$map);
		$list_data = $this->_get_model_list ( $this->model );
		
		// 属性值
		$ids = getSubByKey ( $list_data ['list_data'], 'id' );
		if (! empty ( $ids )) {
			$map ['spec_id'] = array (
					'in',
					$ids 
			);
			
			$list = M ( 'shop_spec_option' )->where ( $map )->order ( 'sort desc, id asc' )->select ();
			foreach ( $list as $vo ) {
				$option [$vo ['spec_id']] [] = $vo ['name'];
			}
			foreach ( $list_data ['list_data'] as &$vv ) {
				$vv ['remark'] = implode ( ', ', $option [$vv ['id']] );
			}
		}
		
		$this->assign ( $list_data );
		
		$this->display ();
	}
	// 通用插件的编辑模型
	public function edit() {
		$model = $this->model;
		$id = I ( 'id' );
		$shop_id = $this->shop_id;
		if (IS_POST) {
			$this->set_option ( $id, I ( 'post.' ) );
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			$Model->create () && $Model->save ();
			$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $shop_id ,$this->get_param) );
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			// 获取数据
			$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
			
			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}
			
			$option_list = M ( 'shop_spec_option' )->where ( 'spec_id=' . $id )->order ( '`sort` asc' )->select ();
			$this->assign ( 'option_list', $option_list );
			
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			
			$this->display ();
		}
	}
	
	// 通用插件的增加模型
	public function add() {
		$model = $this->model;
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		if (IS_POST) {
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				$this->set_option ( $id, I ( 'post.' ) );
				
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $shop_id ,$this->get_param) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			$this->assign ( 'fields', $fields );
			$this->assign ( 'post_url', U ( 'add' ) );
			
			$this->display ( 'edit' );
		}
	}
	
	// 通用插件的删除模型
	public function del() {
		$id = I ( 'id' );
		$ids = I ( 'ids' );
		if (! empty ( $id )) {
			$key = 'Goods_getInfo_' . $id;
			S ( $key, null );
		} else {
			foreach ( $ids as $i ) {
				$key = 'Goods_getInfo_' . $i;
				S ( $key, null );
			}
		}
		parent::common_del ( $this->model );
	}
	function set_option($spec_id, $post) {
		$dao = M ( 'shop_spec_option' );
		$opt_data ['spec_id'] = $spec_id;
		foreach ( $post ['name'] as $key => $opt ) {
			if (empty ( $opt ))
				continue;
			
			$opt_data ['name'] = $opt;
			$opt_data ['sort'] = intval ( $post ['sort'] [$key] );
			if ($key > 0) {
				// 更新选项
				$optIds [] = $map ['id'] = $key;
				$dao->where ( $map )->save ( $opt_data );
			} else {
				// 增加新选项
				$optIds [] = $dao->add ( $opt_data );
			}
		}
		// 删除旧选项
		$map2 ['id'] = array (
				'not in',
				$optIds 
		);
		$map2 ['spec_id'] = $opt_data ['spec_id'];
		$dao->where ( $map2 )->delete ();
	}
	function set_show() {
		$save ['is_show'] = 1 - I ( 'is_show' );
		$map ['id'] = I ( 'id' );
		
		$isUser = getUserInfo ( $this->mid, 'manager_id' );
		if ($isUser) {
			// 添加到用户下架表
			$map1 ['uid'] = $data ['uid'] = $this->mid;
			$map1 ['token'] = $data ['token'] = get_token ();
			$map1 ['goods_id'] = $data ['goods_id'] = $map ['id'];
			$dao = M ( 'shop_goods_downshelf_user' );
			$goods = $dao->where ( $map1 )->find ();
			$data ['down_shelf'] = $save ['is_show'];
			$savedata ['down_shelf'] = 1 - $goods ['down_shelf'];
			$goods ['id'] ? $dao->where ( array (
					'id' => $goods ['id'] 
			) )->save ( $savedata ) : $dao->add ( $data );
		} else {
			$map ['shop_id'] = $this->shop_id;
			$res = M ( 'shop_goods' )->where ( $map )->save ( $save );
		}
		
		$this->success ( '操作成功' );
	}
	
	// 添加虚拟信息
	function _addVirtualInfo($goods_id, $textareaStr) {
		if (! empty ( $textareaStr )) {
			$model = M ( 'shop_virtual' );
			$arr = wp_explode ( $textareaStr );
			foreach ( $arr as $v ) {
				$accountArr = explode ( '|', $v );
				$map ['goods_id'] = $goods_id;
				$data ['account'] = $map ['account'] = $accountArr [0];
				$data ['password'] = $accountArr [1];
				$data ['is_use'] = 0;
				$data ['goods_id'] = $goods_id;
				$res = $model->where ( $map )->select ();
				if ($res) {
					$model->where ( $map )->save ( $data );
				} else {
					$model->where ( $map )->add ( $data );
				}
			}
		}
	}
}