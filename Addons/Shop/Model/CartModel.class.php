<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class CartModel extends Model {
	protected $tableName = 'shop_cart';
	function getMyCart($uid, $update = false) {
		$key = 'Cart_getMyCart_' . $uid;
		$list = S ( $key );
		if ($list === false || $update) {
			$list = array ();
			$map ['uid'] = $uid;
			$info = $this->where ( $map )->select ();
			
			$goodsDao = D ( 'Addons://Shop/Goods' );
			$shopDao = D ( 'Addons://Shop/Shop' );
			foreach ( $info as $v ) {
				$v ['goods'] = $goodsDao->getInfo ( $v ['goods_id'] );
				$v ['shop'] = $shopDao->getInfo ( $v ['shop_id'] );
				$v ['goods_name'] = $v ['goods'] ['title'];
				if (! empty ( $v ['spec_option_ids'] )) {
					$ids = explode ( '_', $v ['spec_option_ids'] );
					$op_title = array ();
					foreach ( $v ['goods'] ['spec_list'] as $spec ) {
						foreach ( $spec ['options'] as $op ) {
							if (in_array ( $op ['id'], $ids ))
								$op_title [] = $op ['name'];
						}
					}
					$v ['goods_name'] .= '(' . implode ( ' ', $op_title ) . ')';
				}
				$v ['shop_name'] = $v ['shop'] ['title'];
				$v ['unqid'] = $v ['goods_id'] . ':' . $v ['spec_option_ids'];
				
				$list [$v ['unqid']] = $v;
			}
			
			S ( $key, $list );
		}
		
		return $list;
	}
	function addToCart($goods) {
		$myList = $this->getMyCart ( $goods ['uid'] );
		$unqid = $goods ['goods_id'] . ':' . $goods ['spec_option_ids'];
		
		if (isset ( $myList [$unqid] )) {
			$num = $myList [$unqid] ['num'] + $goods ['num'];
			$map ['id'] = $myList [$unqid] ['id'];
			$this->where ( $map )->setField ( 'num', $num );
		} else {
			$goods ['openid'] = get_openid ();
			$this->add ( $goods );
		}
		if(!$goods['seckill_id']){
			//锁定商品库存
			D('Addons://Shop/Goods')->setLockNum($goods['num'],$goods['goods_id'],$goods ['spec_option_ids']);
		}
		return count ( $this->getMyCart ( $goods ['uid'], true ) );
	}
	function delCart($ids) {
		$ids = array_filter ( explode ( ',', $ids ) );
		if (empty ( $ids ))
			return 0;
		
		$map ['id'] = array (
				'in',
				$ids 
		);
		
		$uids = $this->where ( $map )->getFields ( 'uid,goods_id,num,spec_option_ids,cTime,lock_rid_num' );
		$res = $this->where ( $map )->delete ();
	    $shopConfig=get_addon_config('Shop');
	    if (!empty($shopConfig['lock_num_time'])){
	        $lock_time=$shopConfig['lock_num_time'];
	    }else{
	        $lock_time=3600;
	    }
		$uids = array_unique ( array_filter ( $uids ) );
		$goodsDao=D('Addons://Shop/Goods');
		foreach ( $uids as $uid=>$vo ) {
		    if ($vo['num'] > $vo['lock_rid_num']){
		        $sec=NOW_TIME - $vo['cTime'];
		        if ($sec <= $lock_time){
		        	$this->getMyCart ( $uid, true );
		        	//释放锁定商品库存
		        	$num=0-$vo['num'];
		        	$goodsDao->setLockNum($num,$vo['goods_id'],$vo['spec_option_ids']);
		        }
		    }
		}
		return $res;
	}
	function delUserCart($uid, $goods_ids,$ids='') {
	    empty ( $ids ) || $map ['id'] = array (
	        'in',
	        $ids
	    );
		empty ( $goods_ids ) || $map ['goods_id'] = array (
				'in',
				$goods_ids 
		);
		$map ['uid'] = $uid;
		$cardInfo=$this->where ( $map )->getFields ( 'goods_id,num,spec_option_ids,cTime' );
		$goodsDao=D('Addons://Shop/Goods');
	    $shopConfig=get_addon_config('Shop');
	    if (!empty($shopConfig['lock_num_time'])){
	        $lock_time=$shopConfig['lock_num_time'];
	    }else{
	        $lock_time=3600;
	    }
		
		foreach ($cardInfo as $vo){
		    $sec=NOW_TIME - $vo['cTime'];
		    if ($sec <= $lock_time){
		        //释放锁定商品库存
		        $num=0-$vo['num'];
		        $goodsDao->setLockNum($num,$vo['goods_id'],$vo['spec_option_ids']);
		    }
		}
		$res = $this->where ( $map )->delete ();
		     
		$this->getMyCart ( $uid, true );
		return $res;
	}
}
