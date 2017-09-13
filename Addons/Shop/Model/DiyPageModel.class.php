<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * DiyPage模型
 */
class DiyPageModel extends Model {
	protected $tableName = 'shop_page';
	function getInfo($id,$update = false,$data){
		$key = 'DiyPage_Data_' . $id;
		$info = S ( $key );
		if ($info === false || $update || true ) { // TODO 关闭缓存
			if($data){
				$info = $data;
			}else{
				$info = M('ShopPage')->find ( $id );
			}
			$configData = $info['config'];
			$configDataJson = json_decode(urldecode($configData),true);
			$goodsDao = D('Goods');
			foreach($configDataJson as &$json){
				if($json['id']=="goods" || $json['id']=="mutipic_goods"){
					$goodsData = $json['params']['goods_list'];
					$newGoodsData = array();
					foreach($goodsData as $g){
						if($g['id']>0){
							$goodsInfo = $goodsDao -> getInfo($g['id']);
							$gInfo['id'] = $g['id'];
							$gInfo['title']=$goodsInfo['title'];
							$gInfo['img'] = get_cover_url($goodsInfo['cover'],300,300);
							$gInfo['url'] = addons_url('Shop://Wap/detail',array('id'=>$g['id']));
							$gInfo['stock_num']=$goodsInfo['stock_total_num'];
							$gInfo['$$hashKey']=$g['$$hashKey'];
// 							if (isset($goodsInfo['sku_data'])){
// 								foreach ($goodsInfo['sku_data'] as $ss){
// 									if (!empty($ss['sale_price'])){
// 										$gInfo['market_price'] = $ss['sale_price'];
// 									}else{
// 									    $gInfo['market_price'] = $ss['market_price'];
// 									}
// 								}
// 							}else{
								if (floatval($goodsInfo['sale_price']) > 0 ){
									$gInfo['market_price']=$goodsInfo['sale_price'];
								}else{
								    $gInfo['market_price'] = $goodsInfo['market_price'];
								}
// 							}
							
							$newGoodsData[] = $gInfo;
							unset($gInfo);
						}
					}
					$json['params']['goods_list'] = $newGoodsData;
					//dump($goodsData['params']['goods_list']);
				}
			}
			$info['config'] = rawurlencode(json_encode($configDataJson)); 
			S ( $key, $info );	
		}
		return $info;
	}
}
