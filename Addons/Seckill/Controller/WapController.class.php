<?php

namespace Addons\Seckill\Controller;
use Home\Controller\AddonsController;

class WapController extends AddonsController{
	function _initialize() {
		
		parent::_initialize ();
	}
	function index() {
		$id = $map['id'] = I('id',0,intval);
		$model = M( 'seckill' );
		$info = $model->where($map)->find();
		$this->assign ( 'info',$info);
		$is_over = 0;
		if(NOW_TIME>$info['end_time']){
			$is_over = 1;
		}else if(NOW_TIME<$info['start_time']){
			$is_over = 2;
			$left_time = $info['start_time'] - NOW_TIME;
		}else{
			$left_time = $info['end_time'] - NOW_TIME;
		}
		$this->assign('left_time',$left_time);
		$this->assign('is_over',$is_over);
		
		$shopMap['token'] = get_token();
		$shopInfo = M('shop') -> where($shopMap)->order('id desc')->find();
		//监控锁定商品数量
		D('Addons://Shop/Goods')->checkLockNum($shopInfo['id']);
		
		$this->assign('shopInfo',$shopInfo);
		$goodsMap['seckill_id'] = $info['id'];
		$goodsList = M('seckill_goods')->where($goodsMap)->select();
		foreach($goodsList as &$v){
			$v['goods_info'] = D("Addons://Shop/Goods")->getInfo((int)$v['goods_id']);
			if ($is_over != 0 || $v['seckill_count'] ==0){
			    $v['can_jamp']=0;
			}else{
			    $v['can_jamp']=1;
			}
		}
		$this->assign('goodsList',$goodsList);
		$this->display ();
	}
}
