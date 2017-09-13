// JavaScript Document by jacy
// use only for liangzhuang topic
(function(){
	var leiFlag = false;//擂鼓是否开始
	var leiCount = 0;//擂鼓次数
	var thePrizeId = -1;///中奖ID
	var theLeftCount = 0;
	var zpPrize;
	var currentCommentId = 0;
	var noPrizeTip='';
	var hasPrizeTip='';
	var setPrizeLogUrl='';
	var beiLingTip='';
	/* 弹幕 */
	function initDanmu(flyBox){
		queryComment(flyBox,0);
		
		$('.comment_btn').click(function(){
			submitComment(flyBox);
		})
		$('.face_btn').click(function(){
			if($('.face_container').css('display')=='none'){
				$('.face_container').show();
			}else{
				$('.face_container').hide();
			}
		})
		$('.face_container img').tap(function(){
			var src = $(this).attr('src');
				if(src.indexOf('?')!=-1){
					src = src.substring(0,src.indexOf('?'));
				}
			var nameArr = src.split("/");
			name = nameArr[nameArr.length-1].replace('.png','');
			var defaultVal = $('input[name="content"]').val();
			$('input[name="content"]').val(defaultVal+"["+name+"]");
		})
		//下拉加载更多
		/*
		$(window).scroll( function() { 
			if(!isLoading && hasMore){
				if(loadType==0){
					lastId++; 
				}else{
					lastId = $('.'+domClass).last().data('lastid');
				}
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());  
				if ($(document).height() <= totalheight+50){
					queryComment();
				} 
			}else if(hasMore == false){
				$('.noMmore').show();
				$('.moreLoading').hide();
			} 
		})
		*/
	}
	//请求评论
	function queryComment(flyBox,flag){
		var getUrl = flyBox.data('url');
		$.get(getUrl,function(data){
			if(data){
				flyBox.html("");
				if(data.length>0){
					for(var i=0;i<data.length;i++){
							var json = data[i];
							if(currentCommentId==json.id){
								continue;
							}
							var name = json.nickname?json.nickname:"本地用户";
							var content = json.content;
							var time = json.time;
							//content = content.length>30?content.substring(0,30):content;
							var picUrl = json.headimgurl?json.headimgurl:IMG_PATH+"/default_head.png";
							var html = $('<li>'+
											'<div class="c_head"><img src="'+picUrl+'"/><em>&nbsp;</em></div>'+
											'<p>'+
												'<span class="name">'+name+'</span>'+
												'<span class="time">'+time+'</span>'+
												'<span class="comment">'+content+'</span>'+
											'</p>'+
										'</li>');
							flyBox.append(html);
					}	
				}else{
					flyBox.append('<p class="empty_comment">还没有评论，赶紧发一条吧！</p>');
				}		
			}
		})
	}
	/* 提交评论 */
	function submitComment(flyBox){
		var postUrl = $('#commentForm').attr('action');
		var content = $('input[name="content"]').val();
		var aim_id = $('input[name="aim_id"]').val();
		var aim_table = $('input[name="aim_table"]').val();
		var comment_status=$('input[name="comment_status"]').val()|0;
		$('.face_container').hide();
		var postData = {
			content:content,
			aim_id:aim_id,
			aim_table:aim_table
		}
		if(content==""){
			$.Dialog.fail('请填写评论内容！');	
		}else if(content.length>120){
			$.Dialog.fail('评论内容不能超过120个字符！');	
		}else{
			if(window.localStorage && window.localStorage.getItem('TY_lastComment')!=null){
				var lastComment = window.localStorage.getItem('TY_lastComment');
				var lastCommentTime = parseInt(window.localStorage.getItem('TY_lastCommentTime'));
				var min_time = commentConfig&&commentConfig.min_time?commentConfig.min_time:10;
				if(new Date().getTime() - lastCommentTime <1000*min_time){
					$.Dialog.fail('评论过于频繁，请稍候再试！');
					return;
				}
				if(new Date().getTime() - lastCommentTime <1000*60*5 && content==lastComment){
					$.Dialog.fail('请勿重复评论！');
					return;
				}
			}	
			if($('input[name="content"]').hasClass('doing')){
				return;
			}
			$('input[name="content"]').addClass('doing');
			$.Dialog.loading('发表中...');
			$.post(postUrl,postData,function(data){
				//todo
				$('input[name="content"]').removeClass('doing');
				if(data.result=='success'){
					//添加评论到弹幕上面
					currentCommentId = data.id;
					commentContent = data.content;
					setTimeout(function(){
						$.Dialog.close();
					},1000);
					if(comment_status==0){
						var name = currentUserName!=""?currentUserName:"本地用户";
						var picUrl = currentUserHeadPic!=""?currentUserHeadPic:IMG_PATH+"/default_head.png";
						var html = $('<li>'+
										'<div class="c_head"><img src="'+picUrl+'"/><em>&nbsp;</em></div>'+
									   	'<p>'+
											'<span class="name">'+name+'</span>'+
											'<span class="comment">'+commentContent+'</span>'+
										'</p>'+
									'</li>');
						html.prependTo(flyBox);
						flyBox.find('.empty_comment').remove();
					}
					if(window.localStorage){
						window.localStorage.setItem('TY_lastComment',$('input[name="content"]').val());
						window.localStorage.setItem('TY_lastCommentTime',new Date().getTime());
					}	
					$('input[name="content"]').val('');
				}else{
					$.Dialog.close();
					$.Dialog.fail('检测到非法关键词，请修改再发布！');
				}
				
			})
			
			
		}
	}
	
	/* 提交中奖信息 */
	function submitGetPrizeInfo(){
		var name = $('input[name="name"]').val();
		var phone = $('input[name="phone"]').val();
		$('.name_tips').hide();
		$('.phone_tips').hide();
		if(name==""){
			$('.name_tips').html('请填写姓名！').show();
			return;
		}else if(phone=="" || phone.length!=11){
			$('.phone_tips').html('请填写正确的手机号码！').show();
			return;
		}
		$.ajax({
			url:$('#infoForm').attr('action'),
			type:'post',
			data:{name:name,phone:phone,'del_time':zpPrize.del_lottery_time,'prizeid':thePrizeId,'lzwg_id':zpPrize.lzwg_id},
			dataType:'json',
			success: function(data){
				if(data.result=='success'){
					$.Dialog.close();
					if(window.localStorage){
						window.localStorage.setItem('zpPrize','');
					}
					window.location.replace(zpPrize.submitSuccess);
				}else{
					$.Dialog.fail(data.msg);
				}
			}
		})
		
	}
	//刮刮卡
	function checkCanvas(){
		try {
			document.createElement('canvas').getContext('2d');
			return truel
		} catch (e) {
			var addDiv = document.createElement('div');
			return false;
		}

	}
	var u = navigator.userAgent, mobile = 'PC';
	if (u.indexOf('iPhone') > -1) mobile = 'iphone';
	if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) mobile = 'Android';
	function createCanvas(parent, width, height) {
		var canvas = {};
		canvas.node = document.createElement('canvas');
		canvas.context = canvas.node.getContext('2d');
		canvas.node.width = width || 100;
		canvas.node.height = height || 100;
		parent.appendChild(canvas.node);
		return canvas;
	}
	function initGuaGuaKa(container, width, height, fillColor,picUrl,prizeUrl) {
		var type = mobile;
		var canvas = createCanvas(container, width, height);
		var ctx = canvas.context;
		ctx.fillCircle = function (x, y, radius, fillColor) {
			this.fillStyle = fillColor;
			this.beginPath();
			this.moveTo(x, y);
			this.arc(x, y, radius, 0, Math.PI * 2, false);
			this.fill();
		};
		ctx.clearTo = function (isColor,fillColor,picUrl) {
			if(isColor){
				ctx.fillStyle = fillColor;
				ctx.fillRect(0, 0, width, height);
			}else{
				var coverImg = new Image();
				coverImg.src = picUrl;
				coverImg.onload=function(){
					ctx.drawImage(coverImg,0,0,width,height);    
					//	console.log('a');   
				}
			}
		};
		ctx.clearTo(false,fillColor,picUrl);
		canvas.node.addEventListener(mobile == "PC" ? "mousedown" : "touchstart", function (e) {
			e.preventDefault();  
			canvas.isDrawing = true;
		}, false);
		canvas.node.addEventListener(mobile == "PC" ? "mouseup" : "touchend", function (e) {
			e.preventDefault();  
			canvas.isDrawing = false;
			guaguaDone(ctx,width,height);
		
		}, false);
		canvas.node.addEventListener(mobile == "PC" ? "mousemove" : "touchmove", function (e) {
			e.preventDefault();  
			if (!canvas.isDrawing) {
				return;
			}
			if (type == 'Android') {
				var x = e.changedTouches[0].pageX - this.offsetLeft;
				var y = e.changedTouches[0].pageY - this.offsetTop;
			} else {
				var x = e.pageX - this.offsetLeft;
				var y = e.pageY - this.offsetTop;

			}
			var radius = 20;
			var fillColor = '#ff0000';
			ctx.globalCompositeOperation = 'destination-out';
			ctx.fillCircle(x, y, radius, fillColor);
		}, false);
		//加载中奖信息
		$.get(prizeUrl,function(data){
			zpPrize = data;
			$(container).css({'background-image':'url('+zpPrize.img+') '});
			if(data.id){
				thePrizeId = data.id;
			}
			theLeftCount = parseInt(zpPrize.mycount);
			if(theLeftCount!=0){
				theLeftCount=theLeftCount-1;
			}
			noPrizeTip=zpPrize.noprizetip;
			hasPrizeTip=zpPrize.hasprizetip;
			setPrizeLogUrl=zpPrize.setPrizeLog;
		})
	}
	function guaguaDone(ctx,width,height){
		var data=ctx.getImageData(0,0,width,height).data;
		for(var i=0,j=0;i<data.length;i+=4){
			if(data[i] && data[i+1] && data[i+2] && data[i+3]){
				j++;
			}
		}
		//console.log(j+"=="+(width*height*0.6))
		if(j<(width*height*0.6)){
			$.get(setPrizeLogUrl);
			if(thePrizeId>0){
				 $.ajax({
						url:zpPrize.saveLuckFollow,
						type:'post',
						data:{'del_time':zpPrize.del_lottery_time,'prizeid':thePrizeId,'lzwg_id':zpPrize.lzwg_id},
						dataType:'json',
						success: function(data){
							if(data.result=='success'){
								if(window.localStorage){
									window.localStorage.setItem('zpPrize','');
								}
								openZhongjiangDialog();
							}else{
								beiLingTip=data.msg;
								openWeizhongDialog();
							}
						}				
					})
				
			}else{
				openWeizhongDialog();
			}
		}
		
	}
	function openZhongjiangDialog(){
		if(theLeftCount==0){
			var html = $('<div class="lz_dialog zhong_dialog"><img  class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
					'<span class="line"></span>'+
					'<img class="prize_pic" src="'+zpPrize.img +'"/>'+
					'<p class="prize_title">'+hasPrizeTip+'<span class="prize_name">'+zpPrize.name+'</span>一份</p>'+
					'<a class="red_btn" id="getBtn" href="javascript:;"><em class="l"></em>直接领奖<em class="r"></em></a>'+
					'<a class="red_btn red_btn2" id="surveyPrizeBtn" href="javascript:;"><em class="l"></em>参加调查并领奖<em class="r"></em></a>'+
					'<p class="tips">您今天的刮奖次数已用完，明天再来拿大奖吧！</p>'+
					'<p class="to_survey">参与<a id="surveyBtn" href="javascript:;">问卷调查</a>可获得更多抽奖机会</p>'+
				'</div><img class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		}else{
			var html = $('<div class="lz_dialog zhong_dialog"><img  class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
						'<span class="line"></span>'+
						'<img class="prize_pic" src="'+zpPrize.img +'"/>'+
						'<p class="prize_title">'+hasPrizeTip+'<br/><span class="prize_name">'+zpPrize.name+'</span>一份</p>'+
						'<a class="red_btn" id="getBtn" href="javascript:;"><em class="l"></em>直接领奖<em class="r"></em></a>'+
						'<a class="red_btn red_btn2" id="surveyPrizeBtn" href="javascript:;"><em class="l"></em>参加调查并领奖<em class="r"></em></a>'+
						'<p class="tips" style="color:#f384b5">你还有<span class="left_count">'+theLeftCount+'</span>次抽奖机会,<a href="javascript:;" onClick="window.location.reload();" style="font-size:16px; color:#e71873">继续抽奖！</a></p>'+
						'<p class="to_survey">参与<a id="surveyBtn" href="javascript:;">问卷调查</a>可获得更多抽奖机会</p>'+
					'</div><img class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		}
		$('#getBtn',html).click(function(){
			openWriteInfoDialog();
		});
		$('#surveyPrizeBtn',html).click(function(){
			window.location.replace(zpPrize.surveyUrl+"&fromPrize=1");
			if(window.localStorage){
				window.localStorage.setItem('zpPrize',JSON.stringify(zpPrize));
			}
		})
		$('#surveyBtn',html).click(function(){
			window.location.replace(zpPrize.surveyUrl);
			if(window.localStorage){
				window.localStorage.setItem('zpPrize','');
			}
		})
		$.Dialog.open(html);
	}
	function openWriteInfoDialog(from){
		if(from=="1" && window.localStorage ){
			var zpPirzeStr = window.localStorage.getItem('zpPrize');
			if(!zpPirzeStr){
				zpPirzeStr="";
			}
			if(zpPirzeStr!=""){
				zpPrize = JSON.parse(zpPirzeStr);//JSON.stringify() 
				thePrizeId = zpPrize.id;
				
			}else{
				$.Dialog.fail('你已经领取奖品');
				return;
			}
			//console.log(zpPrize)
		}
		if(zpPrize.hasfollowinfo){
//			 $.ajax({
//				url:zpPrize.saveLuckFollow,
//				type:'post',
//				data:{'del_time':zpPrize.del_lottery_time,'prizeid':thePrizeId,'lzwg_id':zpPrize.lzwg_id},
//				dataType:'json',
//				success: function(data){
//					if(data.result=='success'){
//						//$.Dialog.close();
//						if(window.localStorage){
//							window.localStorage.setItem('zpPrize','');
//						}
//						window.location.replace(zpPrize.submitSuccess);
//					}else{
//						$.Dialog.fail(data.msg);
//					}
//				}				
//			})
			window.location.replace(zpPrize.submitSuccess);
			return;
		}
		var html = $('<div class="lz_dialog zhong_dialog"><img  class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
						'<span class="line"></span>'+
						'<img class="prize_pic" src="'+zpPrize.img +'"/>'+
						'<p class="prize_title">'+hasPrizeTip+'<span class="prize_name">'+zpPrize.name+'</span>一份</p>'+
						'<p class="tips"><br/>请填写你的信息领取奖品</p>'+
						'<form id="infoForm" action="'+zpPrize.setFollow+'">'+
							'<div class="label">姓名<input type="text" name="name"/><p class="name_tips"></p></div>'+
							
							'<div class="label">手机<input type="text" name="phone"/><p class="phone_tips"></p></div>'+
						'</form>'+
						'<a class="red_btn"><em class="l"></em>提交<em class="r"></em></a>'+
					'<p><br/>【请认真填写姓名、电话，<br/>靓妆客服将联系您确认并安排配送】</p></div><img  class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		$('.red_btn',html).click(function(){
			submitGetPrizeInfo();
		})
		$.Dialog.open(html);
	}
	function openWeizhongDialog(){
		if(beiLingTip!=''&&theLeftCount==0){
			var html = $('<div class="lz_dialog weizhong_dialog"><img class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
					'<h6>'+beiLingTip+'</h6>'+
					'<p class="tips">您今天的刮奖次数已用完，明天再来拿大奖吧！</p>'+
					'<a class="red_btn" href="javascript:;"><em class="l"></em>继续抽奖<em class="r"></em></a>'+
					'<p class="to_survey"><a id="surveyBtn" href="javascript:;">参与调查</a>领取优惠券</p>'+
				'</div><img class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		}else if(beiLingTip!=''&&theLeftCount!=0){
			var html = $('<div class="lz_dialog weizhong_dialog"><img class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
					'<h6>'+beiLingTip+'</h6>'+
					'<p class="tips">别灰心，你还有<span class="left_count">'+theLeftCount+'</span>次机会</p>'+
					'<a class="red_btn" href="javascript:;"><em class="l"></em>继续抽奖<em class="r"></em></a>'+
					'<p class="to_survey"><a id="surveyBtn" href="javascript:;">参与调查</a>领取优惠券</p>'+
				'</div><img class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		}else if(beiLingTip==''&&theLeftCount==0){
			var html = $('<div class="lz_dialog weizhong_dialog"><img class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
					'<h6>'+noPrizeTip+'</h6>'+
					'<p class="tips">您今天的刮奖次数已用完，明天再来拿大奖吧！</p>'+
					'<a class="red_btn" href="javascript:;"><em class="l"></em>继续抽奖<em class="r"></em></a>'+
					'<p class="to_survey"><a id="surveyBtn" href="javascript:;">参与调查</a>领取优惠券</p>'+
				'</div><img class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		}else{
			var html = $('<div class="lz_dialog weizhong_dialog"><img class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
					'<h6>'+noPrizeTip+'</h6>'+
					'<p class="tips">别灰心，你还有<span class="left_count">'+theLeftCount+'</span>次机会</p>'+
					'<a class="red_btn" href="javascript:;"><em class="l"></em>继续抽奖<em class="r"></em></a>'+
					'<p class="to_survey"><a id="surveyBtn" href="javascript:;">参与调查</a>领取优惠券</p>'+
				'</div><img class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		}
		
		
		$('.red_btn',html).click(function(){
			window.location.reload();
		})
		$('#surveyBtn',html).click(function(){
			window.location.replace(zpPrize.surveyUrl+"&fromPrize=0");
			if(window.localStorage){
				window.localStorage.setItem('zpPrize','');
			}
		})
		$.Dialog.open(html);
	}
	
	
	function showModifyDialog(updateUrl){
		var phone = $('.u_info .phone').text();
		var html = $('<div class="lz_dialog zhong_dialog"><img  class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
						'<span class="line"></span>'+
						'<p class="tips">修改个人信息<br/></p>'+
						'<form action="'+updateUrl+'">'+
							'<div class="label">姓名<input type="text" name="name" value="'+$('.u_info .truename').text()+'"/><p class="name_tips"></p></div>'+
							
							'<div class="label">手机<input type="text" name="phone" value="'+phone+'"/><p class="phone_tips"></p></div>'+
						'</form>'+
						'<a id="submit" class="red_btn"><em class="l"></em>提交<em class="r"></em></a>'+
						'<a id="closeBtn" class="red_btn"><em class="l"></em>返回<em class="r"></em></a>'+
					'<p><br/>【请认真填写姓名、电话，<br/>靓妆客服将联系您确认并安排配送】</p></div><img  class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
		$('#submit',html).click(function(){
			var name = $('input[name="name"]',html).val();
			var phone = $('input[name="phone"]',html).val();
			$('.name_tips').hide();
			$('.phone_tips').hide();
			if(name==""){
				$('.name_tips').html('请填写姓名！').show();
				return;
			}else if(phone=="" || phone.length!=11){
				$('.phone_tips').html('请填写正确的手机号码！').show();
				return;
			}
			$.ajax({
				url:$('form').attr('action'),
				type:'post',
				data:{name:name,phone:phone},
				dataType:'json',
				success: function(data){
					if(data.result=='success'){
						$.Dialog.success(data.msg);
						$('.u_info .phone').html(phone)
						$('.u_info .truename').html(name)
					}else{
						$.Dialog.fail(data.msg);
					}
				}
			})
		})
		$('#closeBtn',html).click(function(){
			$.Dialog.close();
		})
		$.Dialog.open(html);
	}
	
	function initVote(){
		$('.survey_item').click(function(){
			if(!$(this).hasClass('checked')){
				var limitCount = parseInt($('#voteForm').data('limit'));
				if(limitCount>0 && $('#voteForm .checked').size()>=limitCount){
					$.Dialog.fail('最多只能选择'+limitCount+'项!');
					return false;
				}
			}
			
			if($(this).hasClass('radio_item')){
				if($(this).hasClass('checked')){
					return;
				}else{
					$(this).addClass('checked').siblings().removeClass('checked');
					$(this).find('input').prop('checked',true);
				}

			}else{
				
				if($(this).hasClass('checked')){
					$(this).removeClass('checked');
					$(this).find('input').prop('checked',false);
				}else{
					$(this).addClass('checked');
					$(this).find('input').prop('checked',true);
				}
			}
			
		});
		$('#submitVoteBtn').click(function(){
			if($('#voteForm .checked').size()==0){
				$.Dialog.fail('请投票!');
				return false;
			}
			var isfollowinfo=$("input[name='hasfollowinfo']").val();
//			alert(isfollowinfo);
			
			if(isfollowinfo==0){
				var setFollowUrl=$("input[name='setFollow']").val();
				//填写用户信息
				showVoteFollowDialog(setFollowUrl);
			}else{
				$.Dialog.loading();
				$.post($('#voteForm').attr('action'),$('#voteForm').serializeArray(),function(data){
					//alert(data);
					if(data.result=='success'){
						window.location.replace(data.url);
					}
				})
				return false;
			}
		});
		$('#getPrizeBtn').tap(function(){
			//$('#voteForm').attr('action',$(this).attr('href')).submit();
			openWriteInfoDialog(1);
		})
	}
	function showVoteFollowDialog(setFollowUrl){
		var html = $('<div class="lz_dialog zhong_dialog"><img  class="top" src="'+STATIC_PATH+'/lzwg/dialog_bg_top.png"/><div class="lz_dialog_content">'+
				'<span class="line"></span>'+
				'<p class="tips">恭喜您 获得一份优惠券，请填写资料已便于我们发放<br/></p>'+
				'<form id="voteInfoForm" action="'+setFollowUrl+'">'+
					'<div class="label">姓名<input type="text" name="name"/><p class="name_tips"></p></div>'+
					
					'<div class="label">手机<input type="text" name="phone" /><p class="phone_tips"></p></div>'+
				'</form>'+
				'<a class="red_btn"><em class="l"></em>提交<em class="r"></em></a>'+
			'<p><br/>【请认真填写姓名、电话，<br/>靓妆客服将联系您确认并安排配送】</p></div><img  class="bottom" src="'+STATIC_PATH+'/lzwg/dialog_bg_bottom.png"/></div>');
			
			$('.red_btn',html).click(function(){
				var name = $('input[name="name"]').val();
				var phone = $('input[name="phone"]').val();
				$('.name_tips').hide();
				$('.phone_tips').hide();
				if(name==""){
					$('.name_tips').html('请填写姓名！').show();
					return;
				}else if(phone=="" || phone.length!=11){
					$('.phone_tips').html('请填写正确的手机号码！').show();
					return;
				}
				$.ajax({
					url:$('#voteInfoForm').attr('action'),
					type:'post',
					data:{name:name,phone:phone},
					dataType:'json',
					success: function(data){
						if(data.result=='success'){
							$.Dialog.close();
							$.Dialog.loading();
							$.post($('#voteForm').attr('action'),$('#voteForm').serializeArray(),function(data){
								//alert(data);
								if(data.result=='success'){
									window.location.replace(data.url);
								}
							})
							return false;
						}else{
							$.Dialog.fail(data.msg);
							return false;
						}
					}
				})
			})
			$.Dialog.open(html);
	}
	
	var liangzhuang = {
			initDanmu:initDanmu,
			submitComment:submitComment,
			submitGetPrizeInfo:submitGetPrizeInfo,
			openWriteInfoDialog:openWriteInfoDialog,
			showModifyDialog:showModifyDialog,
			initGuaGuaKa:initGuaGuaKa,
			initVote:initVote
		}
	$.extend($,{lz:liangzhuang});
	
})();