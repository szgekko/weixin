// JavaScript Document by jacy
// use only for liangzhuang topic
(function(){
	var currentCommentId = 0;
	function initComment(flyBox){
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
		
		$(window).scroll( function() { 
			if(!isLoading && hasMore){
				if(loadType==0){
					lastId++; 
				}else{
					lastId = $('.'+domClass).last().data('lastid');
				}
				totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());  
				if ($(document).height() <= totalheight+50){
					queryComment(flyBox,1);
				} 
			}else if(hasMore == false){
				$('.noMmore').show();
				$('.moreLoading').hide();
			} 
		})
		
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
										'<div class="c_head"><img src="'+picUrl+'"/></div>'+
									   	'<p>'+
											'<span class="name">'+name+'</span>'+
											'<span class="time">刚刚</span>'+
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
	
	
	
	var comment = {
			initComment:initComment,
			submitComment:submitComment,
		}
	$.extend($,{comment:comment});
	
})();