<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title><?php echo empty($page_title) ? C('WEB_SITE_TITLE') : $page_title; ?></title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
    <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="0" http-equiv="expires">
    <meta content="telephone=no, address=no" name="format-detection">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <link rel="stylesheet" type="text/css" href="/Public/Home/css/mobile_module.css?v=<?php echo SITE_VERSION;?>" media="all">
    <script type="text/javascript">
		//静态变量
		var SITE_URL = "<?php echo SITE_URL;?>";
		var IMG_PATH = "/Public/Home/images";
		var STATIC_PATH = "/Public/static";
		var WX_APPID = "<?php echo ($jsapiParams["appId"]); ?>";
		var	WXJS_TIMESTAMP='<?php echo ($jsapiParams["timestamp"]); ?>'; 
		var NONCESTR= '<?php echo ($jsapiParams["nonceStr"]); ?>'; 
		var SIGNATURE= '<?php echo ($jsapiParams["signature"]); ?>';
	</script>
    <script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="minify.php?f=/Public/Home/js/prefixfree.min.js,/Public/Home/js/m/dialog.js,/Public/Home/js/m/flipsnap.min.js,/Public/Home/js/m/mobile_module.js&v=<?php echo SITE_VERSION;?>"></script>
</head>
<link href="<?php echo ADDON_PUBLIC_PATH;?>/mobile/common.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
<link href="<?php echo ADDON_PUBLIC_PATH;?>/mobile/diy_page.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
<script src="/Public/static/angular.min.js"></script>
<script src="<?php echo ADDON_PUBLIC_PATH;?>/mobile/shop.js"></script>
<body class="withFoot" ng-controller="commonCtrl">
    <div class="container">
    	<div class="center_header">
    		<?php if(!empty($follow["headimgurl"])): ?><img src="<?php echo ($follow["headimgurl"]); ?>"/>
    		<?php else: ?>
        	<img src="<?php echo ADDON_PUBLIC_PATH;?>/mobile/center.png"/><?php endif; ?>
           <?php if(!empty($follow["nickname"])): echo ($follow["nickname"]); ?>
    		<?php else: ?>
        	本地用户<?php endif; ?>
        	<?php if(!empty($level)): ?><span style="margin-left: 20px;color: dimgray;">( <?php echo ($level); ?> 级分销用户， 可获得 <?php echo ($profit_percent); ?> 提成比例 )</span><?php endif; ?>
        </div>		
        <div class="center_nav">
        	<a href="<?php echo ($ordersUrl); ?>">全部订单</a>
            <a href="<?php echo ($unPayUrl); ?>">待付款</a>
            <a href="<?php echo U('shippingOrder');?>">配送中</a>
        </div>
        <div class="block">
        	<a class="block_a" href="<?php echo addons_url('ShopCoupon://Wap/personal');?>&use=1"><i class="icon_coupon"></i>我的代金券<em class="arrow_right">&nbsp;</em></a>
            <a class="block_a" href="<?php echo ($cartUrl); ?>"><i class="icon_car"></i>我的购物车<em class="arrow_right">&nbsp;</em></a>
            <a class="block_a" href="<?php echo ($collectUrl); ?>"><i class="icon_favorite"></i>我的收藏<em class="arrow_right">&nbsp;</em></a>
            <!--<a class="block_a" href="#">我的浏览器记录<em class="arrow_right">&nbsp;</em></a>-->
            <?php if(!empty($myShopUrl)): if(($myShopUrl) == "check_audit"): ?><a class="block_a" href="javascript:;" onclick="wait_audit('<?php echo ($audit_msg); ?>');"><i class="icon_fenxiao"></i>我的分销中心<em class="arrow_right">&nbsp;</em></a>
            	<?php else: ?>
            		<a class="block_a" href="<?php echo ($myShopUrl); ?>"><i class="icon_fenxiao"></i>我的分销中心<em class="arrow_right">&nbsp;</em></a><?php endif; endif; ?>
            <a class="block_a" href="<?php echo ($addressUrl); ?>"><i class="icon_area"></i>我的收货地址<em class="arrow_right">&nbsp;</em></a>
            <a class="block_a block_last" href="<?php echo U('myPJ');?>"><i class="icon_comment"></i>我的评价<em class="arrow_right">&nbsp;</em></a>
        </div>
        <div class="diy_container" ng-style="{'background-color':headItem.params.bgColor}">
             <div ng-if="module['id'] && !module['disable']" id="module-{{module.index}}" name="{{module.id}}" index="{{module.index}}" ng-class="{'modules-actions': activeItem.index == module.index, 'js-sorttable' : !module.issystem,'edit_panel':true}" ng-repeat="module in activeModules" on-finish-render-filters>
                <div ng-init="displayPanel = ('widget-'+(module['id'].toLowerCase())+'-display.html')" ng-include="displayPanel"></div>
            </div>
        </div>	
        <script type="text/ng-template" id="widget-header-display.html">
	<div class="titlebar">{{module.params.title}}</div>
