<?php

namespace Addons\ShopCoupon\Controller;

use Home\Controller\AddonsController;

class ShopCouponController extends AddonsController {
	function _initialize() {
		parent::_initialize ();
		
		$type = I ( 'type', 0, 'intval' );
		$param['mdm']=$_GET['mdm'];
		$param ['type'] = 0;
		$res ['title'] = '所有的代金券';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 1;
		$res ['title'] = '未开始';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 2;
		$res ['title'] = '进行中';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 3;
		$res ['title'] = '已结束';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = $type == $param ['type'] ? 'current' : '';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
		
		if (_ACTION == 'package')
			$GLOBALS ['is_wap'] = true;
	}
	function lists() {
		$isAjax = I ( 'isAjax' );
		$isRadio = I ( 'isRadio' );
		$model = $this->getModel ( 'shop_coupon' );
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
		$map ['is_del'] = 0;
		// 读取模型数据列表
		
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->field ( true )->where ( $map )->order ( $order )->page ( $page, $row )->select ();
		$snDao=D ( 'Common/SnCode' );
		foreach ( $data as &$vo ) {
			$vo ['is_money_rand'] && $vo ['money'] = $vo ['money'] . ' ~ ' . $vo ['money_max'];
			$vo ['money'] .= '<br/><span style="font-size:14px; color:#CCC">最低消费：￥' . $vo ['order_money'] . '</span>';
			
			$vo ['limit_num'] = $vo ['limit_num'] > 0 ? '每人' . $vo ['limit_num'] . '张' : '不限张数';
			$vo ['limit_num'] .= '<br/><span style="font-size:14px; color:#CCC">库存：' . intval ( $vo ['num'] ) . '张</span>';
			
			$vo ['start_time'] = time_format ( $vo ['start_time'] ) . ' 至<br/>' . time_format ( $vo ['end_time'] );
			
			$useMap['target_id']=$snMap['target_id']=$vo['id'];
			$useMap['addon'] = $snMap['addon']="ShopCoupon";
// 			$snMap['can_use']=1;
			$vo['collect_count']=$snDao->where($snMap)->count();

			$useMap['is_use']=1;
			$vo['use_count']=$snDao->where($useMap)->count();
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
			$this->assign ( 'isRadio', $isRadio );
			$this->assign ( $list_data );
			$this->display ( 'ajax_lists_data' );
		} else {
			$this->assign ( $list_data );
			// dump($list_data);
			
			$this->display ( $templateFile );
		}
	}
	function list_data() {
       //$page = I ( 'p', 1, 'intval' );
        $map['token']=get_token();
        $map['aim_table']='lottery_games';
        $dao=D ( 'Addons://ShopCoupon/ShopCoupon' );
        $list_data =$dao->where($map)->field('id,title,num')->order ( 'id DESC' )->select ( );

        $list_data['list_data']=$list_data;
         //dump ( $list_data );
        $this->ajaxReturn( $list_data ,'JSON');
    }
	function add() {
	//	$this->checkPostData();
		$this->_card_level ();
		$data ['limit_goods'] = 0;
		$this->assign ( 'data', $data );

		$this->display ( 'edit' );
	}
	function edit() {
		$id = I ( 'id' );
		$model = $this->getModel ( 'shop_coupon' );

		if (IS_POST) {
			$this->checkPostData();
			$act = empty ( $id ) ? 'add' : 'save';
			$_POST ['money_max'] = intval ( $_POST ['money_max'] );
			$_POST ['limit_goods_ids'] = implode ( ',', $_POST ['goods_ids'] );
			if(isset($_POST['is_market_price'])){
			    $_POST['is_market_price'] = 1;
			}else{
			    $_POST['is_market_price'] = 0;
			}
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $res = $Model->$act ()) {
				$act == 'add' && $id = $res;
				D('Addons://ShopCoupon/ShopCoupon')->getInfo($id,true);
				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'], $this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			// 获取数据
			$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
			
			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}
			
			// 指定商品
			if ($data ['limit_goods']) {
				$goods_ids = wp_explode ( $data ['limit_goods_ids'] );
				if (! empty ( $goods_ids )) {
					$map2 ['id'] = array (
							'in',
							$goods_ids 
					);
					
					$list = M ( 'shop_goods' )->field ( 'id,title,stock_num,cover' )->where ( $map2 )->select ();
					$this->assign ( 'goods_list', $list );
				}
			}
			
			$data ['member'] = explode ( ',', $data ['member'] );
			$this->assign ( 'data', $data );
			$this->_card_level ();
			
			$this->display ();
		}
	}
	function preview() {
		$id = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'ShopCoupon://Wap/index', array (
				'id' => $id 
		) );
		$this->assign ( 'url', $url );
		$this->display ( SITE_PATH . '/Application/Home/View/default/Addons/preview.html' );
	}
	function _card_level() {
		if (M ( 'addons' )->where ( 'name="Card"' )->find ()) {
			$map ['token'] = get_token ();
			$list = M ( 'card_level' )->where ( $map )->select ();
			$this->assign ( 'card_level', $list );
		}
	}
	function sncode_lists() {
		$id = $hpmap ['id'] = I ( 'id' );
		
		$info = D ( 'ShopCoupon' )->getInfo ( $id );
		
		$list_data ["list_grids"] = array (
				"nickname" => array (
						"field" => "nickname",
						"title" => "用户" 
				),
				"content" => array (
						"field" => "content",
						"title" => " 详细信息" 
				),
				"sn" => array (
						"field" => "sn",
						"title" => " SN码" 
				),
				"money" => array (
						"field" => "money",
						"title" => " 金额(元)" 
				),
				"admin_uid" => array (
						"field" => "admin_uid",
						"title" => "工作人员" 
				),
				"use_time" => array (
						"field" => "use_time",
						"title" => "核销时间" 
				) 
		);
		
		$px = C ( 'DB_PREFIX' );
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		// 搜索条件
		$where = "is_use=1 AND addon='ShopCoupon' AND target_id=" . $id;
		
		$start_time = I ( 'start_time' );
		if ($start_time) {
			$where .= " AND use_time>" . strtotime ( $start_time );
			$this->assign ( 'start_time', $start_time );
		}
		
		$end_time = I ( 'end_time' );
		if ($end_time) {
			$where .= " AND use_time<" . strtotime ( $end_time );
			$this->assign ( 'end_time', $end_time );
		}

		$search_nickname = I ( 'search_nickname' );
		if (! empty ( $search_nickname )) {
		    $uids = D ( 'Common/User' )->searchUser ( $search_nickname );
			$where .= " AND uid IN(" . $uids . ")";

			$this->assign ( 'search_nickname', $search_nickname );
		}
		$row = 20;
		
		// 读取模型数据列表
		$data = D ( 'Common/SnCode' )->field ( true )->where ( $where )->order ( 'use_time DESC' )->page ( $page, $row )->select ();
		// dump ( $data );
		foreach ( $data as &$vo ) {
			$vo ['nickname'] = get_nickname ( $vo ['uid'] );
			$vo ['use_time'] = time_format ( $vo ['use_time'] );
			$vo ['admin_uid'] = get_nickname ( $vo ['admin_uid'] );
			
			$vo ['content'] = '核销代金券券： ' . $info ['title'];
			$vo ['money'] = $vo ['prize_title'];
		}
		
		/* 查询记录总数 */
		$count = D ( 'Common/SnCode' )->where ( $where )->count ();
		$list_data ['list_data'] = $data;
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}
		
		$this->assign ( $list_data );
		// dump($list_data);
		
		$this->display ();
	}
	function export() {
		set_time_limit ( 0 );
		
		$id = $hpmap ['id'] = I ( 'id' );
		$info = D ( 'ShopCoupon' )->getInfo ( $id );
		
		$dataArr [0] = array (
				0 => "用户",
				1 => "详细信息",
				2 => "SN码",
				3 => "金额(元)",
				4 => "工作人员",
				5 => "核销时间" 
		);
		
		$px = C ( 'DB_PREFIX' );
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		// 搜索条件
		$where = "is_use=1 AND addon='ShopCoupon' AND target_id=" . $id;
		
		$start_time = I ( 'start_time' );
		if ($start_time) {
			$where .= " AND s.use_time>" . strtotime ( $start_time );
		}
		
		$end_time = I ( 'end_time' );
		if ($end_time) {
			$where .= " AND s.use_time<" . strtotime ( $end_time );
		}
		
		$search_nickname = I ( 'search_nickname' );
		if (! empty ( $search_nickname )) {
			$where .= " AND s.uid IN(" . D ( 'Common/User' )->searchUser ( $search_nickname ) . ")";
		}
		
		// 读取模型数据列表
		$data = D ( 'Common/SnCode' )->field ( true )->where ( $where )->order ( 'use_time DESC' )->limit ( 5000 )->select ();
		// dump ( $data );
		foreach ( $data as $k => $vo ) {
			$vo ['content'] = '核销代金券： ' . $info ['title'];
			
			$dataArr [$k + 1] = array (
					0 => get_nickname ( $vo ['uid'] ),
					1 => $vo ['content'],
					2 => $vo ['sn'],
					3 => $vo ['prize_title'],
					4 => get_nickname ( $vo ['admin_uid'] ),
					5 => time_format ( $vo ['use_time'] ) 
			);
		}
		
		outExcel ( $dataArr, 'ShopCoupon_' . $id );
	}
	function del() {
		$ids = I ( 'ids' );
		$id = I ( 'id' );
		if ($id) {
			$map ['id'] = $id;
		}
		if ($ids) {
			$map ['id'] = array (
					'in',
					$ids 
			);
		}
		$save ['is_del'] = 1;
		$res = M ( 'shop_coupon' )->where ( $map )->save ( $save );
		if ($res) {
			$this->success ( '删除成功' );
		} else {
			$this->error ( '请选择要操作的数据' );
		}
	}
	function checkPostData(){

		// 判断时间选择是否正确

		if (strtotime ( I ( 'post.start_time' ) ) >= strtotime ( I ( 'post.end_time' ) )) {
			$this->error ( '开始时间不能大于或等于结束时间' );
		}
		if ( ( I ( 'post.num' ) ) <0 ) {
			$this->error ( '发放数应大于0' );
		}
		if (( I ( 'post.order_money' ) ) <0 ) {
			$this->error ( '订单金额不能小于0' );
		}
// 		if(!I('post.title')){
// 			$this->error('代金券必填');

// 		}
// 		if(!I('post.num')){
// 			$this->error('共发放必须填');
// 		}
// 		if(!I('post.money')){
// 			$this->error('发放面值必填');
// 		}
	}
}
