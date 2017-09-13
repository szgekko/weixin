<?php

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class BaseController extends AddonsController {
	var $shop_id;
	function _initialize() {
		parent::_initialize ();
		// 获取当前登录的用户的商城
		$map ['token'] = get_token ();
// 		$map ['manager_id'] = $this->mid;
		//企业用户
		$this->shop_id = 0;
		$currentShopInfo = M ( 'shop' )->where ( $map )->find ();
		if ($currentShopInfo) {
			$this->shop_id = $currentShopInfo ['id'];
		}elseif ((_ACTION != 'summary' && _ACTION != 'add') || (_CONTROLLER=='Goods' && _ACTION == 'add') ) {
			redirect ( addons_url ( 'Shop://Shop/summary',$this->get_param ) );
			
		}
		
		$controller = strtolower ( _CONTROLLER );
		
		$res ['title'] = '商店管理';
		$res ['url'] = addons_url ( 'Shop://Shop/lists',$this->get_param );
		$res ['class'] = ($controller == 'shop' && _ACTION == "lists") ? 'current' : '';
		$nav [0] = $res;
		
		$nav = array ();
		$this->assign ( 'nav', $nav );
		
		define ( 'CUSTOM_TEMPLATE_PATH', ONETHINK_ADDON_PATH . 'Shop/View/default/Wap/Template' );
	}
}
