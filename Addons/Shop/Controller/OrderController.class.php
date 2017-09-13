<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class OrderController extends BaseController {
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop_order' );
		parent::_initialize ();
	}
	// 通用插件的列表模型
	public function lists() {
		D ( 'Addons://Shop/Order' )->autoSetFinish ();
		D ( 'Addons://Shop/Order' )->refreshPayStatus();
		$param['mdm']=$_GET['mdm'];
		$res['title']='订单管理';
		$res['url']=addons_url('Shop://Order/lists',$param);
		$res ['class'] = _CONTROLLER == 'Order' ? 'current' : '';
		$nav[]=$res;
		 
// 		$res['title']='支付记录';
// 		$res['url']=addons_url('Payment://PaymentOrder/lists',$param);
// 		$res ['class'] = _CONTROLLER == 'PaymentOrder' ? 'current' : '';
// 		$nav[]=$res;
		$this->assign('nav',$nav);
		 
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'check_all', false );
		
		$map ['token'] = get_token ();
		$orderId = I('order_id',0,'intval');
		if ($orderId){
			$map['id'] = $orderId;
		}
		
		$userId=I('users',0,'intval');
		$userId && $map['manager_id']=$userId;
		
		$isUser=get_userinfo($this->mid,'manager_id');
		if ($isUser){
		    $map['manager_id']=$this->mid;
		}else {
// 		    $map ['shop_id'] = $this->shop_id;
            $map1['token']=get_token();
		    $managerIds=D('Addons://Shop/Order')->where($map1)->field('distinct manager_id')->select();
		    foreach ($managerIds as $m){
		        if ($m['manager_id']){
		            $user['nickname']=get_userinfo($m['manager_id'],'nickname');
		            $user['manager_id']=$m['manager_id'];
		            $users[]=$user;
		        }
		    }
		   $this->assign('users',$users);
		}
		$search=$_REQUEST['order_number'];
		if ($search) {
		    $this->assign ( 'search', $search );
		    
		    $nickname_follow_ids = D ( 'Common/User' )->searchUser ( $search );
		    if (! empty ( $nickname_follow_ids )) {
		        $map ['uid'] = array (
		            'exp',
		            ' in (' . $nickname_follow_ids . ') '
		        );
		    } else {
		        $map ['order_number'] = array (
		          'like',
		          '%' . htmlspecialchars ( $search ) . '%'
		        );
		    }
		    unset ( $_REQUEST ['order_number'] );
		}
		//根订单类型过滤
		$order_from_type = I('order_from_type',0,intval);
		if($order_from_type){
			if($order_from_type==11){
				//来自秒杀的订单
				$seckill_id = $fromMap['seckill_id'] = I('seckill_id',0,intval);
				$fromIds = M('seckill_order')->where($fromMap)->getFields('order_id');
				$map['id'] = array('in',implode(',',$fromIds));
				//dump(implode(',',$fromIds));
			}
		}
		$isDepositPay=I('deposit_pay',0,'intval');
		if ($isDepositPay == 1){
// 			$map['is_deposit']=0;//全额支付
			$map['pay_status']=1;
		}else if($isDepositPay == 2){
			$map['pay_status']=2;
		}else if($isDepositPay == 3){
			$map['pay_status'] =0;
		}
		session ( 'common_condition', $map );
		$list_data = $this->_get_model_list ( $this->model );
		// 分类数据
		$map ['is_show'] = 1;
		$list = M ( 'weisite_category' )->where ( $map )->field ( 'id,title' )->select ();
		$cate [0] = '';
		foreach ( $list as $vo ) {
			$cate [$vo ['id']] = $vo ['title'];
		}
		$orderDao = D ( 'Addons://Shop/Order' );
		// dump($list_data ['list_data']);
		$param['mdm']=$_GET['mdm'];
		$type=1;
		foreach ( $list_data ['list_data'] as &$vo ) {
			$param ['id'] = $vo ['id'];
			
			$order = $orderDao->getInfo ( $vo ['id'] );
			// dump($order);
			$vo = array_merge ( $vo, $order );
			$follow = get_followinfo ( $vo ['uid'] );
			$param2 ['uid'] = $follow ['uid'];
			$vo ['headimgurl'] = $follow ['headimgurl'];
			$vo ['uid'] = '<a target="_blank" href="' . addons_url ( 'UserCenter://UserCenter/detail', $param2 ) . '">' . $follow ['nickname'] . '</a>';
			$vo ['cate_id'] = intval ( $vo ['cate_id'] );
			$vo ['cate_id'] = $cate [$vo ['cate_id']];
			
			$goods = json_decode ( $order ['goods_datas'], true );
			foreach ( $goods as $vv ) {
				$vo ['goods'] .= '<img src="' . get_cover_url ( $vv ['cover'],100,100 ) . '"/>' . $vv ['title'] . '<br><br>';
			}
			$vo ['goods'] = rtrim ( $vo ['goods'], '<br><br>' );
			
			$vo ['order_number'] = '<a href="' . addons_url ( 'Shop://Order/detail', $param ) . '">' . $vo ['order_number'] . '</a>';
			
			$vo ['action'] = '<a href="' . addons_url ( 'Shop://Order/detail', $param ) . '">订单详情</a>';
			if ($vo ['status_code'] == 1 && $vo['is_mail'] == 1) {
				$vo ['action'] .= '<br><br><a class="border-btn btn-small" data-ostate='.$vo['order_state'].' data-href="' . addons_url ( 'Shop://Order/set_confirm', $param ) . '">商家确认</a>';
			}
			$vo ['market_price'] = is_array($vo['market_price'])?$vo['market_price']['market_price']:$vo['market_price'];
			if($type){
				addWeixinLog($vo,'orderindeleflfsf');
				$type=0;
			}
		}
		$this->assign ( $list_data );
		
		$templateFile = $this->model ['template_list'] ? $this->model ['template_list'] : '';
		$this->display ( $templateFile );
	}
	// 通用插件的编辑模型
	public function edit() {
		$model = $this->model;
		$id = I ( 'id' );
		
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $Model->save ()) {
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				
				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'],$this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ();
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'cate_id') {
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
			
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->meta_title = '编辑' . $model ['title'];
			
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
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'],$this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ();
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'cate_id') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			
			$this->assign ( 'fields', $fields );
			$this->meta_title = '新增' . $model ['title'];
			
			$this->display ();
		}
	}
	
	// 通用插件的删除模型
	public function del() {
        $id = I('id', 0, 'intval');
        $orderDao =  D('Addons://Shop/Order');
        $order = $orderDao->find($id);
        if ($order['pay_status']==0 && $order['is_lock']==1 && $order['status_code']==0){
            $goodsDao = D('Addons://Shop/Goods');
            $sec = NOW_TIME - $order['cTime'];
            $goods = json_decode($order['goods_datas'], true);
            foreach ($goods as $g) {
                $num = 0 - $g['num'];
                $orderRes = $goodsDao->setLockNum($num, $g['id'], $g["spec_option_ids"]);
                if ($orderRes && $order['order_from_type'] == 11) {
                    $seckillMap['order_id'] = $order['id'];
                    $sgoodsMap['seckill_id'] = M('seckill_order')->where($seckillMap)->getField('seckill_id');
                    $sgoodsMap['goods_id'] = $g['id'];
                    M('seckill_goods')->where($sgoodsMap)->setInc('seckill_count', $g['num']);
                }
            }
        }
        $key = 'Order_getInfo_' . $id;
        S ( $key,null );
        //返回代金券
        $token=get_token();
        $orderDao->giveBackExtr($id,$token);
		parent::common_del ( $this->model );
	}
	
	// 获取所属分类
	function getCateData() {
		$map ['is_show'] = 1;
		$map ['token'] = get_token ();
		$list = M ( 'weisite_category' )->where ( $map )->select ();
		foreach ( $list as $v ) {
			$extra .= $v ['id'] . ':' . $v ['title'] . "\r\n";
		}
		return $extra;
	}
	function set_show() {
		$save ['is_show'] = 1 - I ( 'is_show' );
		$map ['id'] = I ( 'id' );
		$res = M ( 'shop_goods' )->where ( $map )->save ( $save );
		$this->success ( '操作成功' );
	}
	function detail() {
		$id = I ( 'id' );
		$orderDao = D ( 'Addons://Shop/Order' );
		$orderInfo = $orderDao->getInfo ( $id );
		if ($orderInfo ['coupon_shop_id']){
			$storeInfo=M('coupon_shop')->find($orderInfo['coupon_shop_id']);
			$this->assign('store_info',$storeInfo);
		}
		$address_id = $orderInfo ['address_id'];
		$addressInfo = D ( 'Addons://Shop/Address' )->getInfo ( $address_id );
		$orderInfo ['goods'] = json_decode ( $orderInfo ['goods_datas'], true );
		foreach($orderInfo ['goods'] as &$v){
			if(is_array($v['market_price'])){
				$v['market_price'] = $v['market_price']['market_price'];
			}
		}
		if ($orderInfo['order_state'] != 1){
			$extArr = json_decode($orderInfo['extra'],true);
			$orderInfo['order_state_msg']=$extArr['order_state_msg'];
		}
		// dump ( $orderInfo );
		$this->assign ( 'info', $orderInfo );
		$this->assign ( 'addressInfo', $addressInfo );
		//dump($orderInfo);
		//dump($addressInfo);
		
		if($orderInfo['auto_send']){
			$accountInfo = M('shop_virtual') ->where(array('order_id'=>$id))->find();
			$res =  M('shop_virtual')-> where(array('goods_id'=>$orderInfo['goods_id'])) -> select();
			$this -> assign('accountInfo',$accountInfo);
		}
		$this->display ();
	}
	function do_send() {
		$map ['id'] = I ( 'order_id' );
		
		$save ['send_code'] = I ( 'send_code' );
		if (empty ( $save ['send_code'] )) {
			$this->error ( '请选择物流公司' );
		}
		
		$save ['send_number'] = I ( 'send_number' );
		if (empty ( $save ['send_number'] )) {
			$this->error ( '请填写快递号' );
		}
		
		$save ['is_send'] = 1;
		$save ['send_time'] = time();
		$orderDao = D ( 'Addons://Shop/Order' );
		$res = $orderDao->where ( $map )->save ( $save );
		if ($res) {
			$orderDao->setStatusCode ( $map ['id'], 3 );
			//减去库存
			$orderInfo=$orderDao->getInfo($map['id']);
			$goodsData=json_decode ( $orderInfo ['goods_datas'], true );
			$goodsDao=D('Addons://Shop/Goods');
			foreach ($goodsData as $goods){
			    $goodsMap['id']=$goods['id'];
			    $num=0-$goods["num"];
			    if (empty($goods["spec_option_ids"])){
			        if ($orderInfo['is_lock']==1){
			            $goodsDao->setLockNum($num,$goods['id']);
			        }else{
				        if ($orderInfo['order_from_type'] == '秒杀') {
							$seckillMap['order_id']=$orderInfo['id'];
							$sgoodsMap['seckill_id']=M('seckill_order')->where($seckillMap)->getField('seckill_id');
							D ( 'Addons://Seckill/SeckillGoods' )->reduceCount($sgoodsMap['seckill_id'],$goods['id'],$goods['num']);
						}
			        }
			       $goodsMap['id']=$goods['id'];
			       
			       M('shop_goods')->where($goodsMap)->setDec('stock_num',$goods["num"]);
			      
			    }else{
			        if ($orderInfo['is_lock']==1){
			            $goodsDao->setLockNum($num,$goods['id'],$goods["spec_option_ids"]);
			        }
			       $skuMap['goods_id']=$goods['id'];
			       $skuMap['spec_option_ids']=$goods['spec_option_ids'];
			       M('shop_goods_sku_data')->where($skuMap)->setDec('stock_num',$goods['num']);
			    }
			    //销售量
			    M('shop_goods')->where($goodsMap)->setInc('sale_count',$goods['num']);
			    $goodsDao->getInfo($goods['id'],true);
			}
			$this->success ( '发货成功' );
		} else {
			$this->success ( '发货失败' );
		}
	}
	function get_send_info() {
		$id = I ( 'id' );
		$res = D ( 'Addons://Shop/Order' )->getSendInfo ( $id );
		
		$html = '';
		if ($res ['resultcode'] != 200) {
			$html = '<p>' . $res ['reason'] . '</p>';
		} else {
			foreach ( $res ['result'] ['list'] as $vo ) {
				$html .= '<p>' . $vo ['datetime'] . ' ' . $vo ['zone'] . ' ' . $vo ['remark'] . '</p>';
			}
		}
		echo $html;
	}
	function set_pay_status() {
		$id = I ( 'id' );
		$save ['pay_status'] = 1;
		$res = D ( 'Addons://Shop/Order' )->update ( $id, $save );
		D ( 'Addons://Shop/Order' )->setStatusCode ( $id, 5 );
		$is_distribution=M('shop_distribution_profit')->where(array('order_id'=>$id))->getFields('id');
		if (empty($is_distribution)){
		    //确认已收款，处理分销用户获取的拥金
		   D ( 'Addons://Shop/Distribution' )->do_distribution_profit ( $id );
		}
		echo 1;
	}
	function set_confirm() {
		$id = I ( 'id' );
		$res = D ( 'Addons://Shop/Order' )->setStatusCode ( $id, 2 );
		if ($res) {
			$this->success ( '设置成功' );
		} else {
			$this->success ( '设置失败' );
		}
	}
	
}