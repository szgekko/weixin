<?php

namespace Addons\Seckill\Controller;
use Home\Controller\AddonsController;

class SeckillController extends AddonsController{
	function _initialize() {
		parent::_initialize ();
		
		$type = I ( 'type', 0, 'intval' );
		$param['mdm']=$_GET['mdm'];
		$param ['type'] = 0;
		$res ['title'] = '所有的秒杀活动';
		$res ['url'] = addons_url ( 'Seckill://Seckill/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 1;
		$res ['title'] = '未开始';
		$res ['url'] = addons_url ( 'Seckill://Seckill/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 2;
		$res ['title'] = '进行中';
		$res ['url'] = addons_url ( 'Seckill://Seckill/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 3;
		$res ['title'] = '已结束';
		$res ['url'] = addons_url ( 'Seckill://Seckill/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
		
	}
	function lists() {
	    $isAjax = I ( 'isAjax' );
	    $isRadio = I ( 'isRadio' );
		$model = $this->getModel ( 'seckill' );
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		
		// 搜索条件
		$map = $this->_search_map ( $model, $fields );
		$type = I ( 'type', 0, 'intval' );
		if ($type == 1) {
			$map ['start_time'] = array (
					'gt',
					NOW_TIME 
			);
		} elseif ($type == 2) {
			$map ['start_time'] = array (
					'lt',
					NOW_TIME 
			);
			$map ['end_time'] = array (
					'gt',
					NOW_TIME 
			);
		} elseif ($type == 3) {
			$map ['end_time'] = array (
					'lt',
					NOW_TIME 
			);
		}
		
		$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];
		
		// 读取模型数据列表
		
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->field ( true )->where ( $map )->order ( 'id desc' )->page ( $page, $row )->select ();
		foreach ( $data as &$vo ) {
			$vo ['count'] =  M('seckill_goods')->where(array('seckill_id'=>$vo['id']))->count();
			$vo ['count'] =  '<a href="'.U('add_goods',array('id'=>$vo['id'],'mdm'=>I('mdm'))).'">'.$vo ['count'].'</a>';
			$vo ['order_count'] =  M('seckill_order')->where(array('seckill_id'=>$vo['id']))->count();
			$vo ['order_count'] =  '<a href="'.U('seckill_order',array('id'=>$vo['id'],'mdm'=>I('mdm'))).'">'.$vo ['order_count'].'</a>';
			if(NOW_TIME>$vo['start_time'] && NOW_TIME<$vo['end_time']){
			$vo ['status'] = "<span class='status_on'>进行中</span>";
					}
		    if(NOW_TIME<$vo['start_time']){
		    	$vo ['status']="<span class='status_off'>未开始</span>";
		    }
		    if(NOW_TIME>$vo['end_time']){
		    	$vo ['status']="<span class='status_off'>已结束</span>";
		    }
			$vo ['start_time'] = time_format ( $vo ['start_time'] ) . ' 至<br/>' . time_format ( $vo ['end_time'] );
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
		if ($isAjax) {
		    $this->assign('isRadio',$isRadio);
		    $this->assign ( $list_data );
		    $this->display ( 'ajax_lists_data' );
		} else {
		    $this->assign ( $list_data );
		    // dump($list_data);
		    
		    $this->display ();
		}
	
	}
	function add_goods(){
		$id = I('id',0,intval);
		redirect(addons_url ( 'Seckill://SeckillGoods/lists',array('id'=>$id,'mdm'=>I('mdm'))));
	}
	function seckill_order(){
		$id = I('id',0,intval);
		redirect(addons_url ( 'Shop://Order/lists',array('order_from_type'=>11,'seckill_id'=>$id,'mdm'=>I('mdm'))));
	}
	/* 预览 */
	function preview(){
	    $id = I('id',0,intval);
	    $url = addons_url('Seckill://Wap/index',array('id'=>$id));
	    $this->assign('url', $url);
	    $this->display(SITE_PATH . '/Application/Home/View/default/Addons/preview.html');
	}
	function add(){
		$model = $this->getModel ();
		if (IS_POST) {
			$this->checkDate();
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				$this->_saveKeyword ( $model, $id );
	
				// 清空缓存
				method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'add' );
	
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'], $this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			$this->assign ( 'fields', $fields );
	
			$templateFile || $templateFile = $model ['template_add'] ? $model ['template_add'] : '';
			$this->display ( $templateFile );
		}
	
	}
	function checkDate(){
		// 判断时间选择是否正确
		if(! I('post.title')){
			$this->error('请输入活动名称');
		}
		// 判断时间选择是否正确
		if (! I ( 'post.start_time' )) {
			$this->error ( '请选择开始时间' );
		} else if (! I ( 'post.end_time' )) {
			$this->error ( '请选择结束时间' );
		} else if (strtotime ( I ( 'post.start_time' ) ) >= strtotime ( I ( 'post.end_time' ) )) {
			$this->error ( '开始时间不能大于或等于结束时间' );
		}
	}

}
