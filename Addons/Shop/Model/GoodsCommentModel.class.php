<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class GoodsCommentModel extends Model {
	protected $tableName = 'shop_goods_comment';
	function getShopComment($goodsId,$update=false){
		$key='GoodsComment_getShopComment_'.$goodsId;
		$data=S($key);
		if($data === false || $update){
			$map ['is_show'] = 1;
			$map['goods_id']=$goodsId;
			$map['token']=get_token();
			$data=$this->where($map)->select();
			S($key,$data);
		}
		return $data;
	}
}
