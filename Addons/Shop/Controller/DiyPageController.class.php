<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class DiyPageController extends BaseController {
	var $model;
	function _initialize() {
		parent::_initialize ();
		$this->model = $this->getModel ( 'shop_page' );
		$controller = strtolower ( _CONTROLLER );
		$use = I('use','page');
		
		$res ['title'] = '自定义专题';
		$res ['url'] = addons_url ( 'Shop://DiyPage/lists',array('mdm'=>$_GET['mdm']));
		$res ['class'] = _ACTION == 'lists' || $use=="page" && _ACTION=='edit'? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '首页';
		$res ['url'] = addons_url ( 'Shop://DiyPage/diyPage',array('use'=>'index','mdm'=>$_GET['mdm']) );
		$res ['class'] = $use=="index" && _ACTION=='edit' ? 'current' : '';
		$nav [] = $res;
		$res ['title'] = '个人中心页';
		$res ['url'] = addons_url ( 'Shop://DiyPage/diyPage',array('use'=>'userCenter','mdm'=>$_GET['mdm']) );
		$res ['class'] = $use=="userCenter" && _ACTION=='edit' ? 'current' : '';
		$nav [] = $res;
		$res ['title'] = '购物车页';
		$res ['url'] = addons_url ( 'Shop://DiyPage/diyPage',array('use'=>'cart','mdm'=>$_GET['mdm']) );
		$res ['class'] = $use=="cart" && _ACTION=='edit' ? 'current' : '';
		$nav [] = $res;
		$res ['title'] = '订单页';
		$res ['url'] = addons_url ( 'Shop://DiyPage/diyPage',array('use'=>'orderlist','mdm'=>$_GET['mdm']) );
		$res ['class'] = $use=="orderlist" && _ACTION=='edit'? 'current' : '';
		$nav [] = $res;
		
		$use = I('get.use','page');
		if($use=="goodsDetail"){
			$nav = array();
			$res ['title'] = '商品详情页';
			$res ['url'] = '#';
			$res ['class'] = 'current';
			$nav [] = $res;
			
		}
		$this->assign ( 'nav', $nav );
		
	}
	function lists(){
		$map['use'] = 'page';
		session ( 'common_condition', $map );
		$list_data = $this->_get_model_list ( $this->model );
		$publicid= get_token_appinfo ( '', 'id' ) ;
		foreach($list_data['list_data'] as &$vo){
			$copyUrl = addons_url('Shop://Wap/diy_page',array('id'=>$vo['id'],'shop_id'=>$this->shop_id,'uid'=>$this->mid,'publicid' =>$publicid));
			$vo['copy'] = '<a data-clipboard-text="'.$copyUrl.'" id="copybtn_'.$vo['id'].'" href="javascript:;">复制链接</a><script type="text/javascript">$.WeiPHP.initCopyBtn("copybtn_'.$vo['id'].'")</script>';
		}
		$this->assign ( $list_data );
		
		$this->display ();
	}
	
	// 通用插件的编辑模型
	public function edit() {
		$model = $this->model;
		$id = I( 'id' );
		$use = I('get.use','page');
		$shop_id = $this->shop_id;
		//dump($_POST);die;
		$goods_id = I('get.goods_id',0,'intval');
		$show = I('get.is_show',2,'intval');
		if (IS_POST) {
			$_POST['shop_id'] = $this->shop_id;
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			//dump($Model);exit;
			$res = false;
			$Model->create () && $res=$Model->save ();
			if ($res !== false) {
				D ( 'DiyPage' )->getInfo ( $id,true);
// 				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				if($use=="goodsDetail"){
				    if ($show == 0){
				        $type = 2;
				    }else if($show == 1){
				        $type = 0;
				    }else{
				        $type = 4;
				    }
					$this->success ( '添加' . $model ['title'] . '成功！', addons_url('Shop://Goods/lists',array('shop_id'=>$shop_id,'mdm'=>$_GET['mdm'],'type'=>$type)),true);
				}else if($use!="page"){
					$this->success ( '保存' . $model ['title'] . '成功！',addons_url('Shop://DiyPage/edit',array('id'=>$id,'use'=>$use,'mdm'=>I('get.mdm'))),true);
				}else{
					$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $shop_id,$this->get_param ),true );
				}
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
		    //选择本地编辑器 或七牛编辑器
		    $uploadDriver = strtolower(C("EDITOR_PICTURE_UPLOAD_DRIVER"));
		    if ($uploadDriver == 'qiniu') {
		        $driverfile = 'ueditor_qiniu';
		    } else {
		        $driverfile = 'ueditor';
		    }
		    $this->assign('driver_file', $driverfile);
		    
			$fields = get_model_attribute ( $model ['id'] );
			// 获取数据
			$data = D ( 'DiyPage' )->getInfo ( $id);
			$data || $this->error ( '数据不存在！' );
			
			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}
			$this->assign('fields', $fields);
            $this->assign('data', $data);
            $goods = D("Addons://Shop/Goods")->getInfo($goods_id);
            $title =  $goods['title'];
            $this->assign('goods_title', $title);
