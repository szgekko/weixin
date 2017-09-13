<?php

namespace Addons\ShopCoupon\Controller;

use Home\Controller\AddonsController;

class WapController extends AddonsController {
    
    function _initialize() {
        parent::_initialize();
        if (_ACTION == 'lists'|| _ACTION == 'personal'){
            $uid=$this->mid;
            $token = get_token();
            //获取通知数
            $key='cardnotic_'.$token.'_'.$uid;
            $rrs=S($key);
            if($rrs === false){
                $beforetime=7 * 24 * 60 * 60;
                $thetime=strtotime(time_format(time(),'Y-m-d'))-$beforetime;
                $cmap ['token'] = $token;
                $cmap ['uid']= $uid;
                $cardMember=M('card_member')->where($cmap)->find();
                if (!empty($cardMember['level'])){
                    $map['cTime']=array('egt',$thetime);
                    $map['token']=$token;
    
                    $notices =M('card_notice')->where($map)->select();
                    foreach ($notices as $v){
                        $gradeArr=explode(',',$v['grade']);
                        if ($v['to_uid']==0){
                            if (in_array(0, $gradeArr) || in_array($cardMember['level'], $gradeArr)){
                                $data[]=$v;
                            }
                        }else if ($v['to_uid']==$uid){
                            $data[]=$v;
                        }
                    }
                    $rrs=count($data);
                    S($key,$rrs);
                }
            }else if($rrs <= 0){
                $rrs='';
            }
            $this->assign('notice_num',$rrs);
        }
    }
	
