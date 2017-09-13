<?php
        	
namespace Addons\WeMedia\Model;
use Home\Model\WeixinModel;
        	
/**
 * WeMedia的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'WeMedia' ); // 获取后台插件的配置参数	
		//dump($config);
	}
}
        	