// 			dump($data);exit;
// 			$data['config']=json_decode(rawurldecode($data['config']),true);
// 			dump($data);
			$post_url = U('edit?model='.$model['id'].'&id='.$id.'&use='.$use.'&goods_id='.$goods_id.'&is_show='.$show.'&mdm='.I('mdm'));
			$this -> assign('post_url',$post_url);
			$this->display ();
		}
	}
	
	// 通用插件的增加模型
	public function add() {
		$model = $this->model;
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		$use = I('get.use','page');
		$goods_id = I('get.goods_id',0,'intval');
		$show = I('get.is_show',2,'intval');
		if (IS_POST) {
			$_POST['shop_id'] = $this->shop_id;
			$_POST['use'] = $use;
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				if($use=="goodsDetail"){
				//保存商品diy_id
					$diyMap['diy_id'] = $id;
					M('shop_goods')->where(array('id'=>$goods_id))->save($diyMap);
					if ($show == 0){
					    $type = 2;
					}else if($show == 1){
					    $type = 0;
					}else{
					    $type =4;
					}
					$this->success ( '添加' . $model ['title'] . '成功！', addons_url('Shop://Goods/lists',array('shop_id'=>$_POST['shop_id'],'type'=>$type,'mdm'=>$_GET['mdm'])));
				}else if($use!="page"){
					$this->success ( '保存' . $model ['title'] . '成功！');
				}else{
					$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $_POST['shop_id'],$this->get_param ) );
				}
			} else {
				$this->error( $Model->getError () );
			}
		} else {
		    //选择本地编辑器 或七牛编辑器
		    $uploadDriver = strtolower(C("EDITOR_PICTURE_UPLOAD_DRIVER"));
		    if ($uploadDriver == 'qiniu') {
		        $driverfile = 'ueditor_qiniu';
		    } else {
		        $driverfile = 'ueditor';
		    }
		    $this->assign('driver_file', $driverfile);
			$post_url = U('add?model='.$model['id'].'&use='.$use.'&goods_id='.$goods_id.'&is_show='.$show,$this->get_param);
			$this -> assign('post_url',$post_url);
			$fields = get_model_attribute ( $model ['id'] );
			$goods = D("Addons://Shop/Goods")->getInfo($goods_id);
			$title = $goods['title'];
            $this->assign('goods_title', $title);
			$this->assign ( 'fields', $fields );
			$this->display ( 'edit' );
		}
	}
	
	
	function diyPage(){
		$Model = M ( 'shop_page' );
		$map['use'] = I('use','page');
		$map['manager_id'] = $this -> mid;
		$map['token'] = get_token();
		$res = $Model ->where($map)->find();
		if($res){
			$id = $res['id'];
		}else{
			$map['ctime'] = time();
			$id = $Model -> add($map);
		}
		$this > redirect(U('edit',array('id'=>$id,'use'=>$map['use'],'mdm'=>$_GET['mdm'])));
	}
	
	
	function preview(){
		$id = I('id');
		$url = addons_url('Shop://Wap/diy_page',array('id'=>$id));
		$this->assign('url', $url);
        $this->display(SITE_PATH . '/Application/Home/View/default/Addons/preview.html');
	}
	
}