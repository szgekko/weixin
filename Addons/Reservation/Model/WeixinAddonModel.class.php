<?php
        	
namespace Addons\Reservation\Model;
use Home\Model\WeixinModel;
        	
/**
 * Reservation的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'Reservation' ); // 获取后台插件的配置参数	
		//dump($config);

	} 

	// 关注公众号事件
	public function subscribe($dataArr) {
		return true;
	}
	
	// 取消关注公众号事件
	public function unsubscribe($dataArr) {
		return true;
	}
	
	// 扫描带参数二维码事件
	public function scan($dataArr) {
		return true;
	}
	
	// 上报地理位置事件
	public function location($dataArr) {
		return true;
	}
	
	// 自定义菜单事件
	public function click($dataArr) {
		return true;
	}	
}
        	