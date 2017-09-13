<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class ShopModel extends Model {
	function getInfo($id=0, $update = false, $data = array()) {
		if(!$id){
			$shopMap['token'] = get_token ();
			$publicInfo = get_token_appinfo($shopMap['token']);
			$shopMap['manager_id'] = $publicInfo['uid'];
			$info = M ( 'shop' )->where ( $shopMap )->find (); 
			$id = $info['id'];
			$key = 'Shop_getInfo_' . $id;
			S ( $key, $info );
		}else{
			$key = 'Shop_getInfo_' . $id;
			$info = S ( $key );
			if ($info === false || $update) {
				$info = ( array ) (empty ( $data ) ? $this->find ( $id ) : $data);
				S ( $key, $info );
			}
		}
		return $info;
	}
	function updateById($id, $data) {
		$map ['id'] = $id;
		$res = $this->where ( $map )->save ( $data );
		if ($res) {
			$this->getInfo ( $id, true );
		}
	}
	function getShop($uid){
		$map['uid'] = $uid;
		$res = $this->where($map)->select();
		return $res;
	}
	
	//处理分销用户获取的拥金
	function do_distribution_profit($id){
	     
	    $orderinfo= D ( 'Addons://Shop/Order' )->find($id);
	    $userinfo=get_userinfo($orderinfo['uid']);
	    $token=get_token();
	    //带来的粉丝必须是关注公众号的
	    if (! empty($orderinfo) && $userinfo['has_subscribe'][$token]==1) {
	        $price = $orderinfo['total_price'];
	        $followId=$orderinfo['uid'];
	        
	        $shop = D('Addons://Shop/Shop')->find($orderinfo['shop_id']);
	        // 三级分销  ：父shopid
	        $parentShop = wp_explode($shop['parent_shop']);
	         
	        $data['uid'] = $shop['manager_id'];
	        $data['token'] = get_token();
	        $data['ctime'] = NOW_TIME;
	        $data['order_id'] = $id;
	         
	        $config = get_addon_config('Shop');
	        if ($config['need_distribution'] == 1) {
	            $count = count($parentShop);
	            $maxProfit=$config['max_money'];
	            $level = $config['level'];
	            $lev[0] = strstr($config['level1'], '%') ? floatval($config['level1']) * 0.01 : $config['level1'];
	            $lev[1] = strstr($config['level2'], '%') ? floatval($config['level2']) * 0.01 : $config['level2'];
	            $lev[2] = strstr($config['level3'], '%') ? floatval($config['level3']) * 0.01 : $config['level3'];
	            switch ($level) {
	                case '3':
	                    // 三级
	                    if ($count != 0) {
	                        foreach ($parentShop as $key => $v) {
	                            if (!empty($lev[$key])){
	                                $data['distribution_percent'] = $lev[$key];
	                                $data['profit_shop'] = $v;
	                                $data['profit'] = $price * $lev[$key];
	                                if ($maxProfit){
	                                    $data['profit'] > $maxProfit && $data['profit']=$maxProfit;
	                                }
	                                $datas[] = $data;
	                                $money += $data['profit'];
	                            }
	                           
	                        }
	                        if (!empty($datas)){
	                            M('shop_distribution_profit')->addAll($datas);
	                            $log['remark']='分销提成获利 '.$money.'元';
	                            $log ['type'] = 0; // 系统自动充值
	                            add_money($data['uid'], $money,$log);
	                        }
	                    }
	                    break;
	                case '2':
	                    if ($count == 3) {
	                        $parentShop[0] = $parentShop[1];
	                        $parentShop[1] = $parentShop[2];
	                        unset($parentShop[2]);
	                    }
	                    if ($count != 0) {
	                        foreach ($parentShop as $key => $v) {
	                            if (!empty($lev[$key])){
	                                $data['distribution_percent'] = $lev[$key];
	                                $data['profit_shop'] = $v;
	                                $data['profit'] = $price * $lev[$key];
	                                if ($maxProfit){
	                                    $data['profit'] > $maxProfit && $data['profit']=$maxProfit;
	                                }
	                                $datas[] = $data;
	                                $money += $data['profit'];
	                            }
	                        }
	                        if (!empty($datas)){
	                            M('shop_distribution_profit')->addAll($datas);
	                            $log['remark']='分销提成获利 '.$money.'元';
	                            $log ['type'] = 0; // 系统自动充值
	                            add_money($data['uid'], $money,$log);
	                        }
	                    }
	                    break;
	                case '1':
	                    $map['uid']=$followId;
	                    $map['token']=get_token();
	                    $duid=M('shop_statistics_follow')->where($map)->getField('duid');
	                    if ($duid){
	                        //带粉分佣
	                        //判断是否已启用
	                        $map['uid']=$duid;
	                        $enable=M('shop_distribution_user')->where($map)->getField('enable');
	                        //启用状态 才进行分佣
	                        if ($enable==1){
	                            if (!empty($lev[0])){
	                                $data['uid']=$duid;
	                                $data['distribution_percent'] = $lev[0];
	                                $data['profit'] = $price * $lev[0];
	                                $data['profit_shop']=0;
	                                if ($maxProfit){
	                                    $data['profit'] > $maxProfit && $data['profit']=$maxProfit;
	                                }
	                                M('shop_distribution_profit')->add($data);
	                                $log['remark']='分销提成获利 '.$data['profit'].'元';
	                                $log ['type'] = 0; // 系统自动充值
	                                add_money($data['uid'], $data['profit'],$log);
	                            }
	                        }
	                       
	                    }else if ($count != 0) {
	                        if (!empty($lev[0])){
	                            $data['distribution_percent'] = $lev[0];
	                            $data['profit_shop'] = $parentShop[$count - 1];
	                            $data['profit'] = $price * $lev[0];
	                            if ($maxProfit){
	                                $data['profit'] > $maxProfit && $data['profit']=$maxProfit;
	                            }
	                            M('shop_distribution_profit')->add($data);
	                            $log['remark']='分销提成获利 '.$data['profit'].'元';
	                            $log ['type'] = 0; // 系统自动充值
	                            add_money($data['uid'], $data['profit'],$log);
	                        }
	                    }
	                    break;
	                default:
	                    break;
	            }
	        }
	    }
	     
	}
	
	//获取粉丝对应的分佣员工
	function getDistributionUser($uid,$update=false){
	    $key = 'Shop_getDistributionUser_' . $uid;
	    $info = S ( $key );
	    if ($info === false || $update) {
	        $map['token']=get_token();
	        $map['uid']=$uid;
	        $info = M('shop_statistics_follow')->where($map)->find();
	        S ( $key, $info );
	    }
	    return $info;
	}
	
}