</script>
<script type="text/ng-template" id="widget-richtext-display.html">
	<div class="diy_richtext" ng-style="{'background-color':module.params.bgColor,'color':module.params.color,'font-size':module.params.fontsize+'px','text-align':module.params.align}" ng-bind-html="module.params.content|to_trusted"></div>
</script>
<script type="text/ng-template" id="widget-goods-display.html">
	<div class="goods_list"  ng-switch="module.params.list_style">
<ul class="big_list" ng-switch-when="1">
    <li ng-repeat="m in module.params.goods_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.img" src="{{m.img}}"/>
        	<p class="title">{{m.title}}</p>
            <p class="price" ng-show="module.params.show_price">￥{{m.market_price}}</p>
            <span class="btn" ng-show="module.params.show_btn">立即购买</span>
        </a>
    </li>
</ul>
<ul class="small_list" ng-switch-when="2">
    <li ng-repeat="m in module.params.goods_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.img" src="{{m.img}}"/>
            <div class="info">
            <p class="title">{{m.title}}</p>
            <p class="price" ng-show="module.params.show_price">￥{{m.market_price}}</p>
            <p class="btn_p" ng-show="module.params.show_btn"><span class="btn">立即购买</span></p>
            </div>
    	</a>
    </li>
</ul>
<ul class="list_1_2" ng-switch-when="3">
    <li ng-repeat="m in module.params.goods_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.img" src="{{m.img}}"/>
            <div class="info">
            <p class="title">{{m.title}}</p>
            <p class="price" ng-show="module.params.show_price">￥{{m.market_price}}</p>
            <p class="btn_p" ng-show="module.params.show_btn"><span class="btn">立即购买</span></p>
            </div>
    	</a>
    </li>
</ul>
<ul class="common_list" ng-switch-when="4">
    <li ng-repeat="m in module.params.goods_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.img" src="{{m.img}}"/>
            <p class="title">{{m.title}}</p>
            <p class="price" ng-show="module.params.show_price">￥{{m.market_price}}</p>
            <span class="btn" ng-show="module.params.show_btn">立即购买</span>
    	</a>
    </li>
</ul>
</div>
</script>
<script type="text/ng-template" id="widget-mutipic_goods-display.html">
  
<section class="mutipic_goods" data-colGoods="{{module.params.colGoods}}" id="mutipic_goods{{module.index}}" ng-show="module.params.goods_list.length">
<ul>
    <li ng-repeat="m in module.params.goods_list track by $index" on-finish-render-filters>
    	<a href="{{m.url}}">
        	<img ng-if="m.img" src="{{m.img}}"/>
        	<p class="title">{{m.title}}</p>
            <p class="price" ng-show="module.params.show_price">￥{{m.market_price}}</p>
            <span class="btn" ng-show="module.params.show_btn">立即购买</span>
        </a>
    </li>
