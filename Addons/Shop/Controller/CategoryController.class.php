<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class CategoryController extends BaseController {
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop_goods_category' );
		parent::_initialize ();
	}
	// 通用插件的列表模型
	public function lists() {
		$model = $this->model;
		$map ['token'] = get_token ();
		
		$map ['shop_id'] = $this->shop_id;
		session ( 'common_condition', $map );
		
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		$fields = $list_data ['fields'];
		
		// 搜索条件
		$map = $this->_search_map ( $model, $fields );
		
		// 读取模型数据列表
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->field ( true )->where ( $map )->order ( 'sort asc,id asc' )->select ();
		
		/* 查询记录总数 */
		
		$list_data ['list_data'] = $data;
		
		// dump ( $list_data );
		$isUser = get_followinfo ( $this->mid, 'manager_id' );
		if ($isUser) {
			$this->assign ( 'add_button', false );
			$this->assign ( 'del_button', false );
			$this->assign ( 'check_all', false );
			unset ( $list_data ['list_grids'] ['ids'] );
		}
		$list_data ['list_grids'] ['ids'] ['href'] = $list_data ['list_grids'] ['ids'] ['href'] . ',goodsListsByCategory?cid1=[id]&shop_id=' . $this->shop_id . '&_controller=Wap|复制链接';
		unset ( $list_data ['list_grids'] ['pid'] );
		$new_data = array ();
		list_tree ( $data, $new_data );
		$list_data ['list_data'] = $new_data;
		$this->assign ( $list_data );
		// dump($list_data['list_data']);
		$templateFile = $this->model ['template_list'] ? $this->model ['template_list'] : '';
		$this->display ( $templateFile );
	}
	function tree_to_list($tree, $child = '_child', &$list = array()) {
		if (is_array ( $tree )) {
			$refer = array ();
			foreach ( $tree as $key => $value ) {
				$reffer = $value;
				if (isset ( $reffer [$child] )) {
					unset ( $reffer [$child] );
					$this->tree_to_list ( $value [$child], $child, $list );
				}
				$list [] = $reffer;
			}
		}
		return $list;
	}
	// 通用插件的编辑模型
	public function edit() {
		$model = $this->model;
		$id = I ( 'id' );
		$shop_id = $_POST ['shop_id'] = $this->shop_id;
		if (IS_POST) {
		    
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $Model->save ()) {
			    if ($_POST['pid'] !=0){
			        $map['pid']=$_POST['id'];
			        $map['token']=get_token();
			        $secIds= M ( get_table_name ( $model ['id'] ) )->where($map)->getFields('id');
			        if (!empty($secIds)){
			            $map1['id']=array('in',$secIds);
			            $setsave['pid']=$_POST['pid'];
			            M ( get_table_name ( $model ['id'] ) )->where($map1)->save($setsave);
			        }
			    }
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $shop_id, $this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ( $id );
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'pid') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			
			// 获取数据
			$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
			
			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}
			$data ['imgs'] = explode ( ',', $data ['imgs'] );
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->meta_title = '编辑' . $model ['title'];
			
			$this->display ();
		}
	}
	
	// 通用插件的增加模型
	public function add() {
		$shop_id = $_POST ['shop_id'] = $this->shop_id;
		$model = $this->model;
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		
		if (IS_POST) {
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $shop_id, $this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ();
			
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'pid') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			$this->assign ( 'fields', $fields );
			$this->meta_title = '新增' . $model ['title'];
			
			$this->display ();
		}
		// parent::common_add ( $this->model );
	}
	
	// 通用插件的删除模型
	public function del() {
		parent::common_del ( $this->model );
	}
	
	// 获取所属分类
	function getCateData($currentId = 0) {
		$map ['is_show'] = 1;
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$list = M ( 'shop_goods_category' )->where ( $map )->select ();
		$extra = 0 . ':' . "无\r\n";
		foreach ( $list as $v ) {
			$pid = $v ['pid'];
			if ($pid == 0 && $currentId != $v ['id']) {
				$extra .= $v ['id'] . ':' . $v ['title'] . "\r\n";
// 				foreach ( $list as $v1 ) {
// 					if ($v1 ['pid'] == $v ['id']) {
// 						$extra .= $v1 ['id'] . ':' . '——' . $v1 ['title'] . "\r\n";
// 						foreach ( $list as $v2 ) {
// 							if ($v2 ['pid'] == $v1 ['id']) {
// 								$extra .= $v2 ['id'] . ':' . '————' . $v2 ['title'] . "\r\n";
// 							}
// 						}
// 					}
// 				}
			}
		}
		return $extra;
	}
}
