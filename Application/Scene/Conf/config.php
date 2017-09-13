<?php
return array (
		// 主题设置
		'DEFAULT_THEME' => 'default', // 默认模板主题名称
		                              
		// 预先加载的标签库
		                              // 'TAGLIB_PRE_LOAD' => 'OT\\TagLib\\Article,OT\\TagLib\\Think',
		'TAGLIB_PRE_LOAD' => 'OT\\TagLib\\Think',
		//'URL_ROUTER_ON' => true, // 开启路由
		//'LOAD_EXT_CONFIG' => 'router',
		//'URL_CASE_INSENSITIVE' => true,
		'URL_HTML_SUFFIX' => ".html", // URL伪静态后缀设置
		'URL_DENY_SUFFIX' => C ( 'TOKEN.URL_DENY_SUFFIX' ), // URL禁止访问的后缀设置
		//'URL_MODEL' => 1, // URL伪静态设置/开启，关闭
		// SESSION 和 COOKIE 配置
		// SESSION 和 COOKIE 配置
		'SESSION_PREFIX' => SITE_DIR_NAME . '_home', // session前缀
		'COOKIE_PREFIX' => SITE_DIR_NAME . '_home',
		"URL_MODEL" => 3,
  		"URL_PATHINFO_DEPR" => "/",
		 "DEFAULT_FILTER" => "htmlspecialchars",
		/* 模板相关配置 */
		'TMPL_PARSE_STRING' => array (
				'__UPLOAD__' => __ROOT__ . '/Uploads',
				'__STATIC__' => __ROOT__ . '/Public',
				'__IMG__' => __ROOT__ . '/Public/Home/images',
				'__CSS__' => __ROOT__ . '/Public/Home/css',
				'__JS__' => __ROOT__ . '/Public/Home/js',
				'__PUBLIC__' => __ROOT__ . '/Public/scene'
				 
		) 
)
;