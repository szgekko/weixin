<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class AttributeController extends BaseController {
	var $model;
	var $cate_id;
	var $field_type;
	function _initialize() {
		parent::_initialize ();
		
		$this->model = $this->getModel ( 'shop_attribute' );
		$param['mdm']=$_GET['mdm'];
		$param ['cate_id'] = $this->cate_id = intval ( $_REQUEST ['cate_id'] );
		
		$type = I ( 'type', 0, 'intval' );
		
		$param ['type'] = 0;
		$res ['title'] = '筛选属性';
		$res ['url'] = addons_url ( 'Shop://Attribute/lists', $param );
		$res ['class'] = _ACTION == 'lists' && $type == 0 ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 1;
		$res ['title'] = '普通属性';
		$res ['url'] = addons_url ( 'Shop://Attribute/lists', $param );
		$res ['class'] = _ACTION == 'lists' && $type == 1 ? 'current' : '';
		$nav [] = $res;
		
		if (_ACTION == 'edit') {
			$res ['title'] = $type ? '编辑普通属性' : '编辑筛选属性';
			$res ['url'] = '#';
			$res ['class'] = 'current';
			$nav [] = $res;
		} else {
			$res ['title'] = $type ? '增加普通属性' : '增加筛选属性';
			$param['type']=$type;
			$res ['url'] = addons_url ( 'Shop://Attribute/add', $param );
			$res ['class'] = _ACTION == 'add' ? 'current' : '';
			$nav [] = $res;
		}
		
		$this->assign ( 'nav', $nav );
		
		$this->field_type = array (
				'string' => 'varchar',
				'textarea' => 'varchar',
				'radio' => 'varchar',
				'checkbox' => 'varchar',
				'select' => 'varchar',
				'picture' => 'int',
				'datetime' => 'int' 
		);
	}
	// 通用插件的列表模型
	public function lists() {
		$model = $this->model;
		$order = 'cate_id asc,sort asc, id asc';
		
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		$fields = $list_data ['fields'];
		
		// 搜索条件
		$map = $this->_search_map ( $model, $fields );
		
		$ids = array ();
		D ( 'Category' )->get_parent_ids ( $this->cate_id, $ids );
		
		$this->assign ( 'top_more_button', array (
				array (
						'title' => '返回分类列表',
						'url' => addons_url ( 'Shop://Category/lists' ) 
				) 
		) );
		$param ['cate_id'] = $this->cate_id;
		$param ['model'] = $this->model ['id'];
		$add_url = U ( 'add', $param );
		$this->assign ( 'add_url', $add_url );
		
		$map ['cate_id'] = array (
				'in',
				$ids 
		);
		$map ['type'] = I ( 'type', 0, 'intval' );
		
		$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];
		
		// 读取模型数据列表
		
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->field ( true )->where ( $map )->order ( $order )->page ( $page, $row )->select ();
		$arr = array (
				'string' => '单行输入',
				'textarea' => '多行输入',
				'radio' => '单选',
				'checkbox' => '多选',
				'select' => '下拉选择',
				'datetime' => '时间选择',
				'picture' => '上传图片' 
		);
		foreach ( $data as &$vo ) {
			$vo ['attr_type'] = $arr [$vo ['attr_type']];
		}
		
		/* 查询记录总数 */
		$count = M ( $name )->where ( $map )->count ();
		
		$list_data ['list_data'] = $data;
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}
		
		$this->assign ( $list_data );
		// dump($list_data);
		$this->assign ( 'cate_id', $this->cate_id );
		
		$this->display ();
	}
	
	// 通用插件的编辑模型
	public function edit() {
		$id = I ( 'id' );
		// 获取数据
		$data = M ( 'shop_attribute' )->find ( $id );
		$data || $this->error ( '数据不存在！' );
		
		$token = get_token ();
		if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
			$this->error ( '非法访问！' );
		}
		
		if (IS_POST) {
			if (empty ( $data ['goods_field'] ) || $this->field_type [$data ['attr_type']] != $this->field_type [$_POST ['attr_type']]) {
				$_POST ['name'] = $_POST ['goods_field'] = $this->_goods_field ( $_POST ['cate_id'], $_POST ['attr_type'] );
				
				// 数据转移到新字段中
				if (! empty ( $data ['goods_field'] ) && $data ['goods_field'] != $_POST ['goods_field']) {
					$sql = "UPDATE wp_shop_goods SET `{$_POST ['goods_field']}`=`{$data ['goods_field']}` WHERE id>0";
					M ()->execute ( $sql );
				}
			}
			$_POST ['extra'] = $this->_deal_extra ( $_POST ['extra'] );
			
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $Model->save ()) {
				
				// 清空缓存
				method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'edit' );
				
				$param ['cate_id'] = $this->cate_id;
				$param ['model'] = $this->model ['id'];
				$param ['type'] = $_POST ['type'];
				
				$url = U ( 'lists', $param );
				$this->success ( '保存' . $this->model ['title'] . '成功！', $url );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$this->_deal_fields ();
			$this->assign ( 'data', $data );
			$this->display ();
		}
	}
	
	// 通用插件的增加模型
	public function add() {
		if (IS_POST) {
			$_POST ['goods_field'] = $this->_goods_field ( $_POST ['cate_id'], $_POST ['attr_type'] );
			$_POST ['extra'] = $this->_deal_extra ( $_POST ['extra'] );
			$_POST['name'] =$_POST['goods_field'];
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				
				// 清空缓存
				method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'edit' );
				$param['mdm']=$_GET['mdm'];
				$param ['cate_id'] = $this->cate_id;
				$param ['model'] = $this->model ['id'];
				$param ['type'] = $_POST ['type'];
				$url = U ( 'lists', $param );
				$this->success ( '添加' . $this->model ['title'] . '成功！', $url );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$this->_deal_fields ();
			$this->display ();
		}
	}
	function _deal_fields() {
		$fields = get_model_attribute ( $this->model ['id'] );
		$type = I ( 'type', 0, 'intval' );
		if ($type == 0) { // 筛选属性只有单选和多选，下拉菜单三种类型
			$fields ['attr_type'] ['extra'] = "radio:单选|extra@show
checkbox:多选|extra@show
select:下拉选择|extra@show";
		}
		
		$this->assign ( 'fields', $fields );
	}
	// 去掉参数里的首尾空格
	function _deal_extra($text) {
		if (empty ( $text ))
			return '';
		
		$arr = wp_explode ( $text );
		return implode ( "\n", $arr );
	}
	// 自动分配shop_goods表里的扩展字段
	function _goods_field($cid, $attr_type) {
		// 获取分类包括父级的所有ID
		$cate_ids = array ();
		D ( 'Category' )->get_parent_ids ( $cid, $cate_ids );
		
		// 获取已经占用的扩展字段
		$map ['token'] = get_token ();
		$map ['cate_id'] = array (
				'in',
				$cate_ids 
		);
		
		$goods_field = M ( 'shop_attribute' )->where ( $map )->getFields ( 'goods_field' );
		
		$type = isset ( $this->field_type [$attr_type] ) ? $this->field_type [$attr_type] : 'varchar';
		for($i = 0; $i < 20; $i ++) {
			$field = 'extra_' . $type . '_' . $i;
			if (! in_array ( $field, $goods_field )) {
				return $field;
			}
		}
		$this->error ( '字段已经用完' );
	}
	// 通用插件的删除模型
	public function del() {
		parent::common_del ( $this->model );
	}
}
