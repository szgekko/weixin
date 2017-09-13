<?php

namespace Addons\Seckill\Controller;
use Home\Controller\AddonsController;

class SeckillGoodsController extends AddonsController{
	var $seckill_id;
	function _initialize() {
		parent::_initialize ();
		$this -> seckill_id = I('id',0,intval);
		$res ['title'] = '管理秒杀商品';
		$res ['url'] = addons_url ( 'Seckill://SeckillGoods/lists',array('id'=>$this->seckill_id,'mdm'=>$_GET['mdm']));
		$res ['class'] = 'current';
		$nav [] = $res;
		$this->assign ( 'nav', $nav );
		
	}
	function lists() {
		$normal_tips = '注意：秒杀活动不支持带规格商品！';
		$this->assign ( 'normal_tips', $normal_tips );
		 
		$this -> seckill_id = I('id',0,intval);
		$info = M('seckill')->where(array('id'=>$this->seckill_id))->find();
		$this ->assign('info',$info);
		
		$model = $this->getModel ( 'seckill_goods' );
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据		                                
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		// 搜索条件
		$map = $this->_search_map ( $model, $fields );
		$map['seckill_id'] = $this->seckill_id;
		$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];
		// 读取模型数据列表
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->field ( true )->where ( $map )->order ( $order )->page ( $page, $row )->select ();	
		foreach($data as &$v){
			$v['goods_info'] = D("Addons://Shop/Goods")->getInfo((int)$v['goods_id']);
			if($v['goods_info']['stock_num']<0){
			    $v['goods_info']['stock_num'] =0;
			}
		}	
		/* 查询记录总数 */
		
		$count = M ( $name )->where ( $map )->count ();
		$list_data ['list_data'] = $data;
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}
		
		$this->assign ( $list_data );
		// dump($list_data);
		
		$this->display ('lists');
	}
	
	function save_goods(){
		$goodsArrStr = I('goodsArrStr');
		$id = I('id',0,intval); 
		$goodsArr = json_decode($goodsArrStr,true);
		$model = $this->getModel ( 'seckill_goods' );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		if(count($goodsArr)>0){
			foreach($goodsArr as $data){
				if($data['is_delete']){
					//delete
					$Model->where(array('id'=>$data['id']))->delete();
				}else{
					//save
					$res = $Model->where(array('id'=>$data['id']))->find();
					if($res){
						$Model -> where(array('id'=>$data['id'])) -> save($data);
					}else{
						$Model -> add($data);
					}	
				}
			}
		}
		$this->success ( '保存' . $model ['title'] . '成功！', addons_url('Seckill://Seckill/lists', $this->get_param ) );
	}
}