</ul>
    <span class="mutipic_banner_identify" style="left:auto;top:0;right:0;">
        <span  class="pointer">
        </span>       
    </span>
</section>

</script>
<script type="text/ng-template" id="widget-banner-display.html">
	<div class="default_div" ng-show="!module.params.banner_list.length">请添加幻灯片图片</div>
<section class="banner" ng-show="module.params.banner_list.length" id="banner{{module.index}}">
    <ul>
    	<li ng-repeat="b in module.params.banner_list" on-finish-render-filters>
<!--             <a href="{{b.url}}"><img src="{{b.pic}}"/></a> -->
            <a href="{{b.url}}"><img src="{{b.pic}}"/></a>
                    
            <span ng-show="module.params.show_title" class="title">{{b.title}}</span>
        </li>
    </ul>
    <span class="identify">
        <span ng-show="module.params.show_cursor" class="pointer">
			<em ng-repeat="b in module.params.banner_list"></em>
        </span>       
    </span>
</section>
</script>
<script type="text/ng-template" id="widget-mutipic_banner-display.html">
	<div class="default_div" ng-show="!module.params.banner_list.length">请幻灯片图片</div>
<section class="mutipic_banner" data-col="{{module.params.col}}" id="mutipic_banner_{{module.index}}" ng-show="module.params.banner_list.length">
    <ul>
    	<li ng-repeat="b in module.params.banner_list track by $index" on-finish-render-filters>
            <a href="{{b.url}}"><img src="{{b.pic}}"/></a>
            <span ng-show="module.params.show_title" class="title">{{b.title}}</span>
        </li>
    </ul>
    <span class="mutipic_banner_identify">
        <span ng-show="module.params.show_cursor" class="pointer">
        </span>       
    </span>
</section>
</script>
<script type="text/ng-template" id="widget-piclist-display.html">
	<div class="pic_list"  ng-switch="module.params.list_style">
<div class="default_div" ng-show="!module.params.pic_list.length">请添加图片</div>
<ul class="one_colum_list" ng-switch-when="1">
    <li ng-repeat="m in module.params.pic_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
        	<p class="title" ng-show="module.params.show_title">{{m.title}}</p>
        </a>
    </li>
</ul>
<ul class="two_colum_list" ng-switch-when="2">
    <li ng-repeat="m in module.params.pic_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
<ul class="three_colum_list" ng-switch-when="3">
    <li ng-repeat="m in module.params.pic_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
<ul class="four_colum_list" ng-switch-when="4">
    <li ng-repeat="m in module.params.pic_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
</div>
</script>
<script type="text/ng-template" id="widget-blank-display.html">
	<div class="blank_div" ng-style="{'height':module.params.height}"></div>
  </script>
 <script type="text/ng-template" id="widget-title-display.html">
	<div class="diy_title" ng-style="{'background-color':module.params.bgColor}">
	<p class="title" ng-style="{'color':module.params.maincolor,'text-align':module.params.align}">{{module.params.title}}</p>
    <p class="subtitle" ng-style="{'color':module.params.subcolor,'text-align':module.params.align}">{{module.params.subtitle}}</p>
</div>
  </script>
  <script type="text/ng-template" id="widget-textnav-display.html">
	<div class="text_nav_list" ng-switch="module.params.text_nav_style">
<div class="default_div" ng-show="!module.params.text_nav_list.length">请添加导航</div>
<ul ng-switch-when="1">
    <li ng-repeat="m in module.params.text_nav_list">
    	<a href="{{m.url}}" ng-style="{'background-color':module.params.bgColor}">
        	<p class="title" ng-style="{'color':module.params.color}">{{m.title}}</p>
            <em></em>
        </a>
    </li>
