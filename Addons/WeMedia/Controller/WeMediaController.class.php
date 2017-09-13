<?php

namespace Addons\WeMedia\Controller;

use Home\Controller\AddonsController;

class WeMediaController extends AddonsController {
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
	}
	function lists() {
		$model = $this->getModel ( 'we_media' );
		
		$map ['uid'] = $map2 ['uid'] = $this->mid;
		$cate_id = I ( 'cate_id', 0, 'intval' );
		if (! empty ( $cate_id )) {
			$map ['cate_id'] = $cate_id;
		}
		session ( 'common_condition', $map );
		$this->assign ( 'cate_id', $cate_id );
		
		$list_data = $this->_get_model_list ( $model );
		foreach ( $list_data ['list_data'] as &$vo ) {
			$url = addons_url ( 'WeMedia://Wap/detail', array (
					'id' => $vo ['id'] 
			) );
			$vo ['ad_top_img'] = "<img class='list_img' style='width:25px;height:25px;vertical-align:middle;' src='http://qr.liantu.com/api.php?text=$url' />";
			$vo['cover_id'] = "<img src='".get_cover_url($vo['cover_id'])."' />";
			$vo['url'] = $url;
		}
		
		$this->assign ( $list_data );
		// dump($list_data);
		
		// 分类
		$category_list = M ( 'we_media_category' )->where ( $map2 )->select ();
		$this->assign ( 'category_list', $category_list );
		
		$this->display ();
	}
	function detail() {
		$param ['id'] = I ( 'id' );
		$this->redirect ( addons_url ( 'WeMedia://Wap/detail', $param ) );
	}
	// 设置用户组
	public function changeGroup() {
		$id = array_unique ( ( array ) I ( 'ids', 0 ) );
		
		if (empty ( $id )) {
			$this->error ( '请选择用户!' );
		}
		$group_id = I ( 'group_id', 0 );
		if (empty ( $group_id )) {
			$this->error ( '请选择分类!' );
		}
		$map ['id'] = array (
				'in',
				$id 
		);
		M ( 'we_media' )->where ( $map )->setField ( 'cate_id', $group_id );
		echo 1;
	}
	function commentLists(){
		$id = I('id',0,intval);
		$list = D('Addons://Comment/Comment')->getCommentByPage($id,'we_media');
		$this -> assign('list',$list);
		//dump($list);
		$this -> assign('commentLists',$commentLists);
		$this -> display();
	}
}
