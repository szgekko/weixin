<?php
        	
namespace Addons\Seckill\Model;
use Home\Model\WeixinModel;
        	
/**
 * Seckill的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'Seckill' ); // 获取后台插件的配置参数	
		//dump($config);
		
		//
		$map['token'] = get_token();
		if (! empty ( $keywordArr ['aim_id'] )) {
		    $map ['id'] = $keywordArr ['aim_id'];
		}
		
		$info = M ( 'seckill' )->where ( $map )->order ( 'id desc' )->find ();
		if (! $info) {
		    return false;
		}
		//组装用户在微信里点击图文的时跳转URL
		//其中token和openid这两个参数一定要传，否则程序不知道是哪个微信用户进入了系统
		$param ['id'] = $info ['id'];
		$param ['token'] = get_token ();
		$param ['openid'] = get_openid ();
		$url = addons_url ( 'Seckill://Wap/index', $param );
		
		//组装微信需要的图文数据，格式是固定的
		$articles [0] = array (
		    'Title' => $info ['title'],
		    'Description' => filter_line_tab($info ['content']),
		    'PicUrl' => SITE_URL.'/Addons/Seckill/View/default/Public/cover.jpg',
		    'Url' => $url
		);
		$res = $this->replyNews ( $articles );
		return $res;
	}
}
        	