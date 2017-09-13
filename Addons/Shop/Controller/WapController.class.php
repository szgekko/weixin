<?php

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class WapController extends AddonsController {
	var $shop_id;
	var $manager_id;
	var $appInfo;
	function _initialize() {
		parent::_initialize ();
		if (! empty ( $_REQUEST ['shop_id'] )) {
			$this->shop_id = I ( 'shop_id' );
			session ( 'wap_shop_id', $this->shop_id );
		} else {
			$this->shop_id = session ( 'wap_shop_id' );
		}
		$shop = D ( 'Shop' )->getInfo ( $this->shop_id );
		if (empty ( $this->shop_id )) {
			$this->shop_id = $shop ['id'];
		}
		
		if (! empty ( $_REQUEST ['uid'] )) {
			$this->manager_id = I ( 'uid' );
			session ( 'wap_manager_id', $this->manager_id );
		} else if (session ( 'wap_manager_id' )) {
			$this->manager_id = session ( 'wap_manager_id' );
		} else {
			$this->manager_id = $shop ['manager_id'];
		}
		// 自定义页面
		$token = get_token ();
		$this->appInfo= get_token_appinfo($token);
		$this->assign('public_info',$this->appInfo);
		$shop ['logo'] = get_cover_url ( $shop ['logo'], 100, 100 );
		if (_ACTION == 'diy_page'){
		    $id = I ( 'id' ,0,'intval');
		    $diyPData = D ( 'DiyPage' )->getInfo ( $id );
		    if ($diyPData ['is_index']) {
		        $is_diy =$id;
		    } 
		}else{
		    $key = 'diypage_is_index_' . $token;
		    $is_diy = S ( $key );
		    //S ( $key ,null);
		}
		if ($is_diy) {
            $indexUrl = U('diy_page', array(
                'shop_id' => $this->shop_id,
                'id' => $is_diy,
                'uid' => $this->manager_id,
                'publicid' => $this->appInfo['id']
            ));
        } else {
			$indexUrl = U('index', array(
                'shop_id' => $this->shop_id,
                'uid' => $this->manager_id,
                'publicid' => $this->appInfo['id']
            ));
        }
		$this->assign ( 'indexurl', $indexUrl );
		
		// 监控锁定商品数量
		D ( 'Addons://Shop/Goods' )->checkLockNum ( $this->shop_id );
		$config = get_addon_config ( 'Shop' );
		// 开启分销制度
		if ($config ['need_distribution'] == 1) {
			$level = $config ['level'];
			// if ($level == 1) {
			// 判断是否为分销用户 ， 若是则赋值给 manager_id
			$duserinfo = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $this->manager_id );
			if (! empty ( $duserinfo ) && $duserinfo ['level'] > 0 && $duserinfo ['is_audit'] == 1) {
				$truename = get_userinfo ( $duserinfo ['uid'], 'truename' );
				$shop ['title'] = empty ( $duserinfo ['shop_name'] ) ? $truename . ' 的小店' : $duserinfo ['shop_name'];
				$shop ['logo'] = empty ( $duserinfo ['shop_logo'] ) ? get_userface ( $duserinfo ['uid'] ) : $duserinfo ['shop_logo'];
				$this->assign ( 'is_duser', $duserinfo ['uid'] );
				
				// 设置用户 mid 是manager 带来的用户
				$smap ['uid'] = $this->mid;
				// $smap['duid'] = $this->manager_id;
				$smap ['token'] = get_token ();
				$sf = M ( 'shop_statistics_follow' )->where ( $smap )->find ();
				if (! $sf && $smap ['uid'] != $this->manager_id && $smap ['uid'] > 0) {
					$addSf ['uid'] = $this->mid;
					$addSf ['duid'] = $this->manager_id;
					$addSf ['token'] = get_token ();
					$addSf ['ctime'] = time ();
					$addSf ['openid'] = get_openid ();
					M ( 'shop_statistics_follow' )->add ( $addSf );
				}
			}
			if ($this->mid != $this->manager_id) {
				$meduser = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $this->mid );
				if (! empty ( $meduser ) && $meduser ['level'] > 0 && $meduser ['is_audit'] == 1) {
					$this->assign ( 'show_my_shop', $meduser ['uid'] );
				}
			} else {
				$this->assign ( 'me_is_duser', $duserinfo ['uid'] );
			}
			
			// }
		} else if ($config ['need_sem'] == 1) {
			// 全员微营销
			$duserinfo = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $this->manager_id );
			if (! empty ( $duserinfo ) && $duserinfo ['level'] > 0 && $duserinfo ['is_audit'] == 1 && $duserinfo ['enable'] == 1) {
				// 设置用户 mid 是manager 带来的用户
				$smap ['uid'] = $this->mid;
				// $smap['duid'] = $this->manager_id;
				$smap ['token'] = get_token ();
				$sf = M ( 'shop_statistics_follow' )->where ( $smap )->find ();
				if (! $sf && $smap ['uid'] != $this->manager_id && $smap ['uid'] > 0) {
					$addSf ['uid'] = $this->mid;
					$addSf ['duid'] = $this->manager_id;
					$addSf ['token'] = get_token ();
					$addSf ['ctime'] = time ();
					$addSf ['openid'] = get_openid ();
					M ( 'shop_statistics_follow' )->add ( $addSf );
				}
			}
		}
		// dump ( $this->shop_id );
		empty ( $shop ['template'] ) && $shop ['template'] = 'jd';
		
		define ( 'CUSTOM_TEMPLATE_PATH', ONETHINK_ADDON_PATH . '/Shop/View/default/Wap/Template/' . $shop ['template'] . '/' );
		
		$cart_count = count ( D ( 'Cart' )->getMyCart ( $this->mid, true ) );
		$cart_count == 0 && $cart_count = '';
		$this->assign ( 'cart_count', $cart_count );
		$this->assign('shop_id', $this->shop_id);
        $gpsArr = wp_explode($shop['gps']);
        $shop['gps'] = $gpsArr[1] . ',' . $gpsArr['0'];
        $this->assign('shop', $shop);
		if (empty ( $shop ['intro'] )) {
			$shareDesc = $shop ['title'];
		} else {
			$shareDesc = filter_line_tab ( $shop ['intro'] );
		}
		$this->assign ( 'share_uid', $this->manager_id );
		$this->assign ( 'shop_share', $shareDesc );
		empty ( $shop ['custom_tip'] ) && $shop ['custom_tip'] = '暂无联系客服的联系内容！';
		$this->assign ( 'kefu', $shop ['custom_tip'] );
		$paymentConfig = get_addon_config('Payment');
		$this->assign('payment_config',$paymentConfig);
	}
	// 首页
	function index() {
		$map1 ['uid'] = $this->manager_id;
		// 判断是否为公众号管理员
		$is_public = is_manager($this->manager_id);
		if (!$is_public ) {
			redirect ( U ( 'lists', array (
					'shop_id' => $this->shop_id 
			) ) );
		}
		
		// banner
		$slideshow_list = D ( 'Slideshow' )->getShopList ( $this->shop_id );
		// dump($slideshow_list);exit;
		$this->assign ( 'slideshow_list', $slideshow_list );
		
		// recommend_cate
		$recommend_cate = D ( 'Category' )->getRecommendList ( $this->shop_id );
		$this->assign ( 'recommend_cate', $recommend_cate );
		
		// 推荐商品
		$recommend_list = D ( 'Goods' )->getRecommendList ( $this->shop_id );
		$this->assign ( 'recommend_list', $recommend_list );
		
		// 所有商品
		
		$goods_list = D ( 'Goods' )->getNewsList ( $this->shop_id, $this->manager_id );
		// dump($goods_list);
		$this->assign ( 'goods_list', $goods_list );
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'index';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		// dump($CUSTOM_TEMPLATE_PATH);exit;
		$this->display ( CUSTOM_TEMPLATE_PATH . 'index.html' );
	}
	function _spec_list() {
		$spec_map ['uid'] = $this->mid;
		$spec_arr = M ( 'shop_spec' )->where ( $spec_map )->order ( 'sort asc' )->getFields ( 'id,title' );
		
		if (empty ( $spec_arr ))
			return false;
		
		$default = I ( 'option_ids' );
		$default_arr = array_unique ( array_filter ( explode ( ',', $default ) ) );
		
		$ids = array_keys ( $spec_arr );
		$option ['spec_id'] = array (
				'in',
				$ids 
		);
		
		$option_list = M ( 'shop_spec_option' )->where ( $option )->order ( 'sort asc' )->select ();
		foreach ( $option_list as $ol ) {
			$res [$ol ['spec_id']] ['id'] = $ol ['spec_id'];
			$res [$ol ['spec_id']] ['title'] = $spec_arr [$ol ['spec_id']];
			
			$ol ['checked'] = '';
			if (! empty ( $default_arr ) && in_array ( $ol ['id'], $default_arr )) {
				$ol ['checked'] = 'checked="checked"';
			}
			
			$res [$ol ['spec_id']] ['options'] [$ol ['id']] = $ol;
		}
		$this->assign ( 'spec_list', $res );
		
		return $res;
	}
    private function _show_subscribe(){
        $map1['token'] = $map ['token'] = get_token ();
        $map ['uid'] = $this->mid;
        $has_subscribe = intval ( M ( 'public_follow' )->where ( $map )->getField ( 'has_subscribe' ) );
        if ($has_subscribe){
            $duserinfo = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $this->manager_id );
            if (! empty ( $duserinfo ) && $duserinfo ['level'] > 0 && $duserinfo ['is_audit'] == 1) {
                $map1['openid']=get_openid();
                $res1 = M('shop_statistics_follow')->where($map1)->getField('id');
                if (! $res1) {
                    $has_subscribe=0;
                }
            }
        }
        $this->assign ( 'has_subscribe', $has_subscribe );
    }
	// 产品列表
	function lists() {
	   $this->_show_subscribe();
		$this->_spec_list ();
		$search_key = I ( 'search_key' );
		
		$is_new = I ( 'is_new' );
		$cateIdstr = I ( 'category_ids' );
		$newArr = wp_explode ( $is_new, ',' );
		$cateArr = wp_explode ( $cateIdstr, "," );
		$this->assign ( 'new_arr', $newArr );
		// $this->assign('cate_arr',$cateArr);
		if ($is_new || $cateIdstr) {
			$goodsIds = $this->_get_search_goodsid ( $is_new, $cateIdstr );
		}
		$type = I ( 'order_type', 'desc' );
		$orderField = I ( 'order_key', 'id' ) ;
		$order = $orderField . ' ' . $type;
		
		$category_id = I ( 'category_id', 0, 'intval' );
		$this->assign ( 'category_id', $category_id );
		$_GET ['order_type'] = $type;
		$goods_list = D ( 'Goods' )->getList ( $this->shop_id, $search_key, $order, 0, 10, $category_id, $this->manager_id, $goodsIds );
		// 获取最后的id
		$lastgoods = end ( array_sort ( $goods_list, 'id', $type ) );
		$this->assign ( 'lastId', $lastgoods ['id'] );
		$this->assign ( 'goods_list', $goods_list );
		
		$categoryData = $this->get_grade_category ();
		$sublists = json_decode ( $categoryData ['sub_lists'], true );
		foreach ( $sublists as $sub ) {
			foreach ( $sub as $ss ) {
				$subdata [$ss ['id']] = $ss;
			}
		}
		foreach ( $cateArr as $cc ) {
			if ($subdata [$cc]) {
				$reStr [$subdata [$cc] ['pid']] .= $cc . ',';
				$reTitleStr [$subdata [$cc] ['pid']] .= $subdata [$cc] ['title'] . ',';
			}
		}
		foreach ( $reTitleStr as &$t ) {
			$t = substr ( $t, 0, strlen ( $t ) - 1 );
		}
		$this->assign ( 'cate_title_arr', $reTitleStr );
		// foreach ($reTitleStr as &$tt){
		// $tt = substr($tt, 0,strlen($tt)-1);
		// }
		$this->assign ( 'cate_arr', $reStr );
		$this->assign ( $categoryData );
		$this->display ( CUSTOM_TEMPLATE_PATH . 'lists.html' );
	}
	function goodsListsByCategory() {
		// $this->_getShopCategory ();
		$cateId = I ( 'cid1' );
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		// $map ['is_show']=1;
		// $map ['is_delete']=0;
		$map ['category_second|category_first'] = array (
				'eq',
				$cateId 
		);
		$goodsIds = M ( 'goods_category_link' )->where ( $map )->getFields ( 'goods_id' );
		$type = I ( 'order_type', 'desc' );
		$order = I ( 'order_key', 'id' ) . ' ' . $type;
		$_GET ['order_type'] = $type;
		
		$goodsDao = D ( 'Addons://Shop/Goods' );
		if ($goodsIds) {
			$map1 ['id'] = array (
					'in',
					$goodsIds 
			);
		} else {
			$map1 ['id'] = 0;
		}
		$map1 ['is_show'] = 1;
		$goods = $goodsDao->where ( $map1 )->order ( $order )->getFields ( 'id' );
		foreach ( $goods as $k => $v ) {
			// if (strstr ( $v, $cateId )) {
			$goodsInfo = $goodsDao->getInfo ( $v );
			if ($goodsInfo['stock_total_num']){
			    $goods_list [] = $goodsInfo;
			}
			// }
		}
		
		// 获取最后的id
		$lastgoods = end ( array_sort ( $goods_list, 'id', $type ) );
		$this->assign ( 'lastId', $lastgoods ['id'] );
		// $goods_list = D ( 'Goods' )->getList ( $this->shop_id, '', 'id desc',0,10,$cateId ,$this->manager_id);
		$this->assign ( 'goods_list', $goods_list );
		$this->assign ( 'category_id', $cateId );
		
		$categoryData = $this->get_grade_category ();
		$sublists = json_decode ( $categoryData ['sub_lists'], true );
		foreach ( $sublists as $sub ) {
			foreach ( $sub as $ss ) {
				$subdata [$ss ['id']] = $ss;
			}
		}
		foreach ( $cateArr as $cc ) {
			if ($subdata [$cc]) {
				$reStr [$subdata [$cc] ['pid']] .= $cc . ',';
				$reTitleStr [$subdata [$cc] ['pid']] .= $subdata [$cc] ['title'] . ',';
			}
		}
		foreach ( $reTitleStr as &$t ) {
			$t = substr ( $t, 0, strlen ( $t ) - 1 );
		}
		$this->assign ( 'cate_title_arr', $reTitleStr );
		// foreach ($reTitleStr as &$tt){
		// $tt = substr($tt, 0,strlen($tt)-1);
		// }
		$this->assign ( 'cate_arr', $reStr );
		$this->assign ( $categoryData );
		$this->display ( CUSTOM_TEMPLATE_PATH . 'lists.html' );
	}
	// 用于ajax加载
	function product_model() {
		$last_id = I ( 'lastId', 0, 'intval' );
		$count = I ( 'count', 10, 'intval' );
		$search_key = I ( 'search_key' );
		$pageIds = I ( 'pageIds' );
		$pageIdArr = wp_explode ( $pageIds, "," );
		$pageIdArr = array_unique ( $pageIdArr );
		$is_new = I ( 'is_new' );
		$cateIdstr = I ( 'category_ids' );
		$newArr = wp_explode ( $is_new, ',' );
		$cateArr = wp_explode ( $cateIdstr, "," );
		$this->assign ( 'new_arr', $newArr );
		$this->assign ( 'cate_arr', $cateArr );
		
		if ($is_new || $cateIdstr) {
			$goodsIds = $this->_get_search_goodsid ( $is_new, $cateIdstr );
		}
		$category_id = I ( 'category_id', 0, 'intval' );
		$this->assign ( 'category_id', $category_id );
		$type = I ( 'order_type', 'desc' );
		$field = I ( 'order_key', 'id' );
		$order = $field . ' ' . $type;
		$_GET ['order_type'] = $type;
		
		$goods_list = D ( 'Goods' )->getList ( $this->shop_id, $search_key, $order, $last_id, 10, $category_id, 0, $goodsIds, $field, $pageIdArr );
		// dump($goods_list);
		// 获取最后的id
		$lastgoods = end ( array_sort ( $goods_list, 'id', $type ) );
		$this->assign ( 'lastId', $lastgoods ['id'] );
		$this->assign ( 'goods_list', $goods_list );
		
		$this->display ( CUSTOM_TEMPLATE_PATH . 'product_model.html' );
	}
	// 产品详情
	function detail() {
		$this->_getShopCategory ();
		session ( 'order_sn_id', null );
		$id = I ( 'id' );
		$goods = D ( 'Goods' )->getInfo ( $id );
		// diy
		$map ['id'] = $goods ['diy_id'];
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		
		// 促销活动
		$this->reward ( $id );
		// 秒杀活动
		$seckill_id = I ( 'seckill_id', 0, intval );
		if ($seckill_id) {
			$secMap ['id'] = $secGoodsMap ['seckill_id'] = $seckill_id;
			$secGoodsMap ['goods_id'] = $id;
			$seckill_info = M ( 'seckill' )->where ( $secMap )->find ();
			if (NOW_TIME < $seckill_info ['start_time']) {
				$this->error ( '对不起，活动未开始' );
			}
			if (NOW_TIME > $seckill_info ['end_time']) {
				$this->error ( '对不起，活动已结束' );
			}
			$seckill_goods = M ( 'seckill_goods' )->where ( $secGoodsMap )->find ();
			
			if ($seckill_goods['seckill_count']<=0){
			    $this->error('抱歉，商品已被抢完！',addons_url('Seckill://Wap/index',array('id'=>$seckill_id)));
			}
			if (NOW_TIME > $seckill_info ['start_time'] && NOW_TIME < $seckill_info ['end_time'] && $seckill_goods ['seckill_count'] > 0) {
			    if ($goods['stock_num'] >= $seckill_goods['seckill_count']){
			        $goods['stock_num']=$seckill_goods['seckill_count'];
			    }
				$seckill_info = array_merge($seckill_info,$seckill_goods);
				$seckill_info['left_time'] = $seckill_info['end_time'] - NOW_TIME;
				$this -> assign('seckill_info',$seckill_info);
			}
		}
		// 获取商品评论信息
		$comments = D ( 'Addons://Shop/GoodsComment' )->getShopComment ( $goods ['id'] );
		foreach ( $comments as &$cc ) {
			$name = get_username ( $cc ['uid'] );
			if ($name) {
				$cc ['username'] = $this->hideStr ( $name, 1, 1, 4, $glue = "*" );
			} else {
				$cc ['username'] = '匿名';
			}
		}
		$this->assign ( 'comments', $comments );
		$this->assign ( 'comment_count', count ( $comments ) );
		//判断是否收藏
		$data ['uid'] = $this->mid;
		$data ['goods_id'] = $id;
		$collData=D('Addons://Shop/Collect') ->where ( $data )->find();
		if (empty($collData)){
		    $goods['is_collect']=0;
		}else{
		    $goods['is_collect']=1;
		}
		$this->assign ( 'goods', $goods );
		// dump(CUSTOM_TEMPLATE_PATH);
		$this->display ( CUSTOM_TEMPLATE_PATH . 'detail.html' );
	}
	function reward($id, $total_price = 0) {
		$reward_map ['token'] = get_token ();
		$reward_map ['start_time'] = array (
				'lt',
				NOW_TIME 
		);
		$reward_map ['end_time'] = array (
				'gt',
				NOW_TIME 
		);
		if (is_array ( $id )) {
			$id = array_unique ( array_filter ( $id ) );
			$where = '';
			foreach ( $id as $i ) {
				$where .= 'goods_ids LIKE "%' . $i . ',%" OR ';
			}
			$where .= 'is_all_goods=0';
		} else {
			$where = 'goods_ids LIKE "%' . $id . ',%" OR is_all_goods=0';
		}
		
		$cond_map ['reward_id'] = M ( 'shop_reward' )->where ( $reward_map )->where ( $where )->order('id desc')->getField ( 'id' );
		
		$reward_tips = array ();
		if (! empty ( $cond_map ['reward_id'] )) {
			$cond_list = M ( 'shop_reward_condition' )->where ( $cond_map )->order ( 'sort asc')->select ();
			foreach ( $cond_list as $vo ) {
				$cd = $vo ['condition'];
				$conditionArr [$cd] = $vo;
				$reward_tips [$cd] .= '满' . $vo ['condition'] . '元';
				empty ( $vo ['money'] ) || $reward_tips [$cd] .= '减' . $vo ['money_param'] . '元，';
				empty ( $vo ['postage'] ) || $reward_tips [$cd] .= '包邮，';
				empty ( $vo ['score'] ) || $reward_tips [$cd] .= '送' . $vo ['score_param'] . '积分，';
				
				if (! empty ( $vo ['shop_coupon'] )) {
					$coupon = M ( 'shop_coupon' )->find ( $vo ['shop_coupon_param'] );
					$reward_tips [$cd] .= $coupon ['is_money_rand'] ? "送价值{$coupon['money']}~{$coupon['money_max']}元的随机现金优惠券，" : '送价值' . $coupon ['money'] . '元现金优惠券，';
				}
				
				$reward_tips [$cd] = rtrim ( $reward_tips [$cd], '，' ) . '; ';
			}
		}
		
		if ($total_price > 0) {
			krsort ( $conditionArr, SORT_NUMERIC );
			foreach ( $conditionArr as $ct ) {
				if ($total_price >= $ct ['condition']) {
					$reward_info = $ct;
					$this->assign ( 'reward_tips', $reward_tips [$ct ['condition']] );
					break;
				}
			}
		} else {
			$this->assign ( 'reward_tips', implode ( ' ', $reward_tips ) );
		}
		
		return $reward_info;
	}
	function detail_more() {
		$id = I ( 'id' );
		$goods = D ( 'Goods' )->getInfo ( $id );
		$this->assign ( 'goods', $goods );
		// dump ( $goods['attr_list'] );
		
		$this->display ();
	}
	// 加入购物车
	function addToCart() {
		$goods ['seckill_id'] = I ( 'get.seckill_id' );
		$goods ['goods_id'] = I ( 'goods_id' );
		$info = D ( 'goods' )->getInfo ( $goods ['goods_id'] );
		$goods ['spec_option_ids'] = $soid = I ( 'get.spec_option_ids' );
		! empty ( $soid ) && isset ( $info ['sku_data'] [$soid] ) && $info ['market_price'] = $info ['sku_data'] [$soid];
		$goods ['price'] = $info ['market_price'];
		$goods ['shop_id'] = $info ['shop_id'];
		
		$goods ['uid'] = $this->mid;
		$goods ['num'] = I ( 'buyCount' );
		$goods ['cTime'] = time ();
		
		echo D ( 'Cart' )->addToCart ( $goods );
	}
	// 加入收藏
	function addToCollect() {
		$goods_id = I ( 'goods_id' );
		echo D ( 'Collect' )->addToCollect ( $this->mid, $goods_id );
	}
	// 用户中心
	function user_center() {
		$follow_id = $this->mid;
		$follow = get_followinfo ( $follow_id );
		$this->assign ( 'follow', $follow );
		// dump($follow);
		// 全部订单
		$orderUrl = addons_url ( 'Shop://Wap/myOrder', array (
				'shop_id' => $this->shop_id 
		) );
		$this->assign ( 'ordersUrl', $orderUrl );
		// 获取待付款
		$unPayUrl = addons_url ( 'Shop://Wap/unPayOrder', array (
				'shop_id' => $this->shop_id 
		) );
		$this->assign ( 'unPayUrl', $unPayUrl );
		// 我的购物车
		$cartUrl = addons_url ( 'Shop://Wap/cart', array (
				'shop_id' => $this->shop_id 
		) );
		$this->assign ( 'cartUrl', $cartUrl );
		// 我的收藏
		$collectUrl = addons_url ( 'Shop://Wap/myCollect', array (
				'shop_id' => $this->shop_id 
		) );
		$this->assign ( 'collectUrl', $collectUrl );
		// 我的收获地址
		$addressUrl = addons_url ( 'Shop://Wap/myAddress', array (
				'shop_id' => $this->shop_id 
		) );
		$this->assign ( 'addressUrl', $addressUrl );
		// 我的店铺
		$config = get_addon_config ( 'Shop' );
		if ($config ['need_distribution']) {
			$dUser = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $follow_id );
			if (empty ( $dUser )) {
				$myShopUrl = addons_url ( 'Shop://Wap/distribution_reg', array (
						'shop_id' => $this->shop_id 
				) );
			} else if ($dUser ['is_audit'] == 1) {
				$myShopUrl = addons_url ( 'Shop://Wap/distribution', array (
						'shop_id' => $this->shop_id,
						'uid' => $dUser ['uid'] 
				) );
			} else if ($dUser ['is_audit'] == 0) {
				$myShopUrl = 'check_audit';
				$this->assign ( 'audit_msg', '工作人员将在1~2个工作日审核，请耐心等待！' );
			} else {
				$myShopUrl = 'check_audit';
				$this->assign ( 'audit_msg', '审核未通过' );
			}
		} else {
			$myShopUrl = '';
		}
		$this->assign ( 'myShopUrl', $myShopUrl );
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'userCenter';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		
		// if ($config['need_distribution']){
		// $shopInfo = D('Addons://Shop/Shop')->where(array('manager_id'=>$this->mid))->find();
		// $pArr=wp_explode($shopInfo['parent_shop']);
		// //分销用户级别
		// $count=count($pArr);
		// $level=$config['level'];
		// if ($count){
		// //可获佣金比例
		// if ($count==1){
		// $profit=$config['level1'];
		// $rank=1;
		// }else if($count ==2){
		// if ($level==1){
		// $rank=1;
		// $profit=$config['level1'];
		// }else{
		// $profit=$config['level2'];
		// $rank=2;
		// }
		// }else {
		// if ($level==1){
		// $rank=1;
		// $profit=$config['level1'];
		// }else if($level == 2){
		// $rank=2;
		// $profit=$config['level2'];
		// }else{
		// $rank=3;
		// $profit=$config['level3'];
		// }
		// }
		// $this->assign('profit_percent',$profit);
		// $this->assign('level',$rank);
		// }
		// }
		
		$this->display ();
	}
	// 全部订单
	function myOrder() {
		$map ['uid'] = $this->mid;
		D ( 'Addons://Shop/Order' )->refreshPayStatus ( $map ['uid'] );
		// $map ['uid']=0;
		$myorders = D ( 'Addons://Shop/Order' )->getOrderList ( $map );
		// dump('--全部订单--');
		$this->assign ( 'allClass', 'current' );
		$this->assign ( 'orderList', $myorders );
		
		D ( 'Addons://Shop/Order' )->autoSetFinish ();
		
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'orderlist';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		$this->display ( 'order_list' );
	}
	// 已付款
	function payOrder() {
		$map ['uid'] = $this->mid;
		D ( 'Addons://Shop/Order' )->refreshPayStatus ( $map ['uid'] );
		$type = I ( 'paytype', 0, 'intval' );
		if ($type == 0) {
			$map ['pay_status'] = 1;
			$this->assign ( 'payClass', 'current' );
		} else {
			$map ['pay_status'] = 2;
			$this->assign ( 'payDepositClass', 'current' );
		}
		$unPayOrders = D ( 'Addons://Shop/Order' )->getOrderList ( $map );
		
		foreach ( $unPayOrders as &$pay ) {
			foreach ( $pay ['goods'] as &$gg ) {
				if (is_array ( $gg ['market_price'] )) {
					$gg ['all_price'] = $gg ['market_price'] ['market_price'] * $gg ['num'];
				} else {
					$gg ['all_price'] = $gg ['market_price'] * $gg ['num'];
				}
			}
		}
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'orderlist';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		// dump('--待付款--');
		// dump($unPayOrders);
		$this->assign ( 'orderList', $unPayOrders );
		$this->display ( 'order_list' );
	}
	// 获取待付款
	function unPayOrder() {
		$map ['uid'] = $this->mid;
		D ( 'Addons://Shop/Order' )->refreshPayStatus ( $map ['uid'] );
		$map ['pay_status'] = 0;
		$unPayOrders = D ( 'Addons://Shop/Order' )->getOrderList ( $map );
		
		foreach ( $unPayOrders as &$pay ) {
			foreach ( $pay ['goods'] as &$gg ) {
				if (is_array ( $gg ['market_price'] )) {
					$gg ['all_price'] = $gg ['market_price'] ['market_price'] * $gg ['num'];
				} else {
					$gg ['all_price'] = $gg ['market_price'] * $gg ['num'];
				}
			}
		}
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'orderlist';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		// dump('--待付款--');
		// dump($unPayOrders);
		
		$this->assign ( 'unPayClass', 'current' );
		$this->assign ( 'orderList', $unPayOrders );
		$this->display ( 'order_list' );
	}
	// 配送中
	function shippingOrder() {
		$map ['uid'] = $this->mid;
		D ( 'Addons://Shop/Order' )->refreshPayStatus ( $map ['uid'] );
		$map ['is_send'] = 1;
		$unPayOrders = D ( 'Addons://Shop/Order' )->getOrderList ( $map );
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'orderlist';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		// dump('--配送中--');
		$this->assign ( 'shippingClass', 'current' );
		$this->assign ( 'orderList', $unPayOrders );
		$this->display ( 'order_list' );
	}
	// 待评价
	function waitCommentOrder() {
		$map ['uid'] = $this->mid;
		D ( 'Addons://Shop/Order' )->refreshPayStatus ( $map ['uid'] );
		$map ['is_send'] = 2;
		$map ['status_code'] = array (
				'between',
				array (
						'4',
						'6' 
				) 
		);
		$unPayOrders = D ( 'Addons://Shop/Order' )->getOrderList ( $map );
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'orderlist';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
		// dump('--待评价--');
		$this->assign ( 'waitClass', 'current' );
		$this->assign ( 'orderList', $unPayOrders );
		$this->display ( 'order_list' );
	}
	function orderDetail() {
		$id = $map ['order_id'] = I ( 'id', 0, intval );
		if (empty ( $id )) {
			$this->error ( '订单不存在!' );
		}
		$orderDao = D ( 'Addons://Shop/Order' );
		$orderInfo = $orderDao->getInfo ( $id );
		if ($orderInfo ['coupon_shop_id']) {
			$storeInfo = M ( 'coupon_shop' )->find ( $orderInfo ['coupon_shop_id'] );
			$this->assign ( 'store_info', $storeInfo );
		}
		$address_id = $orderInfo ['address_id'];
		$addressInfo = D ( 'Addons://Shop/Address' )->getInfo ( $address_id );
		// dump($addressInfo);
		// dump($orderInfo);
		$shop_id = $this->shop_id;
		$data = D ( 'shop' )->getInfo ( $shop_id, true );
		// dump($data);
		$orderInfo ['mobile'] = $data ['mobile'];
		$orderInfo ['address'] = $data ['address'];
		$orderInfo ['reserve_price'] = $orderInfo ['deposit_money'];
		$orderInfo ['rest_price'] = $orderInfo ['total_price'] - $orderInfo ['reserve_price'];
		$orderInfo ['goods'] = json_decode ( $orderInfo ['goods_datas'], true );
		$this->assign ( 'info', $orderInfo );
		// dump($orderInfo);
		$this->assign ( 'addressInfo', $addressInfo );
		if ($orderInfo ['status_code'] == 3 && $orderInfo ['auto_send'] == 0) { // 在配送中的订单自动从接口获取快递信息
			$res = $orderDao->getSendInfo ( $id );
		}
		
		$log = M ( 'shop_order_log' )->where ( $map )->order ( 'status_code desc,cTime desc' )->select ();
		$this->assign ( 'log', $log );
		
		if ($orderInfo ['auto_send']) {
			$accountInfo = M ( 'shop_virtual' )->where ( array (
					'order_id' => $id 
			) )->find ();
// 			$res = M ( 'shop_virtual' )->where ( array (
// 					'goods_id' => $orderInfo ['goods_id'] 
// 			) )->select ();
			$this->assign ( 'accountInfo', $accountInfo );
		}
		$this->display ();
	}
	// 我的收藏
	function myCollect() {
		$follow_id = $this->mid;
		$myCollect = D ( 'Collect' )->getMyCollect ( $follow_id ,true);
		// dump($myCollect);
		$this->assign ( 'myCollect', $myCollect );
		$this->display ();
	}
	// 我的收获地址
	function myAddress() {
		$list = D ( 'Address' )->getUserList ( $this->mid );
		// dump ( $list );
		$this->assign ( 'lists', $list );
		
		$this->display ();
		
		/*
		 * $follow_id = $this->mid;
		 * $myadress = D('Addons://Shop/Address')->getMyAddress($follow_id);
		 * dump($myadress);
		 * $this -> assign('lists',$myadress);
		 * $this -> display();
		 */
	}
	// 购物车
	function cart() {
		$list = D ( 'Cart' )->getMyCart ( $this->mid, true );
		// diy
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$map ['use'] = 'cart';
		$diyRes = M ( 'shop_page' )->where ( $map )->find ();
		$diyData = D ( 'DiyPage' )->getInfo ( $diyRes ['id'], false, $diyRes );
		$this->assign ( 'diyData', $diyData );
// 		dump($list);
		$this->assign ( 'lists', $list );
		$this->assign ( 'shop_id', $map ['shop_id'] );
		// dump($list);
		$this->display ();
	}
	function delCart() {
		$ids = I ( 'ids' );
		echo D ( 'Cart' )->delCart ( $ids );
	}
	// 订单确认
	function confirm_order() {
		// 支付配置信息
		$payInfo = M ( 'payment_set' )->where ( array (
				'token' => get_token () 
		) )->find ();
		// 商城配置
		$shopConfig = get_addon_config ( 'Shop' );
		// 订单信息
		if (IS_POST) {
			$dao = D ( 'Goods' );
			$canDeposit = 0;
			$canReduceScore = 0;
			$data['is_cuxiao'] = 0;
			if (isset ( $_POST ['goods_ids'] )) {
				$goods_ids = I ( 'post.goods_ids' );
				$numArr = I ( 'post.buyCount' );
				$spec_option_ids = I ( 'post.spec_option_ids' );
				$data['is_card_goods']=$is_cart_goods = I ( 'post.is_cart_goods' );
				$data['cart_ids']= I ( 'post.cart_ids' );
				foreach ( $goods_ids as $id ) {
					$goods = $dao->getInfo ( $id );
					if ($goods ['can_deposit'] == 1) {
						$canDeposit = 1;
					}
					$goods ['num'] = $numArr [$id];
					$goods ['spec_option_ids'] = $spec_option_ids [$id];
					$detialurl = U ( 'detail', array (
							'id' => $id,
							'seckill_id' => $_POST ['seckill_id'] 
					) );
					if ($is_cart_goods && $goods ['spec_option_ids']) {
						$goodsNum = $goods ['sku_data'] [$goods ['spec_option_ids']] ['stock_num'] + $goods ['sku_data'] [$goods ['spec_option_ids']] ['lock_num'];
						if ($goods ['num'] > $goodsNum) {
							$this->error ( $goods ['title'] . '商品库存数量不足！', $detialurl );
							exit ();
						}
					} else if ($is_cart_goods && ! $goods ['spec_option_ids']) {
						$goodsNum = $goods ['stock_num'] + $goods ['lock_num'];
						if ($goods ['num'] > $goodsNum) {
							$this->error ( $goods ['title'] . '商品库存数量不足！', $detialurl );
							exit ();
						}
					} else if (! $is_cart_goods && $goods ['spec_option_ids'] && $goods ['sku_data'] [$goods ['spec_option_ids']] ['stock_num'] < $goods ['num']) {
						$this->error ( $goods ['title'] . '商品库存数量不足！', $detialurl );
						exit ();
					} else if (! $is_cart_goods && ! $goods ['spec_option_ids'] && $goods ['stock_num'] < $goods ['num']) {
						$this->error ( $goods ['title'] . '商品库存数量不足！', $detialurl );
						exit ();
					}
					// 锁定商品数量
					// D('Addons://Shop/Goods')->setLockNum($goods ['num'],$id,$goods['sku_data_defalut']);
					if ($_POST ['seckill_price']) {
					    $goods['show_price']=$_POST ['seckill_price'];
						$goods ['seckill_price'] = $_POST ['seckill_price'];
						$total_price += $goods ['num'] * $_POST ['seckill_price'];
						$data ['order_from_type'] = 11; // 订单来自秒杀
						$data ['seckill_id'] = $_POST ['seckill_id']; // 订单来自秒杀
							                                            // D ( 'Addons://Seckill/SeckillGoods' )->reduceCount($data['seckill_id'],$id,$goods['num']);
					} else {
						$canReduceScore += $goods ['reduce_score'];
						$saveprice = 0;
						if (! empty ( $goods ['spec_option_ids'] )) {
							$pricedata = $goods ['sku_data'] [$goods ['spec_option_ids']];
							if (floatval ( $pricedata ['sale_price'] ) > 0) {
							    $data['is_cuxiao'] = 1;
                                $goods['show_price'] = $pricedata['sale_price'];
								$saveprice = $goods ['num'] * $pricedata ['sale_price'];
							} else {
							    $goods['show_price'] = $pricedata['market_price'];
								$saveprice = $goods ['num'] * $pricedata ['market_price'];
							}
						} else {
							if (floatval($goods ['sale_price']) >0) {
							    $data['is_cuxiao'] = 1;
							    $goods['show_price'] =  $goods ['sale_price'];
								$saveprice = $goods ['num'] * $goods ['sale_price'];
							} else {
							    $goods['show_price'] =  $goods ['market_price'];
								$saveprice = $goods ['num'] * $goods ['market_price'];
							}
						}
						$total_price += $saveprice;
					}
					// 计算订金金额
					if ($goods ['can_deposit'] == 1) {
						$goods ['deposit_price'] = $saveprice * ($payInfo ['deposit'] / 100);
                        $goods['deposit_price'] = round($goods['deposit_price'], 2) > 0 ? $goods['deposit_price'] : 0.01;
						$total_deposit += $goods ['deposit_price'];
					} else {
						$goods ['deposit_price'] = - 1;
						if ($goods ['sale_price']) {
							$total_deposit += $saveprice;
						} else {
							$total_deposit += $saveprice;
						}
					}
					$list [] = $goods;
				}
				// 获取所有商品公用门店
				
				$this->assign ( 'is_cart_goods', 1 );
			} else { // 商品详情里直接点购买的
				$id = I ( 'post.goods_id' );
				$soid = I ( 'spec_option_ids' );
				$goods = $dao->getInfo ( $id . ':' . $soid );
				$canDeposit = $goods ['can_deposit'];
				$goods ['num'] = I ( 'post.buyCount' );
				$goods ['spec_option_ids'] = $soid;
				$detialurl = U ( 'detail', array (
						'id' => $id,
						'seckill_id' => $_POST ['seckill_id'] 
				) );
				if ($soid && $goods ['sku_data'] [$soid] ['stock_num'] < $goods ['num']) {
					$this->error ( $goods ['title'] . '商品库存数量不足！', $detialurl );
					exit ();
				} else if (! $soid && $goods ['stock_num'] < $goods ['num']) {
					
					$this->error ( $goods ['title'] . '商品库存数量不足！', $detialurl );
					exit ();
				}
				// 锁定商品库存数量
				// D('Addons://Shop/Goods')->setLockNum($goods ['num'],$id,$soid);
				if ($_POST ['seckill_price']) {
				    $goods['show_price'] =  $_POST ['seckill_price'];
					$goods ['seckill_price'] = $_POST ['seckill_price'];
					$total_price = $goods ['num'] * $_POST ['seckill_price'];
					$data ['order_from_type'] = 11; // 订单来自秒杀
					$data ['seckill_id'] = $_POST ['seckill_id']; // 订单来自秒杀
						                                            // D ( 'Addons://Seckill/SeckillGoods' )->reduceCount($data['seckill_id'],$id,$goods['num']);
				} else {
					$canReduceScore = $goods ['reduce_score'];
					if ($goods ['spec_option_ids']) {
						$prices = $goods ['sku_data'] [$goods ['spec_option_ids']];
						if (floatval($prices ['sale_price'])>0 ) {
						    $data['is_cuxiao'] = 1;
						    $goods['show_price'] =  $prices ['sale_price'];
						    $total_price = $goods ['num'] * $prices ['sale_price'];
						} else {
						    $goods['show_price'] =  $prices ['market_price'];
							$total_price = $goods ['num'] * $prices ['market_price'];
						}
					} else {
						if (floatval($goods ['sale_price'])>0 ) {
						    $data['is_cuxiao'] = 1;
						    $goods['show_price'] =  $goods ['sale_price'];
							$total_price = $goods ['num'] * $goods ['sale_price'];
						} else {
						    $goods['show_price'] =  $goods ['market_price'];
							$total_price = $goods ['num'] * $goods ['market_price'];
						}
					}
				}
				if ($goods ['can_deposit'] == 1) {
					$goods ['deposit_price'] = $total_price * ($payInfo ['deposit'] / 100);
					$goods['deposit_price'] = round($goods['deposit_price'], 2) > 0 ? $goods['deposit_price'] : 0.01;
					
					$total_deposit += $goods ['deposit_price'];
				} else {
					$goods ['deposit_price'] = - 1;
					$total_deposit += $total_price;
				}
				$list [] = $goods;
			}
			
			$data ['lists'] = $list;
			$userScore = $GLOBALS ['myinfo'] ['score'];
			if ($userScore < $canReduceScore) {
				$canReduceScore = $userScore;
			}
			$data['can_reduce_score'] = $canReduceScore;
            $data['total_price'] = round($total_price, 2) > 0 ? $total_price : 0.01;
            $data['original_price']=  $data['total_price'] ;//原总价
            $data['total_deposit'] = round($total_deposit, 2) > 0 ? $total_deposit : 0.01;
            if ($data['total_deposit']>= $data['total_price']){
                $canDeposit =0;
            }
            $data['last_can_deposit']=$canDeposit;
			// 促销
			$reward = $this->reward ( getSubByKey ( $data ['lists'], 'id' ), $data ['total_price'] );
			$reward_mail=0;
			if ($reward) {
			    if ($reward ['money']) {
			
			        $data ['total_price'] = $data ['total_price'] - $reward ['money_param'];
			      
			    }
			    if ($reward['postage']){
			        $shopConfig ['is_mail']=1;
			        $data['save_mail_money']=0;
			    }
			}
			// 加邮费总价
			if ($shopConfig ['is_mail'] == 0) {
				empty ( $shopConfig ['mail_money'] ) && $shopConfig ['mail_money'] = 10;
				$data ['total_price_mail'] = $data ['total_price'] + $shopConfig ['mail_money'];
				$data['save_mail_money']= $shopConfig ['mail_money'];
			}
			session ( 'confirm_order', $data );
		} else {
			$data = session ( 'confirm_order' );
			$reward = $this->reward ( getSubByKey ( $data ['lists'], 'id' ), $data ['original_price'] );
			$reward_mail=0;
			if ($reward) {
			    if ($reward['postage']){
			        $shopConfig ['is_mail']=1;
			    }
			}
		}
		$this->assign ( 'can_deposit',  $data['last_can_deposit'] );
		// 获取所有商品对应的门店的交集
		$sameStore = null;
		foreach ( $data ['lists'] as $key => $gg ) {
			// dump($gg['goods_store']);
			if (empty ( $sameStore )) {
				$sameStore = $gg ['goods_store'];
			} else {
				$sameStore = array_intersect_assoc ( $sameStore, $gg ['goods_store'] );
				// dump($sameStore);
			}
		}
		$this->assign ( 'store_lists', $sameStore );
		// dump($data);
		// 收货地址
		$address_id = I ( 'get.address_id' );
		empty ( $address_id ) && $address_id = session ( 'order_address_id' );
		if (! empty ( $address_id )) {
			isset ( $_GET ['address_id'] ) && session ( 'order_address_id', $address_id );
			$address = D ( 'Address' )->getInfo ( $address_id );
		} else {
			$address = D ( 'Address' )->getMyAddress ( $this->mid );
		}
		$this->assign ( 'address', $address );
		
		// 可用的优惠券数
		$coupons = D ( 'Common/SnCode' )->getMyAll ( $this->mid, 'ShopCoupon' );
		// 获取
		// dump($coupons);
		$strCouponId='';
		$id = I ( 'goods_id' );
		$ShopCouponDao = D('Addons://ShopCoupon/ShopCoupon');
		foreach ( $coupons as &$v ) {
			$info = $ShopCouponDao->find ( $v ['target_id'] );
			$goods_ids = explode ( ',', $info ['limit_goods_ids'] );
			// dump($goods_ids);exit;
			$check = $data['is_cuxiao']==0 && $info['is_market_price']==1 || $info['is_market_price']==0 ; 
			if ($check){
			    $map1['token'] = get_token();
			    $map1['uid'] = $this->mid;
			    $cardMember = M('card_member')->where($map1)->find();
			    $levelInfo = D('Addons://Card/CardLevel')->getCardMemberLevel($this->mid);
			    $levelArr = explode(',', $info['member']);
			    $check= in_array(0, $levelArr) || in_array(- 1, $levelArr) && $cardMember || in_array($levelInfo['id'], $levelArr);
			}
			$isGoods=1;
			foreach ($data['lists'] as $gg){
			    if (!in_array ( $gg['id'], $goods_ids)){
			        $isGoods=0;
			    }
			}
			if ($isGoods && $check || empty($info ['limit_goods_ids']) && $check ) {
				unset ( $info ['id'] );
			} else {
				unset ( $info );
			}
			// dump($info);exit;
			unset ( $info ['id'] );
			$v = array_merge ( $info, $v );
		}
		$sn_id = I ( 'sn_id' );
		if ($sn_id > 0) {
			session ( 'order_sn_id', $sn_id );
		} else {
			$sn_id = session ( 'order_sn_id' );
		}
		$count = 0;
		$dCount=0;
		foreach ( $coupons as $cp ) {
			if ($data ['total_price'] >= $cp ['order_money']) {
				if ($cp ['can_use']) {
					$count += 1;
					$strCouponId .=$cp['target_id'].',';
				}
				if ($cp ['id'] == $sn_id) {
					$sn_info = $cp;
					$data ['total_price'] = $data ['total_price'] - $cp ['prize_title'];
					$data ['total_price_mail'] = $data ['total_price_mail'] - $cp['prize_title'];
				}
			}
			if ($data ['total_deposit'] >= $cp ['order_money']) {
			    if ($cp ['can_use']) {
			        $dCount += 1;
			    }
			   /*  if ($cp ['id'] == $sn_id) {
			        $data ['total_deposit'] = $data ['total_deposit'] - $cp ['prize_title'];
			    } */
			} 
		}
		if ((( float ) $data ['total_price']) < 0) {
			$data ['total_price'] = 0.01;
		}
		if ((( float ) $data ['total_price_mail']) < 0) {
		    $data ['total_price_mail'] = 0.01;
		}
		if (( float ) $data ['total_deposit'] < 0 ){
			$data ['total_deposit'] = 0.01;
		}
		$this->assign('str_coupon_id',$strCouponId);
		$this->assign('is_cuxiao',$data['is_cuxiao']);
		// dump($data['total_price']);
		$this->assign ( 'coupon_num', $count );
		$this->assign ( 'sn_info', $sn_info );
		$this->assign ( 'shop_config', $shopConfig );
		$this->assign('deposit_count',$dCount);
		// 可用的金币
		$this->assign ( 'score', $GLOBALS ['myinfo'] ['score'] );
		$this->assign ( $data );
		$this->display ();
	}
	// 生成订单
	function add_order() {
		$info = session ( 'confirm_order' );
		$payType = I ( 'pay_type' );
		if ($payType == 2) {
			// 定金
			$data ['is_deposit'] = 1;
			$data ['deposit_money'] = $info ['total_deposit'];
		} else {
			// 全额
			$data ['is_deposit'] = 0;
			$data ['deposit_money'] = 0;
		}
		$sendType = I ( 'send_type' );
		if ($sendType == 1) {
			// 邮寄
			$data ['is_mail'] = 1;
			$mail = I ( 'mail' );
			$data ['mail_money'] = $mail = $info['save_mail_money'];
// 			$data ['mail_money'] = $mail == - 1 ? 0 : $mail;
		}else if($sendType == -1){
		    //非实物商品
		    
		}else {
			// 门店
			$data ['is_mail'] = 0;
			$storeId = I ( 'store' );
			$data ['coupon_shop_id'] = $storeId == - 1 ? 0 : $storeId;
		}
		$goodsDao = D ( 'Addons://Shop/Goods' );
		// 获取选中门店的库存
		if ($data ['coupon_shop_id']) {
			$storeMap ['store_id'] = $data ['coupon_shop_id'];
			$storeMap ['token'] = get_token ();
			$storeData = M ( 'goods_store_link' )->where ( $storeMap )->select ();
			foreach ( $storeData as $ss ) {
				$storeGoodsMum [$ss ['goods_id']] += $ss ['store_num'];
			}
			foreach ( $info ['lists'] as $gg ) {
				if ($storeGoodsMum [$gg ['id']] < $gg ['num']) {
					echo - 2;
					exit ();
				}
			}
		}
		if ($data ['is_deposit'] == 0 && $data ['is_mail'] == 1 || $sendType== -1) {
			$data ['pay_type'] = 0; // 微信支付
		} else if ($data ['is_mail'] == 0) {
			$data ['pay_type'] = 11; // 到店支付
		}
		$data ['address_id'] = I ( 'address_id' );
		$data ['remark'] = I ( 'remark' );
		$data ['uid'] = $this->mid;
		if ($data['uid'] <= 0){
		    echo 0;
		    exit();
		}
		$data ['order_number'] = date ( 'YmdHis' ) . substr ( uniqid (), 4 );
		$data ['cTime'] = NOW_TIME;
		$data ['openid'] = get_openid ();
		$data ['pay_status'] = 0;
		
		$data ['manager_id'] = $this->manager_id;
		$data ['token'] = get_token ();
		$total_price = $info ['total_price'];
		$is_cart = $info['is_card_goods'];
		if ($is_cart == 1) {
		    foreach ( $info ['lists'] as $gg ) {
		        $goodsInfo = $goodsDao->getInfo ( $gg ['id'] );
		        if ($gg ['spec_option_ids'] && $goodsInfo ['sku_data'] [$gg ['spec_option_ids']] ['stock_num'] < $gg ['num']) {
		            echo - 1;
		            exit ();
		        } else if (! $gg ['spec_option_ids'] && $goodsInfo ['stock_num'] < $gg ['num']) {
		            echo - 1;
		            exit ();
		        }
		    }
		}
		
		// 使用金币
		if (I ( 'use_score' ) && $info ['can_reduce_score'] > 0) {
			$info ['total_price'] = $info ['total_price'] - $info ['can_reduce_score'];
			// 清空用户金币
			$credit ['score'] = 0 - $info ['can_reduce_score'];
		        $credit ['title'] = '购买商品抵扣金额';
			$cres = add_credit ( 'shop_buy', 0, $credit );
			$extArr['score_info'] = array(
			    'score' =>  $credit ['score'],
			    'is_add' => $cres
			);
		}
		
		// 使用优惠券
		$sn_id = I ( 'sn_id' );
		if ($sn_id > 0) {
			$dao = D ( 'Common/SnCode' );
			$coupons = $dao->getMyAll ( $this->mid, 'ShopCoupon' );
			
			foreach ( $coupons as $cp ) {
				if ($cp ['can_use'] && $cp ['id'] == $sn_id) {
					// 设置优惠券为已使用
					$res = $dao->set_use ( $sn_id );
					
					if ($res) {
						$map ['is_use'] = 1;
						$map ['target_id'] = $cp ['target_id'];
						$map ['addon'] = 'ShopCoupon';
						$save ['use_count'] = intval ( $dao->where ( $map )->count () );
						D ( 'Addons://ShopCoupon/ShopCoupon' )->update ( $data ['target_id'], $save );
						
						$info ['total_price'] = $info ['total_price'] - $cp ['prize_title'];
						
						session ( 'order_sn_id', null );
					}
					break;
				}
			}
			//保存代金券信息
			$extArr['sn_info'] = array(
			    'sn_id' => $sn_id,
			    'is_use' => $res
			);
		}

		// 使用促销
		$reward = $this->reward ( getSubByKey ( $info ['lists'], 'id' ), $info['original_price'] );
		if ($reward) {
			/* if ($reward ['money']) {
				$info ['total_price'] = $info ['total_price'] - $reward ['money_param'];
			} */
			if ($reward ['postage']) { // 免邮TODO
			    $data['mail_money']=0;
			}
			// 促销活动赠送积分和券
			if ($reward ['score']) { // 送积分
				$credit ['score'] = intval ( $reward ['score_param'] );
				$credit ['title'] = '消费促销活动';
				$sres = add_credit ( 'shop_reward', 0, $credit );
			}
			if ($reward ['shop_coupon']) { // 送优惠券
				$sendsnid = D ( 'Addons://ShopCoupon/ShopCoupon' )->sendCoupon ( $reward ['shop_coupon_param'], $this->mid );
			}
			//保存代金券信息
			$extArr['reward_info'] = array(
			    'sn_id' => $sendsnid,
			    'money'=> $reward ['money_param'],
			    'score'=> $reward ['score_param'] ,
			    'is_add' => $sres
			);
		}
		
		$data ['total_price'] = $info ['total_price'] <= 0.01 ? 0.01 : $info ['total_price'];
		$data ['goods_datas'] = json_encode ( $info ['lists'] );
		if ($info ['order_from_type']) {
			$data ['order_from_type'] = $info ['order_from_type'];
		}
		if (isset($extArr)){
		    $data['extra'] = json_encode($extArr);
		}
		$data ['shop_id'] = $this->shop_id;
		$res = true;
		foreach ($info['lists'] as $goods) {
            if ($info['order_from_type'] == 11) {
                $res = D('Addons://Seckill/SeckillGoods')->reduceCount($info['seckill_id'], $goods['id'], $goods['num']);
            }
        }
		if (!$res){
		    echo -1;
			exit();
		}
		$data['order_state']=1;
		$id = D ( 'Addons://Shop/Order' )->add ( $data );
		if ($id) {
		    foreach ($info['lists'] as $goods){
		        $goodsDao->setLockNum($goods ['num'],$goods['id'],$goods["spec_option_ids"]);
		    }

			// 删除购物车消息
			if ($is_cart==1) {
				$goods_ids = getSubByKey ( $info ['lists'], 'id' );
				D ( 'Cart' )->delUserCart ( $this->mid, $goods_ids ,$info['cart_ids'] );
			}
			// 记录秒杀订单
			if ($info ['order_from_type'] == 11) {
				$seckillData ['order_id'] = $id;
				$seckillData ['seckill_id'] = $info ['seckill_id'];
				M ( 'seckill_order' )->add ( $seckillData );
			}
			echo $id;
		} else {
			echo 0;
		}
	}
	// 选择支付方式(暂不用，直接跑到do_pay)
    function choose_pay()
    {
        $openid = get_openid();
        $order_id = $_GET['order_id'];
        $orderInfo = D('Addons://Shop/Order')->getInfo($order_id);
        $res = true;
        if ($orderInfo['is_lock'] == 0) {
            $save['is_lock'] = 1;
            $goodsarr = json_decode($orderInfo['goods_datas'], true);
            $goodsDao = D('Addons://Shop/Goods');
            foreach ($goodsarr as $goods) {
                if ($orderInfo['order_from_type'] == '秒杀') {
                    $seckillMap['order_id'] = $orderInfo['id'];
                    $sgoodsMap['seckill_id'] = M('seckill_order')->where($seckillMap)->getField('seckill_id');
                    $res = D('Addons://Seckill/SeckillGoods')->reduceCount($sgoodsMap['seckill_id'], $goods['id'], $goods['num']);
                }
                $goodsDao->setLockNum($goods['num'], $goods['id'], $goods["spec_option_ids"]);
            }
            if ($res) {
                D('Addons://Shop/Order')->update($order_id, $save);
            } else {
                $this->error('库存不足，请重新选择购买商品！');
            }
        }
        $this->assign('order_info', $orderInfo);
        $this->assign('order_id', $order_id);
        
        $config = getAddonConfig('Payment');
        $this->assign('config', $config);
        
        $this->display();
    }
	function do_pay() {
		$order_id = I('order_id', 0, 'intval');
        $now_pay = I('is_pay_now', 0, 'intval');
		if (empty ( $order_id )) {
			$this->error ( '订单参数出错' );
		}
		$orderInfo = D ( 'Addons://Shop/Order' )->getInfo ( $order_id );
		if ($orderInfo ['is_lock'] == 0) {
			// 订单商品的库存已释放了
			$goodsarr = json_decode ( $orderInfo ['goods_datas'], true );
			$goodsDao = D ( 'Addons://Shop/Goods' );
			$isShelf = 1;
			$hasNum = 1;
			foreach ( $goodsarr as $gg ) {
				$newGoods = $goodsDao->getInfo ( $gg ['id'] );
				if ($newGoods ['is_show'] == 0) {
					// 商品下架
					$isShelf = 0;
					break;
				}
				// 库存是否为空
				$skudd = $newGoods ['sku_data_defalut'];
				if (! empty ( $skudd ) && $newGoods ['sku_data'] [$skudd] ['stock_num'] <= 0) {
					$hasNum = 0;
					break;
				}
				if (empty ( $skudd ) && $newGoods ['stock_num'] <= 0) {
					$hasNum = 0;
					break;
				}
			}
			if (!$isShelf){
				$this->error('该订单存在已下架的商品，请重新下订单！');
				exit();
			}
			if (!$hasNum){
				$this->error('该订单存在已售完的商品，请重新挑选商品订单！');
				exit();
			}
			$save ['is_lock'] = 1;
			foreach ( $goodsarr as $goods ) {
				$goodsDao->setLockNum ( $goods ['num'], $goods ['id'], $goods ["spec_option_ids"] );
				if ($orderInfo ['order_from_type'] == '秒杀') {
					$sgoods ['goods_id'] = $goods ['id'];
					$seckillMap ['order_id'] = $orderInfo ['id'];
					$sgoods ['seckill_id'] = $sgoodsMap ['seckill_id'] = M ( 'seckill_order' )->where ( $seckillMap )->getField ( 'seckill_id' );
					$sgoodsCount = M ( 'seckill_goods' )->where ( $sgoods )->getField ( 'seckill_count' );
					if ($sgoodsCount <= 0) {
						$this->error ( '该商品已被秒杀完！' );
						exit ();
					}
					D ( 'Addons://Seckill/SeckillGoods' )->reduceCount ( $sgoodsMap ['seckill_id'], $goods ['id'], $goods ['num'] );
				}
			}
			// D('Addons://Shop/Order')->update($order_id,$save);
		}
		// $paytype = intval ( I ( 'paytype' ) );
		$paytype = intval ( $orderInfo ['pay_type'] );
		if (! ($paytype == 0 || $paytype == 1 || $paytype == 2 || $paytype == 4 || $paytype == 10 || $paytype == 11)) {
			$this->error ( '选择的支付方式不支持' );
		}
		
		// $save ['pay_type'] = $paytype;
		$save ['status_code'] = $paytype == 10 ? 1 : 0;
		$map ['id'] = $order_id;
		// D ( 'Order' )->where ( $map )->save ( $data );
		$orderInfo = D ( 'Addons://Shop/Order' )->update ( $order_id, $save );
		// $orderinfo = D ( 'Order' )->where ( $map )->find ();
		$jgoodsdata = $orderInfo ['goods_datas'];
		$goodsdata = json_decode ( $jgoodsdata, true );
		$from = "Payment:__Weixin_payOK";
		if ($paytype == 10 || $paytype == 11) { // 货到付款
			/*
			 * $this->success ( '下单成功', U ( 'myOrder', array (
			 * 'shop_id' => $this->shop_id
			 * ) ) );
			 */
			$pay_deposit = 1;
			if ($orderInfo ['is_deposit'] == 1) {
				$orderInfo ['reserve_price'] = $orderInfo ['deposit_money']; // 定金
				$orderInfo ['rest_price'] = $orderInfo ['total_price'] - $orderInfo ['reserve_price']; // 剩余金额
				if ($orderInfo ['pay_status'] == 0) {
					// 未支付订金
					// 支付金额
					$price = $orderInfo ['reserve_price'];
					if ($price < 0.01) {
						$orderInfo ['reserve_price'] = $price = 0.01;
						$orderInfo ['rest_price'] = $orderInfo ['total_price'] - $orderInfo ['reserve_price'];
					}
					$pay_deposit = 1;
				} else if ($orderInfo ['pay_status'] == 2) {
					$price = $orderInfo ['rest_price'];
					$pay_deposit = 0;
					if ($price < 0.01) {
						$orderInfo ['rest_price'] = $price = 0.01;
					}
					// 订单号加个 y
					$orderInfo ['order_number'] .= 'yue';
				}
				$this->assign ( 'pay_deposit', $pay_deposit );
			} else {
				$orderInfo ['reserve_price'] = 0;
				$price = $orderInfo ['rest_price'] = $orderInfo ['total_price'] < 0.01 ? 0.01 : $orderInfo ['total_price'];
				$this->assign ( 'is_all', 1 );
			}
			
			$token = get_token ();
			// 微信用户ID
			$openid = $orderInfo ['openid'];
			// 订单名称 商品订单表里面没有订单名称字段
			// $orderName =mb_convert_encoding($goodsdata[0]['title'],"ISO-8859-1", "UTF-8");
			$orderName = $goodsdata [0] ['title'] ;
			// dump($orderName);
			// dump($goodsdata);die;
			// 订单编号
			$orderNumber = $orderInfo ['order_number'];
			
			// 支付类型
			/*
			 * 成功后返回调用的方法 addons_url的格式
			 * 返回GET参数:token,wecha_id,orderid
			 * 以下用playok的方法来说明，其实这个地址也是由开发者随意定的
			 */
			
			// $bid = "";
			// $sid = "";
			// 微信支付
			$url0 = addons_url ( 'Payment://Alipay/pay', array (
					'from' => $from,
					'orderName' => $orderName,
					'price' => $price,
					'token' => $token,
					'wecha_id' => $openid,
					'paytype' => 0,
					'orderNumber' => $orderNumber,
					'aim_id' => $order_id 
			) );
			// 支付宝支付
			$url1 = addons_url ( 'Payment://Alipay/pay', array (
					'from' => $from,
					'orderName' => $orderName,
					'price' => $price,
					'token' => $token,
					'wecha_id' => $openid,
					'paytype' => 1,
					'orderNumber' => $orderNumber 
			) );
			if ($now_pay == 1){
			    $this->success ( '您好,准备跳转到支付页面,请不要重复刷新页面,请耐心等待...', $url0 );
			}else{
			    $this->assign ( 'orderinfo', $orderInfo );
			    $this->assign ( 'paytype', $paytype );
			    $this->assign ( 'data', $goodsdata );
			    $this->assign ( 'url0', $url0 );
			    $this->assign ( 'url1', $url1 );
			    $this->display ( 'order_success' );
			}
			exit ();
		}
		
		$token = get_token ();
		// 微信用户ID
		$openid = $orderInfo ['openid'];
		// 订单名称 商品订单表里面没有订单名称字段
		// $orderName =mb_convert_encoding($goodsdata[0]['title'],"ISO-8859-1", "UTF-8");
// 		$orderName = urlencode ( $goodsdata [0] ['title'] );
		$orderName = $goodsdata [0] ['title'] ;
		// dump($orderName);
		// dump($goodsdata);die;
		// 订单编号
		// 加邮费总价
		if ($orderInfo ['is_mail'] == 1 && $orderInfo ['mail_money']) {
			$price = $orderInfo ['total_price'] + $orderInfo ['mail_money'];
		} else {
			// 支付金额
			$price = $orderInfo ['total_price'];
		}
		
		$orderNumber = $orderInfo ['order_number'];
		// 支付类型
		$zftype = $paytype;
		/*
		 * 成功后返回调用的方法 addons_url的格式
		 * 返回GET参数:token,wecha_id,orderid
		 * 以下用playok的方法来说明，其实这个地址也是由开发者随意定的
		 */
		// $bid = "";
		// $sid = "";
		$url = addons_url ( 'Payment://Alipay/pay', array (
				'from' => $from,
				'orderName' => $orderName,
				'price' => $price,
				'token' => $token,
				'wecha_id' => $openid,
				'paytype' => $zftype,
				'orderNumber' => $orderNumber,
				'aim_id' => $order_id 
		) );
		// 'bid' => $bid,
		// 'sid' => $sid
		$this->success ( '您好,准备跳转到支付页面,请不要重复刷新页面,请耐心等待...', $url );
	}
	
	/* 店铺人员确认支付 */
	function manager_confirm_pay() {
		$roleMap ['uid'] = $this->mid;
		$roleMap ['enable'] = 1;
		$roleInfo = M ( 'Servicer' )->where ( $roleMap )->find ();
		if ($roleInfo) {
			$orderId = $map ['id'] = I ( 'id', 0, intval );
			$dopay = I ( 'dopay', 0, intval );
			$getStatus = I ( 'getStatus', 0, intval );
			if ($dopay) {
				$data ['pay_status'] = 1;
				$data ['status_code'] = 5;
				D ( 'Order' )->update ( $orderId, $data );
				// 做分佣处理
				$is_distribution = M ( 'shop_distribution_profit' )->where ( array (
						'order_id' => $orderId 
				) )->getFields ( 'id' );
				if (empty ( $is_distribution )) {
					// 确认已收款，处理分销用户获取的拥金
					D ( 'Addons://Shop/Distribution' )->do_distribution_profit ( $orderId );
				}
				
				// 到店支付返积分
				$payInfo = M ( 'payment_set' )->where ( array (
						'token' => get_token 
				) )->find ();
				add_credit ( 'shoppay', 0, array (
						'shop_pay_score' => $payInfo ['shop_pay_score'],
						'title'=>'到店支付返积分'
				) );
			}
			$orderinfo = D ( 'Addons://Shop/Order' )->getInfo ( $orderId );
			if ($getStatus) {
				$this->ajaxReturn ( $orderinfo, 'JSON' );
				exit ();
			}
			$this->assign ( 'orderinfo', $orderinfo );
			$this->assign ( 'roleInfo', $roleInfo );
		} else {
			$this->assign ( 'roleInfo', $roleInfo );
		}
		$this->display ();
	}
	function ajax_check_pwd() {
		$orderId = I ( 'id', 0, 'intval' );
		if (empty ( $orderId )) {
			echo 0;
			exit ();
		}
		$pwd = I ( 'pwd' ,'','safe');
		$orderInfo = D ( 'Addons://Shop/Order' )->getInfo ( $orderId, true );
		if (empty ( $orderInfo )) {
			echo 0;
			exit ();
		}
		// 已支付定金
		// 到店支付、、、货到付款暂时不考虑
		if ($orderInfo ['pay_type'] == 11 && $orderInfo ['is_mail'] == 0) {
			if ($orderInfo ['coupon_shop_id']) {
				$storeData = M ( 'coupon_shop' )->find ( $orderInfo ['coupon_shop_id'] );
				if ($storeData ['password'] != $pwd) {
					echo - 1;
					exit ();
				}
			}
			if ($orderInfo ['is_deposit'] == 1 && $orderInfo ['pay_status'] == 0) {
				// 未支付订金
				$save ['pay_status'] = 2;
			} else {
				// 全额支付
				$save ['pay_status'] = 1;
			}
			if ($orderInfo ['pay_status'] != 1 && empty ( $orderInfo ['pay_time'] )) {
				$save ['pay_time'] = time ();
				$save ['is_send'] = 2;
			}
            if ($orderInfo['pay_status'] != 1 && $save['pay_status'] == 1 && $orderInfo['total_send_score'] > 0 && $orderInfo['status_code'] != 5) {
              

                // 到店支付返积分
                $payInfo = M ( 'payment_set' )->where ( array (
                    'token' => get_token ()
                ) )->find ();
                add_credit ( 'shoppay', 0, array (
                'title'=>'到店支付返积分',
                'score' => $payInfo ['shop_pay_score']
                ) );
            }
			$orderInfo = D ( 'Addons://Shop/Order' )->update ( $orderId, $save );
			// 订金全额支付 确认已收款
			D ( 'Addons://Shop/Order' )->setStatusCode ( $orderId, 5 );
			// 做分佣处理
			$is_distribution = M ( 'shop_distribution_profit' )->where ( array (
					'order_id' => $orderId 
			) )->getFields ( 'id' );
			if (empty ( $is_distribution )) {
				// 确认已收款，处理分销用户获取的拥金
				D ( 'Addons://Shop/Distribution' )->do_distribution_profit ( $orderId );
			}
			// 设置销售量
			if ($save['pay_status']==1){
			    D('Addons://Shop/Order')->setGoodsSaleCount($orderId);
			}
			echo $orderId;
		} else {
			echo - 2;
			exit ();
		}
	}
	/*
	 * public function playok() {
	 * // 支付成功后能得到的参数有：
	 * $token = I ( 'token' );
	 * $openid = I ( 'wecha_id' );
	 * $orderid = I ( 'orderid' );
	 *
	 * // TODO 在这里开发者可以加支付成功的处理程序
	 * echo '支付成功！';
	 * // $this->success ( '支付成功！', U ( 'lists' ) );
	 * }
	 */
	// 选择地址
	function choose_address() {
		$list = D ( 'Address' )->getUserList ( $this->mid );
		// dump ( $list );
		$this->assign ( 'lists', $list );
		
		$this->display ();
	}
	// 添加或编辑地址
	function add_address() {
		if (IS_POST) {
			$data = I ( 'post.' );
			$data ['uid'] = $this->mid;
			$res = D ( 'Address' )->deal ( $data );
			if ($data ['from'] == 0) {
				redirect ( U ( 'myAddress', array (
						'shop_id' => $this->shop_id 
				) ) );
			} else {
				redirect ( U ( 'choose_address', array (
						'shop_id' => $this->shop_id 
				) ) );
			}
		}
		
		$id = I ( 'id' );
		if ($id) {
			$info = D ( 'Address' )->getInfo ( $id );
			$this->assign ( 'info', $info );
		}
		
		$this->display ();
	}
	// 商店介绍
	function shop_intro() {
		$this->display ( CUSTOM_TEMPLATE_PATH . 'shop_intro.html' );
	}
	// 联系方式
	function contact() {
		$this->display ( CUSTOM_TEMPLATE_PATH . 'contact.html' );
	}
	private function _getShopCategory() {
		$list_data = D ( 'Category' )->getShopCategory ( $this->shop_id );
		foreach ( $list_data as $vo ) {
			if ($vo ['pid'] == 0) {
				$top_list [$vo ['id']] = $vo;
			} else {
				$sub_list [$vo ['pid']] [$vo ['id']] = $vo;
			}
		}
		$this->assign ( 'top_list', $top_list );
		$this->assign ( 'sub_list', $sub_list );
		// dump($top_list);
		// dump($sub_list);die;
		return $list_data;
	}
	// 确认收货
	function confirm_get() {
		$id = I ( 'get.id' );
		$save ['is_send'] = 2;
		$res = D ( 'Addons://Shop/Order' )->update ( $id, $save );
		
		$res = D ( 'Addons://Shop/Order' )->setStatusCode ( $id, 4 );
		$is_distribution = M ( 'shop_distribution_profit' )->where ( array (
				'order_id' => $id 
		) )->getFields ( 'id' );
		if (empty ( $is_distribution )) {
			// 确认已收款，处理分销用户获取的拥金
			D ( 'Addons://Shop/Distribution' )->do_distribution_profit ( $id );
		}
		if ($res) {
			echo $id;
			// $jurl = U('detail_comment',array('id'=>$id));
			// $this->success ( '设置成功',$jurl);
		} else {
			echo 0;
			// $this->success ( '设置失败' );
		}
	}
	// 初始化分销店铺
	function initChidShop($shop_id) {
		$shopDao = D ( 'Addons://Shop/Shop' );
		$map ['manager_id'] = $map1 ['uid'] = $this->mid;
		// 判断是否为公众号管理员
		
		$is_public = M ( 'auth_group_access' )->where ( $map1 )->getfield ( 'group_id' );
		$map ['token'] = $token = get_token ();
		$hasShop = $shopDao->where ( $map )->getField ( 'id' );
		if ($hasShop || $token == '-1' || $map ['manager_id'] <= 0) {
			return 0;
		}
		$oldShop = $shopDao->find ( $shop_id );
		if ($oldShop && $is_public != 3) {
			unset ( $oldShop ['id'] );
			$oldShop ['token'] = $token;
			$oldShop ['manager_id'] = $this->mid;
			$newShopId = $shopDao->add ( $oldShop );
			
			$parentShop = $oldShop ['parent_shop'];
			$pArr = wp_explode ( $parentShop );
			$pStr = '';
			$count = count ( $pArr );
			if ($count == 0) {
				$pStr .= $newShopId;
			} else if ($count == 1) {
				$pStr .= $pArr [0] . ',' . $newShopId;
			} else if ($count == 2) {
				$pStr .= $pArr [0] . ',' . $pArr [1] . ',' . $newShopId;
			} else if ($count == 3) {
				$pStr .= $pArr [1] . ',' . $pArr [2] . ',' . $newShopId;
			}
			
			$save ['parent_shop'] = $pStr;
			$shopDao->where ( array (
					'id' => $newShopId 
			) )->save ( $save );
			// 满足条件 添加分销用户
			$dudata ['uid'] = $this->mid;
			$dudata ['token'] = get_token ();
			$res = M ( 'shop_distribution_user' )->where ( array (
					'uid' => $dudata ['uid'] 
			) )->getFields ( 'id' );
			if (! $res) {
				$dudata ['enable'] = 1;
				$dudata ['cTime'] = time ();
				M ( 'shop_distribution_user' )->add ( $dudata );
			}
		} else {
			return 0;
		}
		
		return $newShopId;
	}
	function diy_page() {
		$id = I ( 'id' );
		$data = D ( 'DiyPage' )->getInfo ( $id,true );
		$token = get_token ();
		$key = 'diypage_is_index_' . $token;
		if ($data ['is_index']) {
			S ( $key, $id );
		} else {
			S ( $key, null );
		}
		$this->assign ( 'data', $data );
		$this->display ();
	}
	// 分类页面
	function category() {
		$shop_id = I ( 'shop_id', 0, intval );
		$this->_getShopCategory ();
		$this->display ();
	}
	function detail_comment() {
		if (IS_POST) {
			$sensitiveStr = C ( 'SENSITIVE_WORDS' );
			$sensitiveArr = explode ( ',', $sensitiveStr );
			$badkeywords = array_combine ( $sensitiveArr, array_fill ( 0, count ( $sensitiveArr ), '***' ) );
			foreach ( $badkeywords as $k => $v ) {
				if (empty ( $k )) {
					unset ( $badkeywords [$k] );
				}
			}
			$commentDao = D ( 'Addons://Shop/GoodsComment' );
			$goodsDao = D ( 'Addons://Shop/Goods' );
			foreach ( $_POST ['goodsids'] as $goodsId ) {
				$goodsInfo = $goodsDao->getInfo ( $goodsId );
				if (! $_POST ['content'] [$goodsId] && intval ( $_POST ['score'] [$goodsId] ) < 1) {
					echo '"' . $goodsInfo ['title'] . '" 商品评论语不能为空！';
					exit ();
				}
				if ($_POST ['content'] [$goodsId] == strtr ( $_POST ['content'] [$goodsId], $badkeywords )) {
					$comData = array ();
					$comData ['shop_id'] = $_POST ['shop_id'];
					$comData ['token'] = get_token ();
					$comData ['cTime'] = time ();
					$comData ['uid'] = $this->mid;
					$comData ['order_id'] = $_POST ['order_id'];
					$comData ['content'] = $_POST ['content'] [$goodsId];
					$comData ['score'] = intval ( $_POST ['score'] [$goodsId] );
					$comData ['goods_id'] = $goodsId;
					$comments [] = $comData;
				} else {
					echo '"' . $goodsInfo ['title'] . '" 商品评论语出现敏感词！';
					exit ();
				}
			}
			if ($comments) {
				$res = $commentDao->addAll ( $comments );
			}
			if ($res) {
				D ( 'Addons://Shop/Order' )->setStatusCode ( $_POST ['order_id'], 7 );
				foreach ( $_POST ['goods_ids'] as $gid ) {
					$commentDao->getShopComment ( $gid, true );
				}
				// $this->success('评论成功！',U('myOrder'));
				echo '';
			} else {
				echo '评论失败！';
			}
		} else {
			$orderId = $map ['order_id'] = I ( 'id', 0, intval );
			if (empty ( $orderId )) {
				$this->error ( '订单不存在!' );
			}
			$orderDao = D ( 'Addons://Shop/Order' );
			$orderInfo = $orderDao->getInfo ( $orderId );
			// dump($orderInfo);
			$goodsInfo = json_decode ( $orderInfo ['goods_datas'], true );
			$this->assign ( 'goodsInfo', $goodsInfo );
			$this->assign ( 'orderInfo', $orderInfo );
			$this->display ();
		}
	}
	
	/**
	 * +----------------------------------------------------------
	 * 将一个字符串部分字符用*替代隐藏
	 * +----------------------------------------------------------
	 *
	 * @param string $string
	 *        	待转换的字符串
	 * @param int $bengin
	 *        	起始位置，从0开始计数，当$type=4时，表示左侧保留长度
	 * @param int $len
	 *        	需要转换成*的字符个数，当$type=4时，表示右侧保留长度
	 * @param int $type
	 *        	转换类型：0，从左向右隐藏；1，从右向左隐藏；2，从指定字符位置分割前由右向左隐藏；3，从指定字符位置分割后由左向右隐藏；4，保留首末指定字符串
	 * @param string $glue
	 *        	分割符
	 *        	+----------------------------------------------------------
	 * @return string 处理后的字符串
	 *         +----------------------------------------------------------
	 */
	function hideStr($string, $bengin = 0, $len = 4, $type = 2, $glue = "@") {
		if (empty ( $string ))
			return false;
		$array = array ();
		if ($type == 0 || $type == 1 || $type == 4) {
			$strlen = $length = mb_strlen ( $string );
			while ( $strlen ) {
				$array [] = mb_substr ( $string, 0, 1, "utf8" );
				$string = mb_substr ( $string, 1, $strlen, "utf8" );
				$strlen = mb_strlen ( $string );
			}
		}
		if ($type == 0) {
			for($i = $bengin; $i < ($bengin + $len); $i ++) {
				if (isset ( $array [$i] ))
					$array [$i] = "*";
			}
			$string = implode ( "", $array );
		} else if ($type == 1) {
			$array = array_reverse ( $array );
			for($i = $bengin; $i < ($bengin + $len); $i ++) {
				if (isset ( $array [$i] ))
					$array [$i] = "*";
			}
			$string = implode ( "", array_reverse ( $array ) );
		} else if ($type == 2) {
			$array = explode ( $glue, $string );
			$array [0] = $this->hideStr ( $array [0], $bengin, $len, 1 );
			$string = implode ( $glue, $array );
		} else if ($type == 3) {
			$array = explode ( $glue, $string );
			$array [1] = $this->hideStr ( $array [1], $bengin, $len, 0 );
			$string = implode ( $glue, $array );
		} else if ($type == 4) {
			$left = $bengin;
			$right = $len;
			$tem = array ();
			for($i = 0; $i < ($length - $right); $i ++) {
				if (isset ( $array [$i] ))
					$tem [] = $i >= $left ? "*" : $array [$i];
			}
			$array = array_chunk ( array_reverse ( $array ), $right );
			$array = array_reverse ( $array [0] );
			for($i = 0; $i < $right; $i ++) {
				$tem [] = $array [$i];
			}
			$string = implode ( "", $tem );
		}
		return $string;
	}
	// ///////新增功能用到的函数////////////
	// 获取一级和二级分类列表
	function get_grade_category() {
		$list_data = D ( 'Category' )->getShopCategory ( $this->shop_id );
		foreach ( $list_data as $vo ) {
			if ($vo ['pid'] == 0) {
				$top_list [$vo ['id']] = $vo;
			} else {
				$sub_list [$vo ['pid']] [$vo ['id']] = $vo;
			}
		}
		$lists ['top_lists'] = $top_list;
		$lists ['sub_lists'] = json_encode ( $sub_list );
		return $lists;
	}
	// 搜索获取商品总数
	function ajax_goods_count() {
		$is_new = I ( 'is_new' );
		$cateId = I ( 'category_ids' );
		$dataGoods = $this->_get_search_goodsid ( $is_new, $cateId );
		echo count ( $dataGoods );
	}
	function search_goods_lists() {
		$is_new = I ( 'is_new' );
		$cateId = I ( 'category_ids' );
		$newArr = wp_explode ( $is_new, ',' );
		$cateArr = wp_explode ( $cateId, "," );
		$this->assign ( 'new_arr', $newArr );
		// $this->assign('cate_arr',$cateArr);
		
		$goodsIds = $this->_get_search_goodsid ( $is_new, $cateId );
		$goodsDao = D ( 'Addons://Shop/Goods' );
		foreach ( $goodsIds as $id ) {
			$goodsInfo = $goodsDao->getInfo ( $id );
			if ($goodsInfo ['stock_total_num'] && $goodsInfo['is_delete'] == 0 && $goodsInfo['is_show']==1) {
				$goods_list [] = $goodsInfo;
			}
		}
		// $goods_list = D ( 'Goods' )->getList ( $this->shop_id, '', 'id desc',0,10,$cateId ,$this->manager_id);
		$this->assign ( 'goods_list', $goods_list );
		$categoryData = $this->get_grade_category ();
		$sublists = json_decode ( $categoryData ['sub_lists'], true );
		foreach ( $sublists as $sub ) {
			foreach ( $sub as $ss ) {
				$subdata [$ss ['id']] = $ss;
			}
		}
		foreach ( $cateArr as $cc ) {
			if ($subdata [$cc]) {
				$reStr [$subdata [$cc] ['pid']] .= $cc . ',';
				$reTitleStr [$subdata [$cc] ['pid']] .= $subdata [$cc] ['title'] . ',';
			}
		}
		foreach ( $reTitleStr as &$t ) {
			$t = substr ( $t, 0, strlen ( $t ) - 1 );
		}
		$this->assign ( 'cate_title_arr', $reTitleStr );
		$this->assign ( 'cate_arr', $reStr );
		$this->assign ( $categoryData );
		$this->display ( CUSTOM_TEMPLATE_PATH . 'lists.html' );
	}
	function _get_search_goodsid($is_new, $cateId) {
		$map ['is_show'] = 1;
		$map ['is_delete'] = 0;
		$map ['token'] = get_token ();
		// $map['shop_id']=$this->shop_id;
		$cateArr = wp_explode ( $cateId, ',' );
		$cateArr = array_unique ( $cateArr );
		$newArr = wp_explode ( $is_new, ',' );
		$goodsDao= D ( 'Addons://Shop/Goods' );
		if (count ( $cateArr ) == 0 && count ( $newArr ) == 0) {
			$totalCount = $goodsDao ->where ( $map )->getFields ( 'id' );
			foreach ( $totalCount as $gid ) {
			    $goodsInfo = $goodsDao->getInfo ( $gid );
			    if ( $goodsInfo['stock_total_num']>0) {
			        $dataGoods [$gid] = $gid;
			    }
			}
		} else {
			
			if ($newArr) {
				$allGoods = $goodsDao->field('id,is_new')->where ( $map )->select ();
				foreach ( $newArr as $new ) {
					foreach ( $allGoods as $gg ) {
						$isNewArr = wp_explode ( $gg ['is_new'], ',' );
						if (in_array ( $new, $isNewArr )) {
						    $goodsInfo = $goodsDao->getInfo ( $gg ['id'] );
						    if ( $goodsInfo['stock_total_num']>0) {
						       $dataGoods [$gg ['id']] = $gg ['id'];
						    }
						}
					}
				}
			}
			if ($cateArr) {
				$cmap ['category_second'] = array (
						'in',
						$cateArr 
				);
				$cmap ['token'] = get_token ();
				$cgdata = M ( 'goods_category_link' )->where ( $cmap )->getFields ( 'goods_id' );
				foreach ( $cgdata as $cg ) {
				    $goodsInfo = $goodsDao->getInfo ( $cg );
				    if ( $goodsInfo['stock_total_num']>0) {
				      	$dataGoods [$cg] = $cg;
				    }
				
				}
			}
		}
		return $dataGoods;
	}
	function distribution() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		// $this->mid = 11930;//去掉
		$duser = $dDao->getDistributionUser ( $this->mid );
		$token = get_token();
		$key = 'diypage_is_index_' . $token;
		$is_diy = S ( $key );
		if ($is_diy) {
		    $indexUrl = U('diy_page', array(
		        'shop_id' => $this->shop_id,
		        'id' => $is_diy,
		        'uid' => $this->manager_id,
		        'publicid' => $this->appInfo['id']
		    ));
		} else {
		    $indexUrl = U('index', array(
		        'shop_id' => $this->shop_id,
		        'uid' => $this->manager_id,
		        'publicid' => $this->appInfo['id']
		    ));
		}
		if (empty($duser)){
		    redirect($indexUrl);
		}
		
		$cashout = $dDao->get_duser_cashout ( $duser ['uid'] );
		$duser ['now_profit'] = $duser ['profit_money'] - $cashout;
		$userInfo = get_userinfo ( $duser ['uid'] );
		$duser ['nickname'] = $userInfo ['nickname'];
		$duser ['userface'] = $userInfo ['headimgurl'];
		$duser ['team_count'] = $dDao->get_duser_member ( $duser ['uid'] );
		$duser ['team_count'] += $dDao->get_follow_member ( $duser ['uid'] );
		
		$map ['upper_user'] = $duser ['uid'];
		$map ['token'] = get_token ();
		$duser ['order_count'] = M ( 'shop_distribution_profit' )->where ( $map )->count ();
		$shareUrl= U('distribution_share',array('shop_id'=>$this->shop_id,'uid'=>$duser['uid'],'publicid'=>$this->appInfo['id']));
		$this->assign('share_url',$shareUrl);
		$this->assign ( 'duserData', $duser );
		$this->display ();
	}
	function distribution_gains() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		// $this->mid = 11930;//去掉
		$map ['upper_user'] = $this->mid;
		$map ['token'] = get_token ();
		$profitAll = M ( 'shop_distribution_profit' )->where ( $map )->select ();
		$all = 0;
		$first = 0;
		$second = 0;
		$third = 0;
		foreach ( $profitAll as $vo ) {
			$all += $vo ['profit'];
			if ($vo ['upper_level'] == 1) {
				$first += $vo ['profit'];
			} else if ($vo ['upper_level'] == 2) {
				$second += $vo ['profit'];
			} else {
				$third += $vo ['profit'];
			}
		}
		$data ['all'] = $all;
		$data ['first'] = $first;
		$data ['second'] = $second;
		$data ['third'] = $third;
		$this->assign ( 'datas', $data );
		$this->display ();
	}
	function distribution_total() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		$uid = $this->mid; // 去掉
		$duser = $dDao->getDistributionUser ( $uid );
		$data ['totals'] = $duser ['profit_money'];
		$data ['success'] = 0;
		$data ['wait'] = 0;
		$data ['fail'] = 0;
		
		$map ['uid'] = $uid;
		$map ['token'] = get_token ();
		$logs = M ( 'shop_cashout_log' )->where ( $map )->getFields ( 'id,cashout_amount,cashout_status' );
		foreach ( $logs as $vo ) {
			if ($vo ['cashout_status'] == 0) {
				$data ['wait'] += $vo ['cashout_amount'];
			} else if ($vo ['cashout_status'] == 1) {
				$data ['success'] += $vo ['cashout_amount'];
			} else {
				$data ['fail'] += $vo ['cashout_amount'];
			}
		}
		$cashout = $dDao->get_duser_cashout ( $duser ['uid'] );
		$data ['can_deposit'] = $duser ['profit_money'] - $cashout;
		
		$data ['can_deposit'] = $data ['totals'] - $data ['success'] - $data ['wait'];
		$this->assign ( 'datas', $data );
		$this->display ();
	}
	// 收益明细
	function distribution_detail() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		// $this->mid = 11930;//去掉
		// 佣金
		$map ['upper_user'] = $this->mid;
		$map ['token'] = get_token ();
		$profitData = M ( 'shop_distribution_profit' )->where ( $map )->select ();
		$levelName = $this->_get_level_name ();
		$orderDao = D ( 'Addons://Shop/Order' );
		foreach ( $profitData as &$vo ) {
			$orderInfo = $orderDao->getInfo ( $vo ['order_id'] );
			$vo ['order_number'] = $orderInfo ['order_number'];
			$duser = $dDao->getDistributionUser ( $vo ['duser'] );
			$vo ['title'] = $levelName [$duser ['level']] . ' 订单';
		}
		// 提现
		$cmap ['uid'] = $this->mid;
		$cmap ['token'] = get_token ();
		$cashout = M ( 'shop_cashout_log' )->where ( $cmap )->select ();
		foreach ( $cashout as &$cc ) {
			if ($cc ['cashout_status'] == 1) {
				$cc ['title'] = '提现成功';
			} else if ($cc ['cashout_status'] == 2) {
				$cc ['title'] = '提现失败';
			} else {
				$cc ['title'] = '提现处理中';
			}
		}
		$this->assign ( 'datas', $profitData );
		$this->assign ( 'cashout', $cashout );
		$this->display ();
	}
	// 我的团队
	function distribution_team() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		// $this->mid = 11930;//去掉
		$userArr = $dDao->get_duser_member ( $this->mid, 0 );
		$levelName = $this->_get_level_name ();
		// $profitArr = $dDao ->get_duser_profit($this->mid);
		foreach ( $userArr as $uid ) {
			$data = array ();
			$duser = $dDao->getDistributionUser ( $uid );
			$data ['ctime'] = time_format ( $duser ['ctime'] );
			$userInfo = get_userinfo ( $uid );
			$data ['username'] = $userInfo ['truename'];
			$data ['userface'] = $userInfo ['headimgurl'];
			$data ['mobile'] = $userInfo ['mobile'];
			$data ['uid'] = $uid;
			$data ['level'] = $levelName [$duser ['level']];
			// $data['team_count'] =intval( $dDao -> get_duser_member($uid));
			// $data['profit']= wp_money_format($profitArr[$uid]);
			$allDatas [] = $data;
		}
		// 获取客户
		$sfData = $dDao->get_follow_member ( $this->mid, 0 );
		foreach ( $sfData as $sf ) {
			$userInfo = get_userinfo ( $sf ['uid'] );
			$data = array ();
			$data ['ctime'] = time_format ( $sf ['ctime'] );
			$data ['username'] = $userInfo ['nickname'];
			$data ['userface'] = $userInfo ['headimgurl'];
			$data ['uid'] = $userInfo ['uid'];
			$coustom [] = $data;
		}
		$this->assign ( 'coustomData', $coustom );
		$this->assign ( 'coustomCount', count ( $coustom ) );
		$this->assign ( 'count', count ( $allDatas ) );
		$this->assign ( 'datas', $allDatas );
		$this->display ();
	}
	// 通知
	function distribution_msg() {
		$this->display ();
	}
	// 二维码
	function distribution_share() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		// $this->mid = 11884;//去掉
		$duser = $dDao->getDistributionUser ( $this->mid ,true);
		$token = get_token();
	    $key = 'diypage_is_index_' . $token;
		$is_diy = S ( $key );
		if ($is_diy) {
            $indexUrl = U('diy_page', array(
                'shop_id' => $this->shop_id,
                'id' => $is_diy,
                'uid' => $this->manager_id,
                'publicid' => $this->appInfo['id']
            ));
        } else {
			$indexUrl = U('index', array(
                'shop_id' => $this->shop_id,
                'uid' => $this->manager_id,
                'publicid' => $this->appInfo['id']
            ));
        }
        if (empty($duser)){
            redirect($indexUrl);
        }
		$data ['truename'] = get_username ( $duser ['uid'] );
		$data ['userface'] = get_userface ( $duser ['uid'] );
		$data ['qrcode'] = $duser ['qr_code'];
		
		if (empty ( $data ['qrcode'] )) {
			$res = D ( 'Home/QrCode' )->add_qr_code ( 'QR_LIMIT_SCENE', 'Shop', $duser ['uid'] );
			if (! ($res < 0)) {
				$map2 ['id'] = $duser ['id'];
				$dDao->where ( $map2 )->setField ( 'qr_code', $res );
				$duser ['qr_code'] = $res;
				$dDao->getDistributionUser ( $duser ['uid'], true, $duser );
				$data ['qrcode'] = $res;
			}
		}
		$this->assign ( 'datas', $data );
		$this->display ();
	}
	// 关注
	function distribution_follow() {
		$qrCode = '';
		$shop = D ( 'Addons://Shop/Shop' )->getInfo ( $this->shop_id );
		$duser = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $this->manager_id );
		if (! empty ( $duser ) && $duser ['level'] > 0 && $duser ['is_audit'] == 1) {
			if (! empty ( $duser ['qr_code'] )) {
				$qrCode = $duser ['qr_code'];
			} else {
				$res = D ( 'Home/QrCode' )->add_qr_code ( 'QR_LIMIT_SCENE', 'Shop', $duser ['uid'] );
				if (! ($res < 0)) {
					$map2 ['id'] = $duser ['id'];
					D ( 'Addons://Shop/Distribution' )->where ( $map2 )->setField ( 'qr_code', $res );
					$qrCode = $duser ['qr_code'] = $res;
					D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $duser ['uid'], true, $duser );
				}
			}
		} else {
            $res = D('Home/QrCode')->add_qr_code('QR_SCENE', 'Shop',  $this->manager_id );
// 			$res = D ( 'Home/QrCode' )->add_qr_code ( 'QR_LIMIT_SCENE', 'Shop', $this->manager_id );
			if (! ($res < 0)) {
				$qrCode = $res;
			}
		}
		$this->assign ( 'qrCode', $qrCode );
		$this->assign ( 'shop', $shop );
		$this->display ();
	}
	// 订单
	function distribution_goods() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		// $this->mid = 11905;//去掉
		$levelName = $this->_get_level_name ();
		$datas = $dDao->get_duser_order ( $this->mid );
		$this->assign ( $datas );
		$this->assign ( 'level_name', $levelName );
		$this->display ();
	}
	// 提现
	function distribution_take() {
		$dDao = D ( 'Addons://Shop/Distribution' );
		$duser = $dDao->getDistributionUser ( $this->mid );
		// $this->mid = 11930;//去掉
		if (IS_POST) {
			$res = 0;
			$money = I ( 'money' );
			$remark = I('remark');
			$zfbName=I('zfb_name');
			$zfbAccount=I('zfb_account');
			if ($money > 0) {
                $dsave['zfb_account'] = $zfbAccount;
                $dsave['zfb_name'] = $zfbName;
                $dDao->do_update($this->mid, $dsave);
                $save['cashout_amount'] = $money;
                $save['cashout_status'] = 0;
				$save ['ctime'] = time ();
				$save ['uid'] = $this->mid;
				$save ['token'] = get_token ();
				$save ['remark'] = $remark;
				$res = M ( 'shop_cashout_log' )->add ( $save );
			}
			echo $res;
			exit ();
		}
		$cashout = $dDao->get_duser_cashout ( $this->mid );
		$duser ['profit_money'] = $duser ['profit_money'] - $cashout;
		$this->assign ( 'duser', $duser );
		$this->display ();
	}
	// 申请分销用户
	function distribution_reg() {
		if (IS_POST) {
			$uid = $this->mid;
			$saveUser ['truename'] = trim ( $_POST ['truename'] );
			$saveUser ['mobile'] = $_POST ['mobile'];
			D ( 'Common/User' )->updateInfo ( $uid, $saveUser );
			$shopConfig = get_addon_config ( 'Shop' );
			$dMap ['uid'] = $dsave ['uid'] = $uid;
			$dsave ['enable'] = 1;
			$dMap ['token'] = $dsave ['token'] = get_token ();
			$dsave ['wechat'] = $_POST ['wechat'];
			$dsave ['inviter'] = $_POST ['inviter'];
			$dsave ['shop_name'] = $saveUser ['truename'] . ' 的小店';
			$dsave ['shop_logo'] = get_userface ( $uid );
			if (empty ( $dsave ['shop_logo'] )) {
				$shopInfo = D ( 'Addons://Shop/Shop' )->getInfo ( $this->shop_id );
				$dsave ['shop_logo'] = get_cover_url ( $shopInfo ['logo'] );
			}
			// 是否审核
			if ($shopConfig ['is_audit']) {
				$dsave ['is_audit'] = 0;
			} else {
				$dsave ['is_audit'] = 1; // 不需要审核，直接为通过
				$jurl = U ( 'index', array (
						'shop_id' => $this->shop_id,
						'uid' => $uid 
				) );
				// 设置用户的分销级别
				$lSave ['token'] = get_token ();
				$lSave ['uid'] = $uid;
				$lMap ['uid'] = $this->manager_id;
				// 判断是否为公众号管理员
				$is_public = M ( 'auth_group_access' )->where ( $lMap )->getfield ( 'group_id' );
				if ($is_public == 3) {
					// 是管理员，则用户为一级分销商
					$lSave ['upper_user'] = 0;
					$lSave ['level'] = 1;
					$dsave ['level'] = 1;
				} else {
					switch ($shopConfig ['level']) {
						case 1 :
							// 分销商只有一级
							$lSave ['upper_user'] = 0;
							$dsave ['level'] = $lSave ['level'] = 1;
							break;
						case 2 :
							// 分销商有二级
							$lManager = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $this->manager_id );
							$lSave ['upper_user'] = $lManager ['uid'];
							$dsave ['level'] = $lSave ['level'] = 2;
							break;
						default :
							// 分销商有三级
							$lManager = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $this->manager_id );
							$lSave ['upper_user'] = $lManager ['uid'];
							if ($lManager ['level'] == 1) {
								$dsave ['level'] = $lSave ['level'] = 2;
							} else {
								$dsave ['level'] = $lSave ['level'] = 3;
							}
							break;
					}
				}
				$ulmap ['uid'] = $uid;
				$ulmap ['token'] = get_token ();
				$udata = M ( 'shop_user_level_link' )->where ( $ulmap )->find ();
				if (empty ( $udata )) {
					$lSave ['cTime'] = time ();
					M ( 'shop_user_level_link' )->add ( $lSave );
				} else {
					M ( 'shop_user_level_link' )->where ( $ulmap )->save ( $lSave );
				}
			}
			$dMap ['is_delete'] = 0;
			$isDUser = D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $uid );
			if (empty ( $isDUser )) {
				$dsave ['ctime'] = time ();
				$res = D ( 'Addons://Shop/Distribution' )->add ( $dsave );
			} else {
				$res = D ( 'Addons://Shop/Distribution' )->where ( $dMap )->save ( $dsave );
				$isDUser = array_merge ( $isDUser, $dsave );
				D ( 'Addons://Shop/Distribution' )->getDistributionUser ( $uid, true, $isDUser );
			}
			if (empty ( $jurl )) {
				$jurl = U ( 'user_center', array (
						'shop_id' => $this->shop_id 
				) );
			}
			if ($res) {
				$returnData ['result'] = 1;
				$returnData ['msg'] = '提交申请成功，请等待审核结果！';
				$returnData ['jurl'] = $jurl;
				$this->ajaxReturn ( $returnData );
			} else {
				$returnData ['result'] = 0;
				$returnData ['msg'] = '提交申请失败！';
				$this->ajaxReturn ( $returnData );
			}
		} else {
			$shopInfo = D ( 'Addons://Shop/Shop' )->getInfo ( $this->shop_id );
			$this->assign ( 'shop_name', $shopInfo ['title'] );
			$this->display ();
		}
	}
	// 设置分销用户店铺名logo
	function ajax_set_logo() {
		$uid = I ( 'duid' );
		if (empty ( $uid )) {
			echo 0;
			exit ();
		}
		$save ['shop_name'] = I ( 'shop_name' );
		$shopLogo = I ( 'shop_logo' );
		// $save['shop_logo']=get_cover_url($shopLogo,100,100);
		$save ['shop_logo'] = $shopLogo;
		$res = D ( 'Addons://Shop/Distribution' )->do_update ( $uid, $save );
		if ($res) {
			echo 1;
		} else {
			echo 0;
		}
	}
	
	// 获取分销级别类型名称
	function _get_level_name() {
		$config = get_addon_config ( 'Shop' );
		
		$typeName = array ();
		switch ($config ['level']) {
			case 1 :
				if ($config ['level_name_1']) {
					$typeName [1] = $config ['level_name_1'];
				} else {
					$typeName [1] = '一级分销商';
				}
				break;
			case 2 :
				if ($config ['level_name_1']) {
					$typeName [1] = $config ['level_name_1'];
				} else {
					$typeName [1] = '一级分销商';
				}
				if ($config ['level_name_2']) {
					$typeName [2] = $config ['level_name_2'];
				} else {
					$typeName [2] = '二级分销商';
				}
				break;
			case 3 :
				if ($config ['level_name_1']) {
					$typeName [1] = $config ['level_name_1'];
				} else {
					$typeName [1] = '一级分销商';
				}
				if ($config ['level_name_2']) {
					$typeName [2] = $config ['level_name_2'];
				} else {
					$typeName [2] = '二级分销商';
				}
				if ($config ['level_name_3']) {
					$typeName [3] = $config ['level_name_3'];
				} else {
					$typeName [3] = '三级分销商';
				}
				break;
			default :
				$typeName = null;
				break;
		}
		return $typeName;
	}
	// 我的评价
	function myPJ() {
		$map ['uid'] = $this->mid;
		$map ['token'] = get_token ();
		$data = M ( 'shop_goods_comment' )->where ( $map )->select ();
		$goodsDao = D ( 'Addons://Shop/Goods' );
		foreach ( $data as &$vo ) {
			$goods = $goodsDao->getInfo ( $vo ['goods_id'] );
			$vo ['goods_title'] = $goods ['title'];
			$vo ['goods_img'] = $goods ['imgs_url'] [0];
		}
		$this->assign ( 'data', $data );
		$this->display ();
	}
}
