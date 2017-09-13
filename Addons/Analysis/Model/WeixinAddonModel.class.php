<?php
        	
namespace Addons\Analysis\Model;
use Home\Model\WeixinModel;
        	
/**
 * Analysis的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'Analysis' ); // 获取后台插件的配置参数	
		//dump($config);

	} 
}
        	