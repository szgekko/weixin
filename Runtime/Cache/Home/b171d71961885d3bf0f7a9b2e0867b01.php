<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<meta content="<?php echo C('WEB_SITE_KEYWORD');?>" name="keywords"/>
<meta content="<?php echo C('WEB_SITE_DESCRIPTION');?>" name="description"/>
<link rel="shortcut icon" href="<?php echo SITE_URL;?>/favicon.ico">
<title><?php echo empty($page_title) ? C('WEB_SITE_TITLE') : $page_title; ?></title>
<link href="/Public/static/font-awesome/css/font-awesome.min.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<link href="/Public/Home/css/base.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<link href="/Public/Home/css/module.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<link href="/Public/Home/css/weiphp.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<link href="/Public/static/emoji.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/Public/static/bootstrap/js/html5shiv.js?v=<?php echo SITE_VERSION;?>"></script>
<![endif]-->

<!--[if lt IE 9]>
<script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="/Public/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/Public/static/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/Public/static/zclip/ZeroClipboard.min.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/Home/js/dialog.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/Home/js/admin_common.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/Home/js/admin_image.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/static/masonry/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="/Public/static/jquery.dragsort-0.5.2.min.js"></script> 
<script type="text/javascript">
var  IMG_PATH = "/Public/Home/images";
var  STATIC = "/Public/static";
var  ROOT = "";
var  UPLOAD_PICTURE = "<?php echo U('home/File/uploadPicture',array('session_id'=>session_id()));?>";
var  UPLOAD_FILE = "<?php echo U('File/upload',array('session_id'=>session_id()));?>";
var  UPLOAD_DIALOG_URL = "<?php echo U('home/File/uploadDialog',array('session_id'=>session_id()));?>";
</script>
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>

</head>
<body id="login_body">
	
	<!-- 主体 -->
	
