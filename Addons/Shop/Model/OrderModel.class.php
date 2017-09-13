<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class OrderModel extends Model {
	protected $tableName = 'shop_order';
	function getInfo($id, $update = false, $data = array()) {
		$key = 'Order_getInfo_' . $id;
		$info = S ( $key );
		if ($info === false || $update ) {
			$info = ( array ) (count ( $data ) == 0 ? $this->find ( $id ) : $data);
			if (count ( $info ) != 0) {
				
				if($info ['order_from_type'] == 0){
					$info ['order_from_type'] = '商城';
				}else if($info ['order_from_type'] == 10){
					$info ['order_from_type'] = '电视购物';
				}else if($info ['order_from_type'] == 11){
					$info ['order_from_type'] = '秒杀';	
				}
				
				switch ($info ['pay_type']) {
					case 0 : // 微信支付
						$info ['common'] = '微信支付';
						break;
					case 1 : // 支付宝
						$info ['common'] = '支付宝';
						break;
					case 2 : // 财付通wap
						$info ['common'] = '财付通wap';
						break;
					case 3 : // 财付通
						$info ['common'] = '财付通';
						break;
					case 4 :
						$info ['common'] = '银行卡支付';
						break;
					case 10 :
						$info ['common'] = '货到付款';
						break;
					case 11 :
						$info ['common'] = '到店支付';
						break;
				}
				$code = array (
						"sf" => '顺丰',
						"sto" => '申通',
						"yt" => '圆通',
						"yd" => '韵达',
						"tt" => '天天',
						"ems" => 'EMS',
						"zto" => '中通',
						"ht" => '汇通',
						"qf" => '全峰' 
				);
				
				if ($info['status_code']==0 && $info['pay_status'] !=0 ){
					$info['status_code'] = $saveStatus['status_code'] = 1;
					$this->where(array('id'=>$id))->save($saveStatus);
				}
				
				$info ['send_code_name'] = $code [$info ['send_code']];
				
				$info ['status_code_name'] = $this->_status_code_name ( $info ['status_code'] );
				
				
				$info ['status'] = $info ['pay_status'] == 0 ? '未支付' : '已支付';
				
				$goods = json_decode ( $info ['goods_datas'], true );
				$goods = $goods [0];
				$goods ['goods_id'] = $goods ['id'];
				unset ( $goods ['id'] );
				// $i['goodsinfo']=$goods;
				$info = array_merge ( $info, $goods );
			}
			S ( $key, $info );
		}
		
		return $info;
	}
	function _status_code_name($code) {
		$status_code = array (
				0 => '待支付',
				1 => '待商家确认',
				2 => '待发货',
				3 => '配送中',
				4 => '确认已收货',
				5 => '确认已收款',
				6 => '待评价',
				7 => '已评论' 
		);
		return $status_code [$code];
	}
	function getOrderList($map) {
		$list = ( array ) $this->where ( $map )->order ( 'id desc' )->select ();
		foreach ( $list as &$v ) {
			if($v ['order_from_type'] == 0){
				$v ['order_from_type'] = '商城';
			}else if($v ['order_from_type'] == 10){
				$v ['order_from_type'] = '电视购物';
			}else if($v ['order_from_type'] == 11){
				$v ['order_from_type'] = '秒杀';	
			}
			$goods = json_decode ( $v ['goods_datas'], true );
			$goods = $goods [0];
			$goods ['goods_id'] = $goods ['id'];
			unset ( $goods ['id'] );
			$v = array_merge ( $v, $goods );
			
			if ($v ['pay_status'] == 0) {
				if ($v ['pay_type'] == 10){
					$v ['order_status'] = '货到付款';
				}else if ($v ['pay_type'] == 11){
					$v ['order_status'] = '到店支付';
				}else{
					$v ['order_status'] = '等待买家付款';
				}
			} else {
				$v ['order_status'] = '买家已付款';
			}
			$v ['status_code_name'] = $this->_status_code_name ( $v ['status_code'] );
			$v ['goods'] = json_decode ( $v ['goods_datas'], true );
		}
		
		return $list;
	}
	function getSendInfo($id) {
		$info = $this->getInfo ( $id );
		$map ['id'] = $info ['shop_id'];
		$api_key = M ( 'shop' )->where ( $map )->getField ( 'api_key' );
		empty ( $api_key ) && $api_key = '02727dd96ccf4c4eabb091d85cb7fa10';
		
		$url = 'http://v.juhe.cn/exp/index?key=' . $api_key . '&com=' . $info ['send_code'] . '&no=' . $info ['send_number'];
		$data = wp_file_get_contents ( $url );
		$data = json_decode ( $data, true );
		
		if ($data ['resultcode'] == 200) {
			$save ['order_id'] = $id;
			$save ['status_code'] = 3;
			$save ['extend'] = 1;
			M ( 'shop_order_log' )->where ( $save )->delete ();
			
			foreach ( $data ['result'] ['list'] as $vo ) {
				$save ['cTime'] = strtotime ( $vo ['datetime'] );
				$save ['remark'] = $vo ['zone'] . ' ' . $vo ['remark'];
				M ( 'shop_order_log' )->add ( $save );
			}
		}
		
		return $data;
	}
	function update($id, $save) {
		$map ['id'] = $id;
		$this->where ( $map )->save ( $save );
		$info=$this->getInfo ( $id, true );
		return $info;
	}
	function setStatusCode($id, $code) {
		$save ['status_code'] = $code;
		$res = $this->update ( $id, $save );
// 		$strSql= M ()->getLastSql () ;
// 		addWeixinLog($strSql,'orderpaytestesql_'.$id);
		$data ['order_id'] = $id;
		$data ['status_code'] = $code;
		$data ['cTime'] = NOW_TIME;
		
		$info = $this->getInfo ( $id );
		switch ($code) {
			case '1' :
				$data ['remark'] = '您提交了订单，请等待商家确认';
				break;
			case '2' :
				$data ['remark'] = '商家已经确认订单，开始拣货';
				break;
			case '3' :
				$data ['remark'] = '您的订单已经发货，发货快递： ' . $info ['send_code_name'] . ', 快递单号： ' . $info ['send_number'];
				$data ['extend'] = '0';
				break;
			case '4' :
				$data ['remark'] = '确认已收货';
				break;
			case '5' :
				$data ['remark'] = '确认已收款';
				break;
			case '6' :
				$data ['remark'] = '订单已完成，请评价这次服务';
				break;
			case '7' :
				$data ['remark'] = '评论完成，欢迎下次再来';
				break;
		}
		
		M ( 'shop_order_log' )->add ( $data );
		
		return true;
	}
	function autoSetFinish() {
		$over_time = NOW_TIME - 10 * 24 * 3600; // 10天后自动设置为已收货
		
		$map ['status_code'] = $map2 ['status_code'] = 3;
		$map ['pay_status'] = 1;
		
		$order_ids = $this->where ( $map )->getFields ( 'id' );
		if (empty ( $order_ids ))
			return false;
		
		$map2 ['order_id'] = array (
				'in',
				$order_ids 
		);
		$map2 ['extend'] = '0';
		$map2 ['cTime'] = array (
				'lt',
				$over_time 
		);
		$order_ids = M ( 'shop_order_log' )->where ( $map2 )->getFields ( 'order_id' );
		if (empty ( $order_ids ))
			return false;
		$disDao=D ( 'Addons://Shop/Distribution' );
		foreach ( $order_ids as $id ) {
			$this->setStatusCode ( $id, 6 );
			$disDao->do_distribution_profit ( $id );
		}
	}
	//自动发送
	function autoSend($orderId){
		$orderInfo = $this -> getInfo($orderId);
		if ($orderInfo ['type'] == 2){
		   //点卡类
		    $map['goods_id'] = $orderInfo['goods_id'];
		    $map['is_use'] = 0;
		    
		    $accountList = M('shop_virtual') -> where($map)->select();
		    if($accountList){
		        $map['card_codes'] = $accountList[0]['card_codes'];
		        $data['id'] = $accountList[0]['id'];
		        $data['is_use'] = 1;
		        $data['order_id'] = $orderId;
		        $data['uid']=get_mid();
		        $res = M('shop_virtual') -> where(array('id'=>$data['id'])) -> save($data);
		        if($res){
		            $save ['is_send'] = 1;
		            $save ['pay_status'] = 1;
		            $save ['pay_time'] =NOW_TIME;
		            $this->update ( $orderId, $save );
		            $this->setStatusCode ( $orderId, 5 );
		        }
		    }else{
		        return false;
		    }
		}else{
		    //软件类
		    $save ['is_send'] = 1;
		    $save ['pay_status'] = 1;
		    $save ['pay_time'] =NOW_TIME;
		    $this->update ( $orderId, $save );
		    $this->setStatusCode ( $orderId, 5 );
		}
		
	}
	//获取用户有效订单的商品总数量，总消费金额
	function getTotalData($uid){
	    $map['uid']=$uid;
	    $map['token']=get_token();
	    //完成订单
	    $map['status_code']=array('in','4,5,6,7');
	    $totals=$this->where($map)->field("sum(total_price) as totals")->select();
	    $goodsDataJson=$this->where($map)->getFields('goods_datas');
	    $goodsNum=0;
	    $goodsIdNums=null;
	    foreach ($goodsDataJson as $vo){
	        $goodsData=json_decode($vo,true);
	        foreach ($goodsData as $goods){
	            $goodsNum += $goods['num'];
	            if ($goodsIdNums[$goods['id']]){
	                $goodsIdNums[$goods['id']] += $goods['num'];
	            }else {
	                $goodsIdNums[$goods['id']]= intval($goods['num']);
	            }
	        }
	       
	    }
	    $data['total_money']=empty($totals[0]['totals'])?0:$totals[0]['totals'];
	    $data['goods_count']=$goodsNum;
	    $data['goods_id_num']=$goodsIdNums;
	    return $data;
	}
	
	//获取有效订单的各商品销售量
	function getGoodsSaleCount($shopId){
	    $map['shop_id']=$shopId;
	    $map['token']=get_token();
	    //完成订单
	    $map['status_code']=array('in','4,5,6,7');
	    $goodsDataJson=$this->where($map)->getFields('goods_datas');
	    $goodsIdNums=null;
	    foreach ($goodsDataJson as $vo){
	        $goodsData=json_decode($vo,true);
	        foreach ($goodsData as $goods){
	            if ($goodsIdNums[$goods['id']]){
	                $goodsIdNums[$goods['id']] += $goods['num'];
	            }else {
	                $goodsIdNums[$goods['id']]= intval($goods['num']);
	            }
	        }
	
	    }
	    return $goodsIdNums;
	}

	//设置商品销售量
	function setGoodsSaleCount($orderId)
    {
        $map['id'] = $orderId;
        $orderInfo = $this->getInfo($orderId);
        $goodsDataJson = $orderInfo['goods_datas'];
        $goodsIdNums = null;
        $goodsData = json_decode($goodsDataJson, true);
        $goodsDao = D('Addons://Shop/Goods');
        foreach ($goodsData as $goods) {
            if ($goodsIdNums[$goods['id']]) {
                $goodsIdNums[$goods['id']] += $goods['num'];
            } else {
                $goodsIdNums[$goods['id']] = intval($goods['num']);
            }
            $goodsMap['id'] = $goods['id'];
            $num = 0 - $goods["num"];
            if (empty($goods["spec_option_ids"])) {
                if ($orderInfo['is_lock'] == 1) {
                    $goodsDao->setLockNum($num, $goods['id']);
                } else {
                    if ($orderInfo['order_from_type'] == '秒杀') {
                        $seckillMap['order_id'] = $orderInfo['id'];
                        $sgoodsMap['seckill_id'] = M('seckill_order')->where($seckillMap)->getField('seckill_id');
                        D('Addons://Seckill/SeckillGoods')->reduceCount($sgoodsMap['seckill_id'], $goods['id'], $goods['num']);
                    }
                }
                $goodsMap['id'] = $goods['id'];
                M('shop_goods')->where($goodsMap)->setDec('stock_num', $goods["num"]);
            } else {
                if ($orderInfo['is_lock'] == 1) {
                    $goodsDao->setLockNum($num, $goods['id'], $goods["spec_option_ids"]);
                }
                $skuMap['goods_id'] = $goods['id'];
                $skuMap['spec_option_ids'] = $goods['spec_option_ids'];
                M('shop_goods_sku_data')->where($skuMap)->setDec('stock_num', $goods['num']);
            }
        }
        foreach ($goodsIdNums as $k => $num) {
            if (empty($k))
                continue;
            $goods = $goodsDao->getInfo($k);
            $save['sale_count'] = $goods['sale_count'] + $num;
            $goodsDao->updateById($k, $save);
        }
    }
	
    //查询订单支付状况，并更新其状态值
    function refreshPayStatus($uid=0){
    	//查询支付未成功的订单
    	if ($uid > 0){
    		$map['uid']= $uid;
    	}
    	$map ['pay_status'] = array('neq',1);
    	$twoTime = time() - 48 *60*60;
    	$map ['cTime'] = array('egt',$twoTime );
    	$map ['token']=get_token();
    	$datas = $this->where($map)->select();
    	$paymentDao = D('Addons://Payment/PaymentOrder');
    	$dDao =D ( 'Addons://Shop/Distribution' );
    	$payInfo = M ( 'payment_set' )->where ( array (
    			'token' => get_token()
    	) )->find ();
    	$shopConfig = get_addon_config ( 'Shop' );
    	$goodsdao = D ( 'Addons://Shop/Goods' );
    	$seckillDao =  D ( 'Addons://Seckill/SeckillGoods' );
    	foreach ($datas as $vo){
    		if (empty($vo['order_number'])){
    			continue;
    		}
    		$save = array();
    		//已支付定金
    		if ($vo['pay_status'] == 2){
    			$vo['order_number'] .= 'yue';
    		}
    		$result = $paymentDao ->queryorder($vo['order_number']);
    		if ($result && $result['status']==1 && $result['trade_state'] == 'SUCCESS'){
    			$pmap['single_orderid'] = $vo['order_number'];
    			$pmap['uid'] = $vo['uid'];
    			$psave['status'] = 1;
    			$res = $paymentDao->where($pmap)->save($psave);
    			if ($res){
    			    $payId= $paymentDao->where($pmap)->getField('id');
    			    $paymentDao->getInfo ( $payId,true);
    			}
//     			$price = floatval($vo['total_price']) + floatval($vo['mail_money']);
    			if ($vo['is_deposit']){
    			    if ($vo['pay_status'] == 0){
    			        //支付定金
    			        $price = $vo['deposit_money'];
    			    }else if ($vo ['pay_status'] == 2) {
    			        //支付剩余金额
    			        $price = $vo ['total_price'] - $vo ['deposit_money']; // 剩余金额
    			    }
    			}else{
    			    $price = floatval($vo['total_price']) + floatval($vo['mail_money']);
    			}
    			 
    			
    			$paymoney = $result['total_fee']/100;
    			$issuccess = 1;
    			if ($price > $paymoney){
    			    //支付金额不对
    			    $issuccess = 0;
    			    $save['order_state']=2;//异常
    			    $extArr = json_decode($vo['extra'],true);
    			    $extArr['order_state_msg'] ='应支付金额'.$price.'元，实际支付金额'.$paymoney.'元';
    			    $save['extra'] = json_encode($extArr);
    			}
    			$save ['pay_time'] = strtotime($result['pay_time']);
    			//
    			$goodsData = json_decode ( $vo ['goods_datas'], true );
    			if (! empty ( $shopConfig ['lock_num_time'] )) {
    			    $lock_time = $shopConfig ['lock_num_time'];
    			} else {
    			    $lock_time = 3600;
    			}
    			$sec = NOW_TIME - $vo ['cTime'];
    			if ($vo ['is_lock'] == 0 && $issuccess) {
    			    // 锁定库存已被释放，重新锁定
    			    foreach ( $goodsData as $goods ) {
    			        $goodsdao->setLockNum ( $goods ['num'], $goods ['id'], $goods ["spec_option_ids"] );
    			        if ($vo ['order_from_type'] == '秒杀') {
    			            $seckillMap ['order_id'] = $vo ['id'];
    			            $sgoodsMap ['seckill_id'] = M ( 'seckill_order' )->where ( $seckillMap )->getField ( 'seckill_id' );
    			             $seckillDao ->reduceCount ( $sgoodsMap ['seckill_id'], $goods ['id'], $goods ['num'] );
    			        }
    			    }
    			    $save ['is_lock'] = 1;
    			    // D('Addons://Shop/Order')->update($orderid,$save);
    			}
    			if ($vo['pay_status']==0 && $vo['is_deposit']==1){
    				//定金支付
    				$save ['pay_status'] = 2;
    				$save ['is_send'] = 2;
    			}else{
    				// 全额支付
    				$save ['pay_status'] = 1;
    			}
    			$vo = $this->update ( $vo['id'], $save );
    			if ($save ['pay_status'] == 1 && $vo ['is_deposit'] == 1 && $issuccess) {
    				// 订金全额支付 确认已收款
    				$this->setStatusCode ( $vo['id'], 5 );
    				// 做分佣处理
    				$is_distribution =  M ( 'shop_distribution_profit' )->where ( array (
    						'order_id' => $vo['id']
    				) )->getFields ( 'id' );
    				if (empty ( $is_distribution )) {
    					// 确认已收款，处理分销用户获取的拥金
    					$dDao ->do_distribution_profit ( $vo['id'] );
    				}
    				if ($payInfo['shop_pay_score'] >0){
    					// 到店支付返积分
    					add_credit ( 'shoppay', 0, array (
    					'uid'=>$vo['uid'],
    					'score' => $payInfo ['shop_pay_score'],
    					'title'=>'到店支付返积分'
    					) );
    				}
    				// 设置销售量
    				$this->setGoodsSaleCount ( $vo['id'] );
    				
    			}else{
    				$this->setStatusCode ( $vo['id'], 1 );
    			}
    		}
    	}
    	
    }
    
    //查询未支付订单是否使用代金券或积分并退还
    function giveBackExtr($order_id =0,$token='',$uid = 0){
        //查询支付未成功的订单
        if ($uid > 0){
            $map['uid']= $uid;
        }
        if ($order_id > 0){
            $map['id']=$order_id;
        }else{
            $twoTime = time() - 48 *60*60;
            $map ['cTime'] = array('egt',$twoTime );
        }
        $map ['pay_status'] = array('neq',1);
        $map ['token']= empty($token)?get_token():$token;
        $map ['extra'] = array('neq','');
        $datas = $this->where($map)->getFields('id,uid,extra');
        $snDao = D ( 'Common/SnCode' );
        foreach ($datas as $key=> $dat){
            $ext = $dat['extra'];
            $dd = json_decode($ext,true);
            if ($dd['score_info']['is_add'] > 0){
                // 清空用户金币
                $credit ['score'] = 0 - $dd ['score_info']['score'];
                $credit ['title'] = '商品订单删除，积分返回';
                $credit ['uid'] =$dat['uid'];
                $cres = add_credit ( 'auto_add', 0, $credit );
                $dd['score_info']['is_add']=0;
            }
            if ($dd['sn_info']['is_use'] >0){
                $data['is_use'] = 0;
                $data['use_time'] = 0;
                $data['can_use'] = 1;
                $res = $snDao->update ( $dd['sn_info']['sn_id'], $data );
                $dd['sn_info']['is_use']=0;
            }
            if($dd['reward_info']['is_add'] >0){
                // 清空用户金币
                $credit ['score'] = 0 - $dd ['reward_info']['score'];
                $credit ['title'] = '商品订单删除';
                $credit ['uid'] =$dat['uid'];
                $cres = add_credit ( 'auto_add', 0, $credit );
                if ($dd['reward_info']['sn_id'] >0)
                    $snDao->where(array('id'=>$dd['reward_info']['sn_id']))->delete();
                $dd['reward_info']['is_add']=0;
            }
            $save['extra']=json_encode($dd);
            $this->update($key, $save);
        }
    }
}
