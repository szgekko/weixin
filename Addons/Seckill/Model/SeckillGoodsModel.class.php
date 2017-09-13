<?php

namespace Addons\Seckill\Model;
use Think\Model;

/**
 * SeckillGoods模型
 */
class SeckillGoodsModel extends Model{
	
	function reduceCount($sekill_id,$goods_id,$count=1){
		$map['seckill_id'] = $sekill_id;
		$map['goods_id'] = $goods_id;
		$map['seckill_count'] = array('egt', $count);
		return $this -> where($map) -> setDec('seckill_count',$count);
	}
}
