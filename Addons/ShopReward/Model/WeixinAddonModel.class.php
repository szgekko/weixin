<?php
        	
namespace Addons\ShopReward\Model;
use Home\Model\WeixinModel;
        	
/**
 * ShopReward的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'ShopReward' ); // 获取后台插件的配置参数	
		//dump($config);
	}
}
        	