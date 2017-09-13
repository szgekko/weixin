<?php
        	
namespace Addons\Wuguai\Model;
use Home\Model\WeixinModel;
        	
/**
 * Wuguai的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'Wuguai' ); // 获取后台插件的配置参数	
		//dump($config);
	}
}
        	