</ul>
<ul class="two_text_nav_list" ng-switch-when="2">
    <li ng-repeat="m in module.params.text_nav_list">
    	<a href="{{m.url}}" ng-style="{'background-color':module.params.bgColor}">
        	<p class="title" ng-style="{'color':module.params.color}">{{m.title}}</p>
        </a>
    </li>
</ul>
<ul class="three_text_nav_list" ng-switch-when="3">
    <li ng-repeat="m in module.params.text_nav_list">
    	<a href="{{m.url}}" ng-style="{'background-color':module.params.bgColor}">
        	<p class="title" ng-style="{'color':module.params.color}">{{m.title}}</p>
        </a>
    </li>
</ul>
<ul class="four_text_nav_list" ng-switch-when="4">
    <li ng-repeat="m in module.params.text_nav_list">
    	<a href="{{m.url}}" ng-style="{'background-color':module.params.bgColor}">
        	<p class="title" ng-style="{'color':module.params.color}">{{m.title}}</p>
        </a>
    </li>
</ul>
</div>
  </script>
   <script type="text/ng-template" id="widget-picnav-display.html">
	<div class="pic_nav_list"  ng-switch="module.params.nav_style">
<div class="default_div" ng-show="!module.params.pic_nav_list.length">请添加导航</div>
<ul class="two_nav_list" ng-switch-when="2">
    <li ng-repeat="m in module.params.pic_nav_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
<ul class="three_nav_list" ng-switch-when="3">
    <li ng-repeat="m in module.params.pic_nav_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
<ul class="four_nav_list" ng-switch-when="4">
    <li ng-repeat="m in module.params.pic_nav_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
</div>
  </script>
  <script type="text/ng-template" id="widget-searchgoods-display.html">
	<div class="diy_search_goods">
	<form action="<?php echo addons_url('Shop://Wap/lists',array('shop_id'=>$shop_id));?>" target="_blank" method="post">
        <input type="text" name="search_key" value="" placeholder="请输入关键词搜索商品"/>
        <button type="sbumit"></button>
    </form>
</div>
  </script>
  <script type="text/ng-template" id="widget-blankline-display.html">
	<div class="blank_line_div" ng-style="{'border-color':module.params.borderColor,'border-style':module.params.borderStyle,'border-bottom-width':module.params.borderWidth+'px'}"></div>
  </script>
  <script type="text/ng-template" id="widget-case-display.html">
	<div class="case_box">
<p class="case_title">{{module.params.title}}</p>
<div  ng-switch="module.params.style">
<ul class="case_default_list" ng-switch-when="2">
    <li ng-repeat="m in module.params.pic_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
<ul class="case_three_list" ng-switch-when="3">
    <li ng-repeat="m in module.params.pic_list">
    	<a href="{{m.url}}">
        	<img ng-if="m.pic" src="{{m.pic}}"/>
            <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
    	</a>
    </li>
</ul>
</div>
<p class="case_content_title">{{module.params.contentTitle}}</p>
<div class="case_content">{{module.params.content}}</div>
</div>
  </script>
  <script type="text/ng-template" id="widget-case2-display.html">
  <div class="case_box2">
<p class="case_title">{{module.params.title}}</p>
<div  ng-switch="module.params.style">
    <div  ng-switch-when="2">
        <div  ng-switch="module.params.position">
            <ul class="case_default_list2" ng-switch-when="1">
                <li ng-repeat="m in module.params.pic_list">
                	<a href="{{m.url}}">
                    	<img ng-if="m.pic" src="{{m.pic}}"/>
                        <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
                	</a>
                </li>
            </ul>
            <ul class="case_default_list2" ng-switch-when="2">
                <li ng-repeat="m in module.params.pic_list" style="float: right">
                    <a href="{{m.url}}">
                        <img ng-if="m.pic" src="{{m.pic}}"/>
                        <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div  ng-switch-when="3">
        <div  ng-switch="module.params.position">
            <ul class="case_three_list2" ng-switch-when="1">
                <li ng-repeat="m in module.params.pic_list_3">
                	<a href="{{m.url}}">
                    	<img ng-if="m.pic" src="{{m.pic}}"/>
                        <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
                	</a>
                </li>
            </ul>
            <ul class="case_three_list2" ng-switch-when="2">
                <li ng-repeat="m in module.params.pic_list_3" style="float:right">
                    <a href="{{m.url}}">
                        <img ng-if="m.pic" src="{{m.pic}}"/>
                        <p class="title" ng-show="module.params.show_title">{{m.title}}</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<p class="case_content_title">{{module.params.contentTitle}}</p>