	// 开始领取页面
	function prev() {
		$target_id = I ( 'id', 0, 'intval' );
		$list = D ( 'Common/SnCode' )->getMyList ( $this->mid, $target_id, 'ShopCoupon' );
		if (! empty ( $_GET ['sn_id'] )) {
			$sn_id = I ( 'sn_id' );
			foreach ( $list as $v ) {
				if ($v ['id'] == $sn_id) {
					$res = $v;
				}
			}
			$list = array (
					$res 
			);
		}
		
		$this->assign ( 'my_sn_list', $list );
		
		$data = $this->_detail ();
		$tpl = isset ( $_GET ['has_get'] ) ? 'has_get' : 'prev';
		
		$info = get_followinfo ( $this->mid );
		$config = getAddonConfig ( 'UserCenter' );
		if ($config ['need_bind'] && (empty ( $info ['mobile'] ) || empty ( $info ['truename'] ))) {
			Cookie ( '__forward__', $_SERVER ['REQUEST_URI'] );
			$url = addons_url ( 'UserCenter://Wap/bind_prize_info' );
		} else {
			$url = U ( 'set_sn_code', array (
					'id' => $data ['id'] 
			) );
		}
		
		$this->assign ( 'url', $url );
		
		$this->display ( $tpl );
	}
	function qr_code() {
		$id = I ( 'sn_id' );
		$map2 ['uid'] = $this->mid;
		
		$info = D ( 'Common/SnCode' )->getInfoById ( $id );
		if ($info ['uid'] != $this->mid) {
			$this->error ( '非法访问' );
		}
		
		$this->assign ( 'info', $info );
		// dump ( $info );
		
		$this->display ();
	}
	function do_pay() {
		$cTime = I ( 'cTime', 0, 'intval' );
		if ($cTime > 0 && (NOW_TIME * 1000 - $cTime) > 30000) {
			$this->error ( '二维码已过期' );
		}
		
		$id = I ( 'sn_id' );
		$info = D ( 'Common/SnCode' )->getInfoById ( $id );
		if (empty ( $info )) {
			$this->error ( '扫描图片不对' );
		}
		
		$this->assign ( 'info', $info );
		$data = D ( 'ShopCoupon' )->getInfo ( $info ['target_id'] );
		$this->assign ( 'coupon', $data );
		
		if (empty ( $data ['pay_password'] )) { // 通过工作授权来核销
			$map ['token'] = get_token ();
			$map ['uid'] = $this->mid;
			$map ['enable'] = 1;
			
			$role = M ( 'servicer' )->where ( $map )->getField ( 'role' );
			$role = explode ( ',', $role );
			if (! in_array ( 2, $role )) {
				$this->error ( '你需要工作授权才能核销' );
			}
		}
		
		$this->display ();
	}
	function do_pay_ok() {
		$msg = '';
		$dao = D ( 'Common/SnCode' );
		
		$id = I ( 'sn_id' );
		$info = $dao->getInfoById ( $id );
		$data = D ( 'ShopCoupon' )->getInfo ( $info ['target_id'] );
		$this->assign ( 'coupon', $data );
		
		if (! empty ( $data ['pay_password'] )) {
			$pay_password = I ( 'pay_password' );
			if (empty ( $pay_password )) {
				$msg = '核销密码不能为空';
			}
			
			if (empty ( $msg )) {
				if ($data ['pay_password'] != $pay_password) {
					$msg = '核销密码不正确';
				}
			}
		} else {
			$map ['token'] = get_token ();
			$map ['uid'] = $this->mid;
			$map ['enable'] = 1;
			
			$role = M ( 'servicer' )->where ( $map )->getField ( 'role' );
			$role = explode ( ',', $role );
			if (! in_array ( 2, $role )) {
				$msg = '你需要工作授权才能核销';
			}
		}
		
		if (empty ( $msg )) {
			if ($info ['is_use']) {
				$msg = '该优惠券已经使用过，请不要重复使用';
			}
		}
		
		if (empty ( $msg )) {
			$info ['is_use'] = $save ['is_use'] = 1;
			$save ['can_use']=0;
			$info ['use_time'] = $save ['use_time'] = time ();
			$save['admin_uid'] = $this->mid;
			
			$res = $dao->update ( $id, $save );
			
			$map ['is_use'] = 1;
			$map ['target_id'] = $info ['target_id'];
			$map ['addon'] = 'Coupon';
			$data ['use_count'] = $save2 ['use_count'] = intval ( $dao->where ( $map )->count () );
			
			D ( 'ShopCoupon' )->update ( $info ['target_id'], $save2 );
			
			$msg = '核销成功';
		}
		
		$this->assign ( 'msg', $msg );
		$this->assign ( 'conpon', $data );
		
		$this->display ();
	}
	// 过期提示页面
	function over() {
		$this->_detail ();
		$this->display ();
	}
	function show_error($error, $info = '') {
		empty ( $info ) && $info = D ( 'ShopCoupon' )->getInfo ( $id );
		$this->assign ( 'info', $info );
		
		$this->assign ( 'error', $error );
		$this->display ( 'over' );
		exit ();
	}
	function show() {
		// dump ( $this->mid );
		$id = I ( 'id', 0, 'intval' );
		
		$sn_id = I ( 'sn_id', 0, 'intval' );
		
		$list = D ( 'Common/SnCode' )->getMyList ( $this->mid, $id, 'ShopCoupon' ,true);
		
		if ($sn_id > 0) {
			foreach ( $list as $vo ) {
				$my_count += 1;
				$vo ['id'] == $sn_id && $sn = $vo;
			}
		} else {
			$sn = $list [0];
		}
		
		if (empty ( $sn )) {
			$this->error ( '非法访问' );
			exit ();
		}
		
		$this->assign ( 'sn', $sn );
		// dump($sn);
		
		$this->_detail ( $my_count );
		
		$this->display ( 'show' );
	}
	function _detail($my_count = false) {
		$id = I ( 'id', 0, 'intval' );
		$data = D ( 'ShopCoupon' )->getInfo ( $id );
		$this->assign ( 'data', $data );
		$this->assign ( 'info', $data );
		// dump ( $data );
		
		// 领取条件提示
		$follower_condtion [1] = '关注后才能领取';
		$follower_condtion [2] = '用户绑定后才能领取';
		$follower_condtion [3] = '领取会员卡后才能领取';
		$tips = condition_tips ( $data ['addon_condition'] );
		
		$condition = array ();
		$data ['max_num'] > 0 && $condition [] = '每人最多可领取' . $data ['max_num'] . '张';
		$data ['credit_conditon'] > 0 && $condition [] = '积分中金币值达到' . $data ['credit_conditon'] . '分才能领取';
		$data ['credit_bug'] > 0 && $condition [] = '领取后需扣除金币值' . $data ['credit_bug'] . '分';
		isset ( $follower_condtion [$data ['follower_condtion']] ) && $condition [] = $follower_condtion [$data ['follower_condtion']];
		empty ( $tips ) || $condition [] = $tips;
		
		$this->assign ( 'condition', $condition );
		// dump ( $condition );
		
		return $data;
	}
	
