<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class GoodsModel extends Model {
	protected $tableName = 'shop_goods';
	function getInfo($id, $update = false, $data = array()) {
		$arr = explode ( ':', $id );
		$id = $arr [0];
		$key = 'Goods_getInfo_' . $id;
		$info = S ( $key );
		if ($info === false || $update || true) { // TODO 关闭缓存
			$info = ( array ) (empty ( $data ) ? $this->find ( $id ) : $data);
			$pmap['goods_id']=$id;
			$pmap['token']=get_token();
			//商品参数
			$info['goods_param']=M('goods_param_link')->where($pmap)->order('id asc')->select();
			//商品门店
			$storeData=$this->get_coupon_shop();
			$storeAll=M('goods_store_link')->where($pmap)->order('id asc')->select();
			foreach ($storeAll as $sst){
				$storeArr[$sst['store_id']]['goods_id']=$id;
				$storeArr[$sst['store_id']]['id']=$sst['id'];
				$storeArr[$sst['store_id']]['store_id']=$sst['store_id'];
				$storeArr[$sst['store_id']]['store_title']=$storeData[$sst['store_id']];
				$storeArr[$sst['store_id']]['store_num'] += $sst['store_num'];
			}
			$info['goods_store']=$storeArr;
			$info['stock_num']=$info['stock_num']-$info['lock_num'];
			if (! isset ( $info ['imgs_url'] ) && ! empty ( $info ['imgs'] )) {
				$imgs = array_filter ( explode ( ',', $info ['imgs'] ) );
				foreach ( $imgs as $img ) {
					$imgs_url [] = get_cover_url ( $img ,500,500);
				}
				
				$info ['imgs_url'] = array_filter ( $imgs_url );
				
				// 商品规格配置
				$map ['goods_id'] = $id;
				$sku_config = M ( 'shop_goods_sku_config' )->where ( $map )->select ();
				if (! empty ( $sku_config ) && $info['is_spec'] == 1) {
					foreach ( $sku_config as $sc ) {
						$sku_spec_ids [$sc ['spec_id']] = $sc ['spec_id'];
						$sku_option_ids [$sc ['option_id']] = $sc ['option_id'];
						$sku_imgs [$sc ['option_id']] = empty ( $sc ['img'] ) ? '' : get_cover_url ( $sc ['img'] );
					}
					
					$spec_map ['id'] = array (
							'in',
							$sku_spec_ids 
					);
					$spec_arr = M ( 'shop_spec' )->where ( $spec_map )->getFields ( 'id,title' );
					
					$option_map ['id'] = array (
							'in',
							$sku_option_ids 
					);
					$list = M ( 'shop_spec_option' )->where ( $option_map )->field ( 'id,name,spec_id' )->select ();
					foreach ( $list as $vo ) {
						$options [$vo ['spec_id']] [] = $vo;
						$option_names [$vo ['id']] = $vo ['name'];
					}
					
					foreach ( $sku_spec_ids as $id ) {
						$spec_list [$id] ['title'] = $spec_arr [$id];
						$spec_list [$id] ['options'] = $options [$id];
					}
					
					$info ['spec_list'] = $spec_list;
				}
                    // 商品规格数据
                if ($info['is_spec'] == 1) {
                    $info['sku_data'] = M('shop_goods_sku_data')->where($map)->getFields('spec_option_ids,market_price,stock_num,sale_price,lock_num');
                } else {
                    $info['sku_data'] = null;
                }
				foreach ( $info ['sku_data'] as $soid => $price ) {
					$info ['sku_data_defalut'] = $soid;
					$info ['market_price'] = $price ['market_price'];
					$info ['stock_num'] = $price ['stock_num'] - $price['lock_num'];
					$info ['sale_price'] =$price ['sale_price'];
					
					break;
				}
				foreach ( $info ['sku_data'] as $soid => &$price ) {
					$stock_total_num += $price ['stock_num'];
					$stock_total_lock_num += $price['lock_num'];
					$price['stock_num']=$price ['stock_num'] - $price['lock_num'];
				}
				if(!empty($info['sku_data'])){
					$info ['stock_total_num'] = $stock_total_num - $stock_total_lock_num;
				}else{
					$info ['stock_total_num'] = $info ['stock_num'];
				}
// 				dump('111');
// 				dump($info);
				// $info ['sku_data'] = M ( 'shop_goods_sku_data' )->where ( $map )->getFields ( 'spec_option_ids,market_price' );
				// foreach ( $info ['sku_data'] as $soid => $price ) {
				// $info ['sku_data_defalut'] = $soid;
				// $info ['market_price'] = $price;
				// break;
				// }
				
				// 商品属性
				// 获取分类包括父级的所有ID
				$cate_ids = explode(',',$info ['category_id']);
				//D ( 'Category' )->get_parent_ids ( $info ['category_id'], $cate_ids );
				
				// 获取已经占用的扩展字段
				$attr_map ['token'] = get_token ();
				$attr_map ['cate_id'] = array (
						'in',
						$cate_ids 
				);
				$list = M ( 'shop_attribute' )->where ( $attr_map )->field ( 'title, extra,attr_type, goods_field' )->select ();
				// dump ( $list );
				foreach ( $list as $k => $vo ) {
					$val = $info [$vo ['goods_field']];
					switch ($vo ['attr_type']) {
						case 'checkbox' :
							$extra = wp_explode ( $vo ['extra'] );
							$val = explode ( ',', $val );
							foreach ( $val as &$v ) {
								$v = $extra [$v];
							}
							$val = implode ( ', ', $val );
							break;
						case 'radio' :
							$extra = wp_explode ( $vo ['extra'] );
							$val = $extra [$val];
							break;
						case 'select' :
							$extra = wp_explode ( $vo ['extra'] );
							$val = $extra [$val];
							break;
						case 'datetime' :
							$val = time_format ( $val );
							break;
						case 'picture' :
							$val = get_img_html ( $val );
							break;
					}
					
					$attr_list [$k] ['val'] = $val;
					$attr_list [$k] ['title'] = $vo ['title'];
				}
				
				$info ['attr_list'] = $attr_list;
			}
			S ( $key, $info );
		}
		if (! empty ( $arr [1] )) {
			$soid = $arr [1];
			isset ( $info ['sku_data'] [$soid] ) && $info ['market_price'] = $info ['sku_data'] [$soid]['market_price'];
			
			$soid_arr = explode ( '_', $soid );
			$op_title = array ();
			foreach ( $option_names as $d => $n ) {
				if (in_array ( $d, $soid_arr ))
					$op_title [] = $n;
			}
			
			$info ['title'] .= '(' . implode ( ' ', $op_title ) . ')';
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
	function getRecommendList($shop_id) {
		// $map ['shop_id'] = $shop_id;
		$map ['token'] = get_token ();
		$map ['is_show'] = 1;
		$map ['is_recommend'] = 1;
		$map ['is_delete'] = 0;
		$list = $this->where ( $map )->field ( 'id' )->order ( 'id desc' )->limit ( 8 )->select ();
		foreach ( $list as &$vo ) {
			$goodsInfo = $this->getInfo ( $vo ['id'] );
			if ($goodsInfo['stock_total_num']){
			    $rdata[]=$goodsInfo;
			}
		}
		return $rdata;
	}
	function getNewsList($shop_id, $uid = 0) {
		// $map ['shop_id'] = $shop_id;
		$isUser = getUserInfo ( $uid, 'manager_id' );
		if ($isUser) {
			$map2 ['uid'] = $uid;
			$map2 ['down_shelf'] = 0;
			$downShelfGoods = M ( 'shop_goods_downshelf_user' )->where ( $map2 )->getFields ( 'goods_id' );
			$downShelfGoods && $map ['id'] = array (
					'not in',
					$downShelfGoods 
			);
		}
		
		$map ['token'] = get_token ();
		$map ['is_show'] = 1;
		$map ['is_delete'] =0;
		$list = $this->where ( $map )->field ( 'id' )->order ( 'id desc' )->limit ( 8 )->select ();
		foreach ( $list as &$vo ) {
			$goodsInfo = $this->getInfo ( $vo ['id'] );
		    if ($goodsInfo['stock_total_num']) {
                $rdata[] = $goodsInfo;
            }
        }
        return $rdata;
	}
	function getList($shop_id, $search_key = '', $order = 'id desc', $last_id = 0, $count = 10, $category_id = 0, $uid = 0,$goodsidArr=null,$field='id',$notIds=null) {
		// $map ['shop_id'] = $shop_id;
		$map ['token'] = $map2 ['token'] = get_token ();
		$map ['is_show'] = 1;
		$map ['is_delete']=0;
		$isUser = getUserInfo ( $uid, 'manager_id' );
		if ($isUser) {
			$map2 ['uid'] = $uid;
			$map2 ['down_shelf'] = 0;
			$downShelfGoods = M ( 'shop_goods_downshelf_user' )->where ( $map2 )->getFields ( 'goods_id' );
			$downShelfGoods && $map ['id'] = array (
					'not in',
					$downShelfGoods 
			);
		}
		empty ( $search_key ) || $map ['title'] = array (
				'like',
				"%$search_key%" 
		);
		if ($field == 'id' && false === strpos ( strtolower ( $order ), 'desc' )){
			$idOrderMap = array (
					'gt',
					$last_id
			);
			$map['id'][]=$idOrderMap;
		}else if($field == 'id' && $last_id > 0){
			$idOrderMap = array (
					'lt',
					$last_id
			);
			$map['id'][]=$idOrderMap;
		}else if(false === strpos ( strtolower ( $order ), 'desc' )){
			$map[$field]=array('gt',$last_id);
		}else if( $last_id > 0){
			$map[$field]=array('lt',$last_id);
		}
		
		
// 		if (false === strpos ( strtolower ( $order ), 'desc' )) {
// 			$idOrderMap = array (
// 					'gt',
// 					$last_id 
// 			);
// 			$map['id'][]=$idOrderMap;
// 		} elseif ($last_id > 0) {
// 			$idOrderMap = array (
// 					'lt',
// 					$last_id 
// 			);
// 			$map['id'][]=$idOrderMap;
// 		}
		
// 		empty ( $category_id ) || $map ['category_id'] = $category_id;
		if (!empty($category_id)){
			$ccmap ['token'] = get_token ();
			$ccmap ['shop_id'] = $shop_id;
			$ccmap['category_second|category_first']=array('eq',$category_id);
			$goodsIds = M('goods_category_link')->where($ccmap)->getFields('goods_id');
			if ($goodsIds){
				$map['id'][]=array('in',$goodsIds);
			}else{
				$map['id'][]= array('eq',0);
			}
		}
		$default = I ( 'option_ids' );
		$default_arr = array_unique ( array_filter ( explode ( ',', $default ) ) );
		if (! empty ( $default_arr )) {
			$cmap ['option_id'] = array (
					'in',
					$default_arr 
			);
			$goods_ids = M ( 'shop_goods_sku_config' )->where ( $cmap )->getFields ( 'DISTINCT goods_id' );
			if (empty ( $goods_ids )) {
				$idOptionMap = array('eq',0);
			} else {
				$idOptionMap = array (
						'in',
						$goods_ids 
				);
			}
			$map['id'][]=$idOptionMap;
		}
		if (! empty ( $goodsidArr)){
			$idSearchMap=array('in',$goodsidArr);
			$map['id'][]=$idSearchMap;
		}
		if (! empty($notIds) ){
			$idNotIn = array('not in',$notIds);
			$map['id'][]=$idNotIn;
		}
		$orderField = explode(' ', $order);
        $field = $orderField[0];
		if (false === strpos ( strtolower ( $order ), 'desc' )){
			$field == 'sale_price' && $order = 'sale_price asc, market_price asc';
		}else {
			$field == 'sale_price' && $order = 'sale_price desc, market_price desc';
		}
		
		$list = $this->where ( $map )->field ( 'id' )->order ( $order )->limit ( $count )->select ();
		foreach ( $list as &$vo ) {
// 			$vo = $this->getInfo ( $vo ['id'] );
			$goodsInfo=$this->getInfo($vo ['id'] );
			if ($goodsInfo['stock_total_num']){
			    if (floatval($goodsInfo['sale_price'])){
			        $goodsInfo['list_show_price']=$goodsInfo['sale_price'];
			    }else{
			        $goodsInfo['list_show_price']=$goodsInfo['market_price'];
			    }
				$rdata[]=$goodsInfo;
			}
		}
	    $orderField=explode(' ', $order);
	    $field = $orderField[0];
	    $field == 'sale_price' && $rdata=array_sort($rdata,'list_show_price',$orderField[1]);
// 		$rdata=array_sort($rdata,'list_show_price','asc');
		return $rdata;
	}
	// 热销度计算
	function getRank($id, $info = array()) {
		static $_max_sale_count;
		empty ( $info ) && $info = $this->getInfo ( $id );
		
		if (empty ( $_max_sale_count )) {
			// $map ['shop_id'] = $info['shop_id'];
			
			$map ['token'] = get_token ();
			$map ['is_show'] = 0;
			$_max_sale_count = $this->where ( $map )->getField ( 'max(sale_count)' );
		}
		
		// 30天的时间权重值
		$time_rank = 25 * (30 - (date ( 'Ymd' ) - date ( 'Ymd', $info ['show_time'] ))) / 30;
		$time_rank < 0 && $time_rank = 0;
		
		// 推荐权重
		$recommend_rank = 25 * $info ['is_recommend'];
		
		// 销量权限
		$sale_rank = 50 * $info ['sale_count'] / $_max_sale_count;
		
		return $time_rank + $recommend_rank + $sale_rank;
	}
	// 分页获取商品
	function getGoodsByShop($shop_id) {
		// $map ['shop_id'] = $shop_id;
		$map ['token'] = get_token ();
		
		$map ['is_show'] = 1;
		$map ['is_delete'] =0;
		$list = $this->where ( $map )->field ( 'id' )->order ( 'id desc' )->selectPage ();
		foreach ( $list ['list_data'] as &$vo ) {
			$goodsInfo = $this->getInfo ( $vo ['id'] );
		    if ($goodsInfo['stock_total_num']) {
                $rdata[] = $goodsInfo;
            }
        }
        return $rdata;
	}
	
	//设置商品锁定数量
	function setLockNum($num,$goods_id,$spc_option_ids=''){
	    $goodsInfo=$this->getInfo($goods_id);
	    if ($spc_option_ids){
	        $map['goods_id']=$goods_id;
	        $map['spec_option_ids']=$spc_option_ids;
	        $goodsInfo['sku_data'][$spc_option_ids]['lock_num'] += $num;
	        $save['lock_num']=$goodsInfo['sku_data'][$spc_option_ids]['lock_num'];
	        if ($save['lock_num']<0){
	            $save['lock_num']=0;
// 	            $goodsInfo['sku_data'][$spc_option_ids]['lock_num']=0;
	        }
// 	        $goodsInfo['sku_data'][$spc_option_ids]['stock_num'] =$goodsInfo['sku_data'][$spc_option_ids]['stock_num']- $save['lock_num'];
	        $res=M('shop_goods_sku_data')->where($map)->save($save);
	    }else{
	        $map['id']=$goods_id;
	        $goodsInfo['lock_num']+=$num;
	        $save['lock_num']=$goodsInfo['lock_num'];
	        if ($save['lock_num']<0){
	            $save['lock_num']=0;
// 	            $goodsInfo['lock_num']=0;
	        }
// 	        $goodsInfo['stock_num']=$goodsInfo['stock_num']-$save['lock_num'];
	        $res=$this->where($map)->save($save);
	    }
// 	    dump($spc_option_ids);
	    $this->getInfo($goods_id,true,$goodsInfo);
	    return $res;
	}
	
	//监控锁定商品数量
	function checkLockNum($shopId){
	    $shopConfig=get_addon_config('Shop');
	    if (!empty($shopConfig['lock_num_time'])){
	        $lock_time=$shopConfig['lock_num_time'];
	    }else{
	        $lock_time=3600;
	    }
	    if (empty($shopId)){
	        $shopId=session('wap_shop_id');
	    }
	    if (empty($shopId)){
	       return;
	    }
	    //查询被锁库存数量
	    $goodsMap['shop_id']=$shopId;
	    $goodsMap['token']=get_token();
	    $goodsMap['is_show']=1;
	    $goodsMap['is_delete']=0;
	    $goodsInfo=M('shop_goods')->where($goodsMap)->getFields('id,stock_num,lock_num');
	    foreach ($goodsInfo as $gg){
	        $goodsidarr[$gg['id']]=$gg['id'];
	        if ($gg['lock_num'] >0){
	           $lock_goods[$gg['id']]=$gg['id'];
	        }
	    }
	    if (!empty($goodsidarr)){
	    	$skuMap['goods_id']=array('in',$goodsidarr);
	    	$skuData=M('shop_goods_sku_data')->where($skuMap)->getFields('id,goods_id,lock_num,spec_option_ids');
	    	foreach ($skuData as $sku){
	    		if ($sku['lock_num']>0){
	    			$lock_goods[$sku['goods_id']]=$sku['goods_id'];
	    		}
	    	}
	    }
	    //获取购物车
	    $cartMap['shop_id']=$shopId;
	    if ($lock_goods){
	        $cartMap['goods_id']=array('in',$lock_goods);
	        $cartData=M('shop_cart')->where($cartMap)->getFields('id,goods_id,num,spec_option_ids,cTime,lock_rid_num');
	        foreach ($cartData as $cart){
	            if ($cart['num'] > $cart ['lock_rid_num']){
	                $sec_num=$cart['num']-$cart['lock_rid_num'];
	                $sec=NOW_TIME - $cart['cTime'];
	                if ($sec > $lock_time){
	                	//60分钟后、释放锁定库存
	                	$num=0-$sec_num;
	                	$res=$this->setLockNum($num, $cart['goods_id'],$cart['spec_option_ids']);
	                	if ($res){
	                	    M('shop_cart')->where(array('id'=>$cart['id']))->setInc('lock_rid_num',$sec_num);
	                	}
	                }
	            }
	        }
	        $orderMap['shop_id']=$shopId;
	        $orderMap['token']=get_token();
	        $orderMap['pay_status']=0;
	        $orderMap['status_code']=0;
	        $orderMap['is_lock']=1;
	        $orderDao=D('Addons://Shop/Order');
	        $orderData=$orderDao->where($orderMap)->select();
	        foreach ($orderData as $order){
	            $sec=NOW_TIME - $order['cTime'];
	            if ($sec > $lock_time){
	                $goods=json_decode($order['goods_datas'],true);
	                foreach ($goods as $g){
	                    $num=0-$g['num'];
	                    $orderRes=$this->setLockNum($num, $g['id'],$g["spec_option_ids"]);
	                    if ($orderRes && $order['order_from_type']==11){
	                    	$seckillMap['order_id']=$order['id'];
	                    	$sgoodsMap['seckill_id']=M('seckill_order')->where($seckillMap)->getField('seckill_id');
	                    	$sgoodsMap['goods_id']=$g['id'];
	                    	M('seckill_goods')->where($sgoodsMap)->setInc('seckill_count',$g['num']);
	                    }
	                }
	                $save['is_lock']=0;
	                $orderDao->update($order['id'],$save);
	            }
	        }
	        
	    }
	}
	
	//获取所有门店
	function get_coupon_shop(){
		$map['token']=get_token();
		$data=M('coupon_shop')->where($map)->getFields('id,name');
		return $data;
	}
	
}
