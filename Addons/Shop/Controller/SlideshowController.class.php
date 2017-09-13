<?php

namespace Addons\Shop\Controller;
use Addons\Shop\Controller\BaseController;

class SlideshowController extends BaseController{
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop_slideshow' );
		parent::_initialize ();
	}
	// 通用插件的列表模型
	public function lists() {
		$map ['token'] = get_token ();
// 		$map['shop_id'] = $this->shop_id;
		session ( 'common_condition', $map );
	
		$list_data = $this->_get_model_list ( $this->model );
		foreach ( $list_data ['list_data'] as &$vo ) {
			$vo ['img'] = '<img src="' . get_cover_url ( $vo ['img'] ) . '" width="50px" >';
		}
		$isUser=get_followinfo($this->mid,'manager_id');
		if ($isUser){
		    $this->assign('add_button',false);
		    $this->assign('del_button',false);
		    $this->assign('check_all',false);
		    unset($list_data['list_grids']['ids']);
		}
		
		$this->assign ( $list_data );
		//dump ( $list_data );
	   
		$templateFile = $this->model ['template_list'] ? $this->model ['template_list'] : '';
		$this->display ( $templateFile );
	}
	// 通用插件的编辑模型
	public function edit() {
	    if (IS_POST){
	        $_POST['shop_id'] = $this->shop_id;
	        if ($_POST['url']){
	            $res=strstr( $_POST['url'],'http://');
	            if (!$res){
	                $res=strstr( $_POST['url'],'https://');
	            }
	            if (!$res){
	                $_POST['url']='http://'.$_POST['url'];
	            }
	        }
	    }
		parent::common_edit ( $this->model );
	}
	
	// 通用插件的增加模型
	public function add() {
	 if (IS_POST){
	        $_POST['shop_id'] = $this->shop_id;
	        if ($_POST['url']){
	            $res=strstr( $_POST['url'],'http://');
	            if (!$res){
	                $res=strstr( $_POST['url'],'https://');
	            }
	            if (!$res){
	                $_POST['url']='http://'.$_POST['url'];
	            }
	        }
	    }
		parent::common_add ( $this->model );
	}
	
	// 通用插件的删除模型
	public function del() {
		parent::common_del ( $this->model );
	}	
}
