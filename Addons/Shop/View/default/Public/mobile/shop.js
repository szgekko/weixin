// JavaScript shop by jacy
$(function(){
	//购物添加数量
	$('.buy_count .add').click(function(){
		var cart_id = $(this).attr('rel');
		var stockNum=$('#stockNum_'+cart_id).text();
		var val = parseInt($(this).siblings('input').val());
		if(val != stockNum){
			$(this).siblings('input').val(val+1);
		}
		updatePriceAndCount();
	})
	$('.buy_count .reduce').click(function(){
		var val = parseInt($(this).siblings('input').val());
		if(val>1){
			$(this).siblings('input').val(val-1);
			updatePriceAndCount();
		}
	})
	$('.buy_count input[type="text"]').keyup(function(){
		if($(this).val()==0){
			$.Dialog.fail("购物数量不能小于1件");
			$(this).val(1);
		}else{
			updatePriceAndCount();
		}
	})
	$('input[name="goods_ids[]"]').change(function(){
		updatePriceAndCount();
	})
	
	//全选的实现
	$(".check_all").click(function(){
		if($('input[name="checkAll"]').prop('checked')==true){
		$('input[name="goods_ids[]"]').prop('checked',true);
		
		}else{
			$('input[name="goods_ids[]"]').prop('checked',false);
		}
		updatePriceAndCount();
	});
	
})
//更新购物车价格和数量
function updatePriceAndCount(){
	var totalCount = 0;
	var totalPrice = 0;
	if($('input[name="goods_ids[]"]:checked').size()==$('input[name="goods_ids[]"]').size()){
		$('input[name="checkAll"]').prop('checked',true);
	}else{
		$('input[name="checkAll"]').prop('checked',false);
	}
	$('input[name="goods_ids[]"]:checked').each(function(index, element) {
		var itemElem = $(this).parents('li');
		var price = parseFloat(itemElem.find('.singlePrice').text());
		var count = parseInt(itemElem.find('input[rel="buyCount"]').val());
		totalCount += count;
		totalPrice += count*price
	});
	totalPrice = Math.round(totalPrice * 100)/100;
	$('#totalCount').text(totalCount);
	$('#totalPrice').text(totalPrice);
}
//提交检查
function checkCartSubmit(){
	if($('input[name="goods_ids[]"]:checked').size()==0){
		$.Dialog.fail("请先选择要购买的商品");
		return false;
	}
	var cartids="";
	var istrue=1;
	$('input[name="goods_ids[]"]:checked').each(function(){
		var cid =  $(this).attr('rel');
		cartids += cid+',';
		var buy_num=parseInt($("#setnum_"+cid).val());
		var snum= parseInt($("#stockNum_"+cid).text());
		
		if(isNaN(buy_num)){
			buy_num=0;
		}
		if(istrue==1 && buy_num <= 0 ){
			istrue=0;
		}else if(istrue==1 &&buy_num >snum ){
			istrue=2;
		}
	});
	if( istrue==0){
		$.Dialog.fail("购物数量不能小于1件");
		return false;
	}else if( istrue==2 ){
		$.Dialog.fail("库存数量不足");
		return false;
	}
	$("input[name='cart_ids']").val(cartids);
}
function confirmGetGoods(url){
	$.Dialog.confirmBox('温馨提示','确认已收货？',{rightCallback:function(){
		$.Dialog.loading();
		$.post(url,function(res){
			 setTimeout(function(){
				 location.reload();	
			},1500);			
	    });
	}});
}
function showSubCate(_this,id){
	$(_this).addClass('cur').parent().siblings().find('a').removeClass('cur');
	$('#cate_'+id).show().siblings().hide();
}
function initDiy(dataConfig){
	var head_data = JSON.parse(decodeURIComponent(dataConfig));
	$('title').text(head_data[0]['params']['title']);
	var app = angular.module('app', []).controller('commonCtrl', function($scope) {
		$scope.activeModules = JSON.parse(decodeURIComponent(dataConfig));
		$scope.headItem = $.extend({},true,$scope.activeModules[0]);
		$scope.activeModules.shift();
		$scope.$on('ngRepeatFinished', function (ngRepeatFinishedEvent) {
			//下面是在table render完成后执行的js
			try{
				if($('.scrollNotice').html()){
					var iRight = 0;
					setInterval(function(){
						$('.scrollNotice').css('right',iRight++);
						if(iRight==$('.scrollNotice').width())iRight= -$('.scrollNotice').width();
					},70);
				}
				$('.banner').each(function(index,ele){
					var conId = $(ele).attr('id');
					$.WeiPHP.initBanner('#'+conId,true,5000,2);
				})
				//
				$('.mutipic_banner').each(function(index,ele){
					var conId = $(ele).attr('id');
					$.WeiPHP.initMutipicBanner('#'+conId,true,5000,$(ele).data('col'));
				})
				$('.mutipic_goods').each(function(index,ele){
					var conId = $(ele).attr('id');
					$.WeiPHP.initMutipicBanner('#'+conId,true,5000,$(ele).attr('data-colGoods'));
				})				
				
			}catch(e){
					
			}
			
		});
		
	});
	app.directive('onFinishRenderFilters', function ($timeout) {
		return {
			restrict: 'A',
			link: function(scope, element, attr) {
				if (scope.$last === true) {
					$timeout(function() {
						scope.$emit('ngRepeatFinished');
					});
				}
			}
		};
	});
	app.filter('to_trusted', ['$sce', function($sce){
        return function(text) {
            return $sce.trustAsHtml(text);
        };
    }]);
	angular.bootstrap(document, ['app']);
	return app;
}