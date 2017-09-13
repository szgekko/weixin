<?php
        	
namespace Addons\YaoTV\Model;
use Home\Model\WeixinModel;
        	
/**
 * YaoTV的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'YaoTV' ); // 获取后台插件的配置参数	
		//dump($config);

	} 
}
        	