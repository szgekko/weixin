//点赞
function addDigg(id, addUrl, delUrl) {
	if (mid > 0) {
		var span = $('#digg' + id);
		var data = {
			id : id
		};
		$.post(addUrl, data, function(result) {
			if (result == 1) {
				var num = parseInt(span.attr('rel')) + 1;
				span.attr('rel', num).html(
						'<a href="javascript:;" class="iszan" onclick="delDigg('
								+ id + ',\'' + addUrl + '\',\'' + delUrl
								+ '\')"><i class="zan">' + num + '</i></a>');
			} else {
				$.ui.showMask("点赞失败，请稍候再试！", true);
			}
		}, 'json');
	} else {
		$.ui.showMask("请先登录", true);
	}
}
// 取消点赞
function delDigg(id, addUrl, delUrl) {
	var span = $('#digg' + id);
	var data = {
		id : id
	};
	$.post(delUrl, data, function(result) {
		if (result == 1) {
			var num = parseInt(span.attr('rel')) - 1;
			var zan = num > 0 ? num : '0';
			span.attr('rel', num).html(
					'<a href="javascript:;" onclick="addDigg(' + id + ',\''
							+ addUrl + '\',\'' + delUrl
							+ '\')"><i class="zan">' + zan + '</i></a>');
		} else {
			$.ui.showMask("取消失败，请稍候再试！", true);
		}
	}, 'json');
}
 //订单管理
  function orders(){
     var feed_id = $(this).attr('rel');
      var joinHtml = $('<div class="join_event_dialog">'+
      '<form class="join_form">'+
        '<a class="close" href="javascript:;"></a>'+
        '<p class="title">订单管理</p>'+
        '<div class="orders_tab weui_cells_radio">'+
                  '<label class="weui_cell weui_check_label" for="youji">'+
                      '<div class="weui_cell_hd">'+
                          '<input type="radio" name="orders" class="weui_check" id="youji" checked="checked">'+
                          '<span class="weui_icon_radio"></span>'+
                      '</div>'+
                      '<div class="weui_cell_bd weui_cell_primary">'+
                          '<p>已寄出</p>'+
                      '</div>'+
                  '</label>'+
                  '<label class="weui_cell weui_check_label" for="ziti">'+
                      '<div class="weui_cell_hd">'+
                          '<input type="radio" name="orders" class="weui_check" id="ziti">'+
                          '<span class="weui_icon_radio"></span>'+
                      '</div>'+
                      '<div class="weui_cell_bd weui_cell_primary">'+
                          '<p>已自提/已配送</p>'+
                      '</div>'+
                  '</label>'+
         '</div>'+
        '<div class="form_row oders_youji"><p>快递单号<em>*</em></p><div class="row"><input type="text" name="kuaidu" value=""/></div></div>'+
        '<div class="form_row oders_ziti"><p>是否确认&nbsp;已自提/已配送<em>*</em></p></div>'+
        '<input type="hidden" name="event_id" value=""/>'+
        '<a class="btn-big" id="submitJoinBtn" href="javascript:;">提交</a>'+
      '</form>'+
      '</div>');
      $('body').append(joinHtml);
      $('.join_event_dialog').height($('#layout').height()+50); 
      var dialogTop = $(window).scrollTop()+($('body').height()-$('.join_event_dialog .join_form').height()-32)/2;
      if($('.join_event_dialog .join_form').height()>=$(window).height()){
        dialogTop = 0;
        $('body').css('min-height',$('.join_event_dialog .join_form').height())
      }
      $('.join_event_dialog .join_form').css('top',dialogTop);
      $('#ziti',joinHtml).click(function(){
			$('.oders_ziti').show()
			$('.oders_youji').hide()
		})
		$('#youji',joinHtml).click(function(){
			$('.oders_ziti').hide()
			$('.oders_youji').show()
		})
      $('.close',joinHtml).click(function(){
        joinHtml.remove();
      })
      $('#submitJoinBtn',joinHtml).click(function(){
        var kuaidu = $('input[name="kuaidu"]',joinHtml).val();

        if(kuaidu==''){
           $.ui.showMask("请填写快递单号！", true);
           return;
        }

     })
    }
