<?php

namespace Addons\ShopCoupon\Controller;

use Home\Controller\AddonsController;

class SnController extends AddonsController {
	var $table = 'sn_code';
	var $addon = 'ShopCoupon';
	function _initialize() {
		parent::_initialize ();
		
		$param ['type'] = 0;
		$res ['title'] = '所有的代金券';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = '';
		$nav [] = $res;
		
		$param ['type'] = 1;
		$res ['title'] = '未开始';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = '';
		$nav [] = $res;
		
		$param ['type'] = 2;
		$res ['title'] = '进行中';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = '';
		$nav [] = $res;
		
		$param ['type'] = 3;
		$res ['title'] = '已结束';
		$res ['url'] = addons_url ( 'ShopCoupon://ShopCoupon/lists', $param );
		$res ['class'] = '';
		$nav [] = $res;
		
		$res ['title'] = '领取记录';
		$res ['url'] = '#';
		$res ['class'] = 'current';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
	}
	function lists() {
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'search_button', false );
		$this->assign ( 'check_all', false );
		
		$top_more_button [] = array (
				'title' => '导出数据',
				'url' => U ( 'export', array (
						'target_id' => I ( 'target_id' ) 
				) ) 
		);
		$this->assign ( 'top_more_button', $top_more_button );
		
		$model = $this->getModel ( $this->table );
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		unset ( $list_data ['list_grids'] [2] );
		$grids = $list_data ['list_grids'];
		$fields = $list_data ['fields'];
		
		// 搜索条件
		$map ['addon'] = $this->addon;
		$map ['target_id'] = I ( 'target_id' );
		$map ['token'] = get_token ();
		session ( 'common_condition', $map );
		$map = $this->_search_map ( $model, $fields );
		
		$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];
		
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->field ( true )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		
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
		
		$this->display ();
	}
	function export() {
		$model = $this->getModel ( 'sn_code' );
		
		// 搜索条件
		$map ['addon'] = $this->addon;
		$map ['target_id'] = I ( 'target_id' );
		$map ['token'] = get_token ();
		session ( 'common_condition', $map );
		
		parent::common_export ( $model );
	}
	function del() {
		$model = $this->getModel (  'sn_code' );
		parent::del ( $model );
	}
	function set_use() {
		$id = I ( 'id' );
		$dao = D ( 'Common/SnCode' );
		$data = $dao->getInfoById ( $id );
		$res =  $dao->set_use ( $id );
		if ($res==-1) {
			$this->error ( '数据不存在' );
		}elseif ($res) {
			$map ['is_use'] = 1;
			$map ['target_id'] = $data ['target_id'];
			$map ['addon'] = 'ShopCoupon';
			$save ['use_count'] = intval ( D ( 'Common/SnCode' )->where ( $map )->count () );
			D ( 'ShopCoupon' )->update ( $data ['target_id'], $save );
			$this->success ( '设置成功' );
		} else {
			$this->error ( '设置失败' );
		}
	}
}