<div class="case_content">{{module.params.content}}</div>
</div>
  </script>
  <script type="text/ng-template" id="widget-notice-display.html">
	<div class="diy_notice">
	<div class="notice_box" ng-style="{'background-color':module.params.bgColor,'color':module.params.color}">
    	<div class="scrollNotice">
        	<span class="js-scroll-notice" ng-bind-html="module.params.notice_content|to_trusted"></span>
        </div>
    </div>
</div>
  </script>
  <script type="text/ng-template" id="widget-usercenter-display.html">
	<div class="shot_div">
	<img src="/Public/Home/images/user_center_shot.png"/>
</div>
  </script>
  <script type="text/ng-template" id="widget-goodsdetail-display.html">
	<div class="shot_div">
	<img src="/Public/Home/images/goods_detail_shot.png"/>
</div>
  </script>
<script type="text/ng-template" id="widget-fixedmodule-display.html">
	<div class="fixed_module">
	<h6>{{module.params.title}}</h6>
    <p>{{module.params.desc}}</p>
</div>
</script>
		<script type="text/javascript">
        var dataConfig = '<?php echo ($diyData[config]); ?>';
        if(dataConfig!=""){
            initDiy(dataConfig);
        }
        function wait_audit(msg){
        	$.Dialog.confirm('提示',msg);
        }
        
        </script>
    </div>	
    <!-- 底部导航 -->
    <div class="bottom_menu"> 
<a class="home" href="<?php echo ($indexurl); ?>">首页</a> 
<a class="category" href="<?php echo U('lists', array('shop_id'=>$shop_id));?>">全部商品</a> 
<a class="cart" href="<?php echo U('cart', array('shop_id'=>$shop_id));?>">购物车<span class="count"><?php echo ($cart_count); ?></span></a> 
<a class="center" href="<?php echo U('user_center', array('shop_id'=>$shop_id));?>">个人中心</a> 
<a class="service" href="javascript:;">联系客服</a> 
</div>
<p class="copyright"><?php echo ($system_copy_right); echo ($tongji_code); ?></p>
<div id="mask_bg"></div>
<div class="service_tips">
<!-- 	<h3>这是一个标题</h3> -->
	<span>X</span>
	<p><?php echo ($kefu); ?></p>
</div>
<script type="text/javascript">
//分享
$.WeiPHP.initWxShare({
	title:'<?php echo ($shop["title"]); ?>',
	desc:'<?php echo ($shop_share); ?>',
	link:"<?php echo ($indexurl); ?>",
	imgUrl:'<?php echo ($shop["logo"]); ?>'
});
//实现滚动条无法滚动
var moveStop=function(e){e.preventDefault();};
/***禁止滑动***/
function m_stop(){    
        document.addEventListener("touchmove",moveStop,false);//禁止页面滑动
}
/***取消滑动限制***/
function m_move(){
        document.removeEventListener("touchmove",moveStop,false);        
}
	$('.service').click(function(){
		$('#mask_bg,.service_tips').show();
		$('html').addClass('mask_overf')
		m_stop()
	})
	$('.service_tips span,#mask_bg').click(function(){
		$('#mask_bg,.service_tips').hide();
		$('html').removeClass('mask_overf')	
		m_move()
	})
</script>

</body>
</html>