	// 记录中奖数据到数据库
	function set_sn_code() {
	    
		$id = $param ['id'] = I ( 'id', 0, 'intval' );
		
		$info = D ( 'ShopCoupon' )->getInfo ( $id );
		$uid = $this->mid;
		if ($uid <= 0){
		    $msg = '出现错误了，请稍后再试！' ;
		    $this->show_error ( $msg, $info );
		}
		if ($info ['collect_count'] >= $info ['num']) {
			$msg = empty ( $info ['empty_prize_tips'] ) ? '您来晚了，代金券已经领取完' : $info ['empty_prize_tips'];
			$this->show_error ( $msg, $info );
		}
		if (! empty ( $info ['start_time'] ) && $info ['start_time'] > NOW_TIME) {
			$msg = empty ( $info ['start_tips'] ) ? '活动在' . time_format ( $info ['start_time'] ) . '开始，请到时再来' : $info ['start_tips'];
			$this->show_error ( $msg, $info );
		}
		if (! empty ( $info ['end_time'] ) && $info ['end_time'] < NOW_TIME) {
			$msg = empty ( $info ['end_tips'] ) ? '您来晚了，活动已经结束' : $info ['end_tips'];
			$this->show_error ( $msg, $info );
		}
		
		$snDao=D ( 'Common/SnCode' );
		//总已领取
		$snMap['target_id']=$id;
		$snMap['addon']="ShopCoupon";
		// 			$snMap['can_use']=1;
		$collect=$snDao->where($snMap)->count();
		if ($collect >= $info['num']){
		    $msg = '您来晚了，已被领取完了！' ;
		    $this->show_error ( $msg, $info );
		}
		
		$map1['token'] = get_token();
		$map1['uid'] = $this->mid;
		$cardMember = M('card_member')->where($map1)->find();
		$levelInfo = D('Addons://Card/CardLevel')->getCardMemberLevel($this->mid);
		$levelArr = explode(',', $info['member']);
		if (in_array(0, $levelArr) || in_array(- 1, $levelArr) && $cardMember || in_array($levelInfo['id'], $levelArr)) {
		} else {
		    $msg = '没有权限领取！';
			$this->show_error ( $msg, $info );
		}
		
		//个人领取数
		$list =$snDao ->getMyList ( $this->mid, $id, 'ShopCoupon' );
		$this->assign ( 'my_sn_list', $list );
		$my_count = count ( $list );

		if ($info ['limit_num'] > 0 && $my_count >= $info ['limit_num']) {
			$msg = '每人最多只能领取' . $info ['limit_num'] . '张';
			$this->show_error ( $msg, $info );
		}
		

		$data ['target_id'] = $id;
		$data ['uid'] = $uid;
		$data ['addon'] = 'ShopCoupon';
		$data ['sn'] = uniqid ();
		$data ['cTime'] = NOW_TIME;
		$data ['token'] = $info ['token'];
		// 金额
		$data ['prize_title'] = $info ['money'];
		if ($info ['is_money_rand']) {
			$data ['prize_title'] = rand ( $info ['money'] * 100, $info ['money_max'] * 100 ) / 100;
		}
		$sn_id = D ( 'Common/SnCode' )->add ( $data );
		
		if (isset ( $_GET ['is_stree'] ))
			return false;
		
		$param ['id'] = $id;
		$param ['sn_id'] = $sn_id;
		redirect ( U ( 'show', $param ) );
	}
	function coupon_detail() {
		$id = $param ['id'] = I ( 'id', 0, 'intval' );
		$info = D ( 'ShopCoupon' )->getInfo ( $id );
		$this->assign ( 'info', $info );
		$this->display ();
	}
	function get_sn_status() {
		$id = I ( 'sn_id', 0, 'intval' );
		$is_use = D ( 'Common/SnCode' )->getInfoById ( $id, 'is_use' );
		echo $is_use;
	}
	function index() {
		$param ['id'] = $id = I ( 'id' );
		$info = D ( 'ShopCoupon' )->getInfo ( $id );
// 		dump($info);
		
		//已领取的直接进入详情页面，不需要再领取（TODO：仅为不需要多次领取的客户使用）
		$mylist = D ( 'Common/SnCode' )->getMyList ( $this->mid, $id,'ShopCoupon',true );
// 		dump($mylist);
// 		die;
		if ($info['limit_num']> 0 && count( $mylist) >= $info['limit_num']) {
			$param ['sn_id'] = $mylist [0] ['id'];
			redirect ( U ( 'show', $param ) );
		}
		
		$public_info = get_token_appinfo ();
		$param ['publicid'] = $public_info ['id'];
		
		$url = addons_url ( "ShopCoupon://Wap/set_sn_code", $param );
		$this->assign ( 'jumpURL', $url );
		
		$info['content']=str_replace("\n","<br/>",$info['content']);
		//总已领取
		$snMap['target_id']=$id;
		$snMap['addon']="ShopCoupon";
		// 			$snMap['can_use']=1;
		$collect=D ( 'Common/SnCode' )->where($snMap)->count();
		if ($collect >= $info['num']){
		    $info['has_num']=0;
		}else {
		    $info['has_num']=1;
		}
        if ($info['has_num']) {
            $map1['token'] = get_token();
            $map1['uid'] = $this->mid;
            $cardMember = M('card_member')->where($map1)->find();
            $levelInfo = D('Addons://Card/CardLevel')->getCardMemberLevel($this->mid);
            $levelArr = explode(',', $info['member']);
            if (in_array(0, $levelArr) || in_array(- 1, $levelArr) && $cardMember || in_array($levelInfo['id'], $levelArr)) {
                $info['has_power'] = 1;
            } else {
                $info['has_power'] = 0;
            }
        }
        //获取适用商品
		$goodsif='';
		if (!empty($info['limit_goods_ids'])){
		    $goodsIds = wp_explode($info['limit_goods_ids'], ",");
		    $gMap['id']=array('in',$goodsIds);
		    $gMap['is_show']=1;
		    $gMap['is_delete']=0;
		    $title = M('shop_goods')->where($gMap)->getFields('title');
		   $goodsif.=implode('，', $title);
		}
		$info['goods']=$goodsif;
		//适用人群
		$memberif='';
		if (!empty($info['member'])){
		    $mIds = explode(',', $info['member']);
		    if (in_array(0, $mIds)){
		        $memberif = '所有用户';
		    }else if (in_array(-1, $mIds)){
		        $memberif='所有会员用户';
		    }else{
		        $memberif='会员等级为 ';
		        $mMap['id']=array('in',$mIds);
		        $member = M('card_level')->where($mMap)->getFields('level');
		        $memberif.=implode('，', $member);
		    }
		}
		$info['goods']=$goodsif;
		$info['member']=$memberif;
		$this->assign ( 'info', $info );
		$this->assign ( 'public_info', $public_info );
		//var_dump($info);
		//var_dump($info['content']);
		
		$this->display ();
	}
	function personal() {
	    $can_use=I('use',1,'intval');
// 	    $token=get_token();
// 	    D('Addons://Shop/Order')->giveBackExtr($token,$this->mid);
// 	    if ($isUse != ''){
// 	        $can_use=$isUse;
// 	    }
// 	    $can_use=$isUse;
	    $isCuXiao = I('get.is_cuxiao',2,'intval');
	    $cStr = I('get.str_coupon_id');
	    $cIdArr = wp_explode($cStr, ',');
		$list = D ( 'Common/SnCode' )->getMyAll ( $this->mid, 'ShopCoupon' ,true ,'',$can_use);
		$sDao = D ( 'Addons://ShopCoupon/ShopCoupon' );
		foreach ( $list as $k => &$v ) {
			$coupon = $sDao ->getInfo ( $v ['target_id'] );
			//&& $coupon['end_time'] > NOW_TIME
			if ($coupon ) {
			    $lgoods_ids = explode ( ',', $coupon ['limit_goods_ids'] );
			    if ($isCuXiao == 1 && $coupon['is_market_price']==1){
			        unset($list[$k]);
			    }else if($cIdArr && !in_array($v ['target_id'] , $cIdArr)){
			        unset($list[$k]);
			    }else{
			        if ($coupon['end_time'] <= NOW_TIME){
			            $v['can_use']=0;
			            $can_use == 1 && $v['is_old']=1;
			        }
			        $v ['sn_id'] = $v ['id'];
			        $v = array_merge ( $v, $coupon );
			    }
			   
				
			} else {
				unset ( $list [$k] );
			}
		}
		// dump ( $list );
		$this->assign ( 'list', $list );
		
		$this->display ();
	}
	function lists() {
	    $token = get_token();
	    //获取总领取数
	    //总已领取
	    $snMap['addon']="ShopCoupon";
	    $snMap['token']=$token;
	    // 			$snMap['can_use']=1;
	    $collect=D('Common/SnCode')->where($snMap)->group('target_id')->field('count(id) as num,target_id')->select();
	    foreach ($collect as $vv){
	        $colCountArr[$vv['target_id']]=$vv['num'];
	    }
	    
		$map['token'] = $token;
		$map['is_del']=0;
		$map['is_show']=1;
		$map['end_time']=array('gt',NOW_TIME);
		$datas = M('ShopCoupon')->where($map)->select();
		// dump ( $list );
		//获取用户的会员等级
		$levelInfo=D('Addons://Card/CardLevel')->getCardMemberLevel($this->mid);
		foreach ( $datas as $d ) {
		    if ($colCountArr[$d['id']] >= $d['num'] )
		        continue;
		    
		    $levelArr=explode(',', $d['member']);
		    if (in_array(0, $levelArr) || in_array(-1, $levelArr) || in_array($levelInfo['id'], $levelArr)){
		        $list [] = $d;
		    }
		}
		$this->assign ( 'list', $list );
		
		$this->display ();
	}
	function sn() {
		$map ['token'] = get_token ();
		$map ['target_id'] = I ( 'coupon_id' );
		$map ['addon'] = 'ShopCoupon';
		
		$key = I ( 'search' );
		if (! empty ( $key )) {
			$map ['sn'] = array (
					'like',
					'%' . $key . '%' 
			);
		}
		$is_use = I ( 'is_use' );
		if ($is_use == 1) {
			$map ['is_use'] = $is_use;
		}
		
		$code = M ( 'sn_code' )->where ( $map )->selectPage ();
		// dump($code);
		$this->assign ( $code );
		$this->assign ( 'is_use', $map ['is_use'] );
		
		$this->display ();
	}
	function sn_set() {
		$map ['id'] = I ( 'id' );
		$map ['token'] = get_token ();
		$data = M ( 'sn_code' )->where ( $map )->find ();
		if (! $data) {
			$this->error ( '数据不存在' );
		}
		
		if ($data ['is_use']) {
			$data ['is_use'] = 0;
			$data ['use_time'] = '';
		} else {
			$data ['is_use'] = 1;
			$data ['use_time'] = time ();
			$data['admin_uid'] = $this->mid;
		}
		
		$res = M ( 'sn_code' )->where ( $map )->save ( $data );
		if ($res) {
			if ($data ['addon'] == 'Coupon') {
				$map2 ['target_id'] = $maps ['id'] = $data ['target_id'];
				$map2 ['addon'] = 'Coupon';
				
				$info = M ( 'sn_code' )->where ( $map2 )->field ( 'sum(is_use) as use_count,count(id) as num' )->find ();
				
				$save ['use_count'] = $info ['use_count'];
				$save ['collect_count'] = $info ['num'];
				M ( 'coupon' )->where ( $maps )->save ( $save );
			} elseif ($data ['addon'] == 'ShopCoupon') {
				$map2 ['target_id'] = $maps ['id'] = $data ['target_id'];
				$map2 ['addon'] = 'ShopCoupon';
				
				$info = M ( 'sn_code' )->where ( $map2 )->field ( 'sum(is_use) as use_count,count(id) as num' )->find ();
				
				$save ['use_count'] = $info ['use_count'];
				$save ['collect_count'] = $info ['num'];
				M ( 'shop_coupon' )->where ( $maps )->save ( $save );
			}
			$this->success ( '设置成功' );
		} else {
			$this->error ( '设置失败' );
		}
	}
}