$(function(){
// 购买商品
$('.goods_btn').click(function() {
					var rel = $(this).attr('rel').split(','); // {$feed.id},{$feed.price},{$feed.is_store},{$feed.is_home},{$myinfo.truename},{$myinfo.mobile},{$myinfo.address}
					var feed_id = rel[0];
					var price = parseFloat(rel[1]);
					var is_store = rel[2];
					var is_home = rel[3];
					var number =1;
					var post_url = $(this).attr('post_url');
					var goodsHtml = '<div class="join_event_dialog">'
							+ '<form class="join_form">'
							+ '<a class="close" href="javascript:;"></a>'
							+ '<p class="title">我要购买</p>'
							+ '<div class="goods_tab weui_cells_radio"><div class="row">';
					if (is_home && is_store) {
						goodsHtml += '<label class="weui_cell weui_check_label" for="youji">'+
					                      '<div class="weui_cell_hd">'+
					                         '<input type="radio" name="orders" class="weui_check" id="youji" checked="checked">'+
					                          '<span class="weui_icon_radio"></span>'+
					                      '</div>'+
					                      '<div class="weui_cell_bd weui_cell_primary">'+
					                          '<p>送货上门</p>'+
					                      '</div>'+
					                  '</label>'+
					                  '<label class="weui_cell weui_check_label" for="ziti">'+
					                      '<div class="weui_cell_hd">'+
					                          '<input type="radio" name="orders" class="weui_check" id="ziti">'+
					                          '<span class="weui_icon_radio"></span>'+
					                      '</div>'+
					                      '<div class="weui_cell_bd weui_cell_primary">'+
					                          '<p>到店自提</p>'+
					                      '</div>'+
					                 '</label>'+
					                '</div>';
					}
					if (is_home) {
						goodsHtml += '<div class="form_row goods_address"><p>详细地址<em>*</em></p><div class="row"><input type="text" name="address" value="' + rel[6] + '"/></div></div>';
					}
					if (is_store) {
						goodsHtml += '<div class="form_row dianpu_address"><p>店铺地址<em>*</em></p><div class="row"><p>广东省深圳市龙岗区坂田街道</p></div></div>';
					}
					goodsHtml += '<div class="form_row"><p>真实姓名<em>*</em></p><div class="row"><input type="text" name="truename" value="'
							+ rel[4]
							+ '" /></div></div>'
							+ '<div class="form_row"><p>手机<em>*</em></p><div class="row"><input type="text" name="mobile" value="'
							+ rel[5]
							+ '"/></div></div>'
							+ '<div class="form_row"><p>购买数量<em>*</em></p><div class="buy_count"><a class="reduce" href="javascript:;">-</a><input type="number" name="num" value="1" /><a class="add" href="javascript:;">+</a></div> * '
							+ price
							+ ' = <span id="total_price">'
							+ price
							+ '</span>元</div>'
							+ '<a class="btn-big" id="submitJoinBtn" href="javascript:;">支付</a>'
							+ '</form>' + '</div>';
					goodsHtml = $(goodsHtml);
					if (is_home)$('.dianpu_address',goodsHtml).hide();
					$('body').append(goodsHtml);
					$('.join_event_dialog').height($('#layout').height() + 50);
					var dialogTop = $(window).scrollTop()
							+ ($('body').height()
									- $('.join_event_dialog .join_form')
											.height() - 32) / 2;
					if ($('.join_event_dialog .join_form').height() >= $(window)
							.height()) {
						dialogTop = 0;
						$('body').css('min-height',
								$('.join_event_dialog .join_form').height())
					}
					$('.join_event_dialog .join_form').css('top', dialogTop);
					$('.close', goodsHtml).click(function() {
						goodsHtml.remove();
					})
					$('#ziti',goodsHtml).click(function(){
						$('.goods_address').hide()
						$('.dianpu_address').show()
					})
					$('#youji',goodsHtml).click(function(){
						$('.goods_address').show()
						$('.dianpu_address').hide()
					})
					//购买数量+
					$('.add',goodsHtml).click(function(){
						number++
						$('.buy_count input',goodsHtml).val(number)
						$('#total_price', goodsHtml).html(Math.floor(number*price*100)/100);
					});
					//购买数量-
					$('.reduce',goodsHtml).click(function(){			
						number--
						if(number<1)number=1
						$('.buy_count input',goodsHtml).val(number)
						$('#total_price', goodsHtml).html(Math.floor(number*price*100)/100);
					});
					$('input[name="num"]', goodsHtml).bind("propertychange input",function(){
						var num = parseInt($(this).val());
						$('#total_price', goodsHtml).html(Math.floor(num*price*100)/100);
					})
					$('#submitJoinBtn', goodsHtml).click(
							function() {
								var send_type = $('input[name="send_type"]',
										goodsHtml).val();
								var address = $('input[name="address"]',
										goodsHtml).val();
								var truename = $('input[name="truename"]',
										goodsHtml).val();
								var mobile = $('input[name="mobile"]',
										goodsHtml).val();
								var num = parseInt($('input[name="num"]',
										goodsHtml).val());
								if (truename == '') {
									$.ui.showMask("请填写姓名！", true);
									return;
								}
								if (!(num > 0)) {
									$.ui.showMask("购买数量不能少于1哦", true);
									return;
								}
								if (mobile == '') {
									$.ui.showMask("请填写手机！", true);
									return;
								}
								$.post(post_url, {
									feed_id : feed_id,
									send_type : send_type,
									address : address,
									truename : truename,
									mobile : mobile,
									num : num
								}, function(res) {
									if (res.status == 1) {
										goodsHtml.remove();
										window.location.href = res.url;
									} else {
										$.ui.showMask(res.info, true);
									}
								});
							})
	});

//TAB切换效果
$('#list_tab a').click(function(){
  $(this).addClass('cur').siblings().removeClass('cur');
  var index = $(this).index();
  $('.list_detail_warp div[class*="_detail"]').eq(index).addClass('am_tab').siblings().removeClass('am_tab');
});


});