<script type="text/javascript" src="/Public/static/qrcode/qrcode.js"></script>
<script type="text/javascript" src="/Public/static/qrcode/jquery.qrcode.js"></script>
<style type="text/css">
h3{ font-size:24px; text-align:center; line-height:100px; color:#999; font-weight:normal}
.func li{ overflow:hidden; zoom:1; font-size:18px; line-height:40px; color:#444;}
.func li.l img{ float:left;}
.func li.l .desc{ float:left; margin-left:50px; width:500px; padding:70px 0;}
.func li.r img{ float:right; margin-right:90px;}
.func li.r .desc{ float:left; margin-left:190px; width:280px; padding:70px 0;}
.func li.r .desc img,.func li.l .desc img{  margin-right:6px; float:none; vertical-align:middle}
table{ background:#eee;}
table td{ background:#fff; padding:15px 10px; color:#666; text-align:center}
table tr td:first-child{ background:#cefbf0; padding:15px 10px; color:#09C; font-weight:bold;}
table th{ background:#cefbf0; padding:15px 10px;}
.buy_btn{ display:block; margin:30px auto; width:200px; height:50px; border-radius:5px; line-height:50px; background:#090; color:#fff; text-align:center; font-size:16px;}
.buy_btn:hover{ color:#fff; background:#0fb50b}

/* fixed */
.main-im { position: fixed; left: 10px; bottom: 20px; z-index: 100; width: 110px; height: 282px; }
.main-im .qq-a { display: block; width: 106px; height: 116px; font-size: 14px; color: #0484cd; text-align: center; position: relative; }
.main-im .qq-a span { bottom: 5px; position: absolute; width: 90px; left: 10px; }
.main-im .qq-hover-c { width: 70px; height: 70px; border-radius: 35px; position: absolute; left: 18px; top: 10px; overflow: hidden; z-index: 9; }
.main-im .qq-container { z-index: 99; position: absolute; width: 109px; height: 118px; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom: 1px solid #dddddd; background: url(/Public/Home/images/about/img/float/qq-icon-bg.png) no-repeat center 8px; margin-bottom:20px; }
.main-im .img-qq { max-width: 60px; display: block; position: absolute; left: 6px; top: 3px; -moz-transition: all 0.5s; -webkit-transition: all 0.5s; -o-transition: all 0.5s; transition: all 0.5s; }
.main-im .im-qq:hover .img-qq { max-width: 70px; left: 1px; top: 8px; position: absolute; }
.main-im .im_main { background: #F9FAFB; border: 1px solid #dddddd; border-radius: 10px; background: #F9FAFB; }
.main-im .im_main .im-tel { color: #000000; text-align: center; width: 109px; height: 45px; padding:5px 0; border-bottom: none; }
.main-im .im_main .im-tel .tel-num { font-family: Arial; font-weight: bold; color: #e66d15; padding-top: 6px; }
.main-im .im_main .im-tel:hover { background: #fafafa; }
.main-im .close-im { position: absolute; right: 10px; top: -12px; z-index: 100; width: 24px; height: 24px; }
.main-im .close-im a { display: block; width: 24px; height: 24px; background: url(/Public/Home/images/about/img/float/close_im.png) no-repeat left top; }
.main-im .close-im a:hover { text-decoration: none; }
.main-im .im-title { background: #e76322; padding: 5px; }
.main-im .qrcode{ text-align:center; font-size:12px;}
</style>
<!-- 头部 -->
<div class="login_header">
	
    <div class="log_wrap">
        <a href="/" title="WeiPHP商城"><img class="logo" src="/Public/Home/images/logo.png"/></a>
        
        <div class="nav_r">
            第一次使用WeiPHP商城？<a href="<?php echo U('User/register');?>">立即注册</a>
        </div>
        
    </div>
    
</div>
<!-- 介绍 -->

    	<div class="top_content">
        	<div class="log_wrap">
            	<div class="top_content_r">
                	<img src="/Public/Home/images/about/img/login_pic.png?20150723"/>
                </div>
            	<section class="login_box">
                  <form class="login-form" action="/index.php?s=/home/user/login/from/3.html" method="post">
                          <div class="form_body" id="input_login" style="display:<?php if(C('SCAN_LOGIN')) echo 'none'; ?> ">
                                <h6>欢迎使用WeiPHP!</h6>
                                <div class="input_panel">
                                  <div class="control-group">
                                    <label class="control-label" for="inputEmail">用户名</label>
                                    <div class="controls">
                                      <span class="fa fa-user"></span>
                                      <input type="text" id="inputEmail" class="span3" placeholder="请输入用户名"  ajaxurl="/user/checkUserNameUnique.html" errormsg="请填写1-16位用户名" nullmsg="请填写用户名" datatype="*1-16" value="" name="username">
										
                                    </div>
                                  </div>
                                  <div class="control-group">
                                    <label class="control-label" for="inputPassword">密码</label>
                                    <div class="controls">
                                      <span class="fa fa-key"></span>
                                      <input type="password" id="inputPassword"  class="span3" placeholder="请输入密码"  errormsg="密码为6-20位" nullmsg="请填写密码" datatype="*6-20" name="password">
                                    </div>
                                  </div>
                                  <?php if(C('WEB_SITE_VERIFY')) { ?>
                                  <div class="control-group">
                                    <label class="control-label" for="inputPassword">验证码</label>
                                    <div class="controls">
                                       <span class="fa fa-keyboard-o"></span>
                                      <input type="text" id="verify" class="span3" placeholder="请输入验证码"  errormsg="请填写5位验证码" nullmsg="请填写验证码" datatype="*5-5" name="verify">
                                      <a href="javascript:;" class="reloadverify_a">换一张?</a>
                                    </div>
                                  </div>
                                  
                                  <?php } ?>
                               </div>
                              <?php if(C('WEB_SITE_VERIFY')) { ?>
                              
                              <div class="control-group">
                                <label class="control-label"></label>
                                <div class="controls" style="margin-top:10px">
                                    <img class="verifyimg reloadverify" alt="点击切换" src="<?php echo U('verify');?>" style="cursor:pointer;">
                                </div>
                              </div>
                              <?php } ?>
                              <div class="controls Validform_checktip text-warning"></div>
                              <div class="control-group">
                                <div class="controls">
                                 <input type="checkbox" id="checkbox"/><label for="checkbox">自动登录</label>
                                </div>
                                <div class="controls">
                                  <button type="submit" class="btn btn-large">登 录</button>
                                 </div>
                                 <?php if(C('USER_ALLOW_REGISTER')) { ?>
                                 <div class="controls">
                                 还没账号?
                                 </div>
                                 <div class="controls">
                                  <a style="width:280px;" class="btn border-btn-main btn-large" href="<?php echo U('User/register');?>">立 即 注 册</a>
                                 </div>
                                 <?php } ?>
                              </div>
                          </div>
                          <?php if(C('SCAN_LOGIN')) { ?>
                          <div class="form_body" id='scan_login'>
                                <h6>请用微信扫码登录</h6>
                                <div class="input_panel">
                      <div id="qrCode"><img src="<?php echo ($qrcode); ?>" /></div>
                      <p class="qr_time_tips">如未关注公众号，先关注即可登录</p>
                               </div>
                               <div class="o_p"><a href="javascript:void(0)" onclick="$('#input_login').show();$('#scan_login').hide();">原注册用户登录入口</a></div>
                              </div>
                          <?php } ?>
                       </form> 
                </section>
            </div>
        </div>
        
    	

	<!-- /主体 -->

	<!-- 底部 -->
	<div class="wrap bottom" style="background:none">
    <p class="copyright">本系统由<a href="http://weiphp.cn" target="_blank">WeiPHP</a>强力驱动</p>
</div>
<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https'){
   bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
  }
  else{
  bp.src = 'http://push.zhanzhang.baidu.com/push.js';
  }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>


	<!-- /底部 -->
    
	<script type="text/javascript">       
    	$(document)		   
	    	.ajaxStart(function(){
	    		$("button:submit").addClass("log-in").attr("disabled", true);
	    	})
	    	.ajaxStop(function(){
	    		$("button:submit").removeClass("log-in").attr("disabled", false);
	    	});


    	$("form").submit(function(){
    		var self = $(this);
    		$.post(self.attr("action"), self.serialize(), success, "json");
    		return false;

    		function success(data){
    			if(data.status){
    				window.location.href = data.url;
    			} else {
    				self.find(".Validform_checktip").text(data.info);
    				//刷新验证码
    				$(".reloadverify").click();
    			}
    		}
    	});

		$(function(){
			var verifyimg = $(".verifyimg").attr("src");
            $(".reloadverify,.reloadverify_a").click(function(){
                if( verifyimg.indexOf('?')>0){
                    $(".verifyimg").attr("src", verifyimg+'&random='+Math.random());
                }else{
                    $(".verifyimg").attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());
                }
            });
			$('input').focus(function(){
				$(this).parent().find('.fa').css('color','#44b549');
				})
			$('input').blur(function(){
				$(this).parent().find('.fa').css('color','#aaa');
				})
		});
	setInterval(function(){
		$.post("<?php echo U('login');?>",{},function(res){
			if(res==1){
				window.location.href = "<?php echo U('home/index/main');?>";
			}
		});
	},3000);	
	$('#login_body').height($(window).height());	
	</script>

</body>
</html>