var musicAudio = document.getElementById("musicAudio");
function controlMusic(data){
	if(data.music_state == 1){
		musicAudio.play();
	}else{
		musicAudio.pause();
	}
	if(data.music_size && data.music_size != ""){
		musicAudio.volume=parseInt(data.music_size)/10;
		
	}
}
$(function(){
	//遥控器
	var isWalling = false;
	getStatusAndDo();
	var interval = setInterval(function(){
		getStatusAndDo();
	},3000)
	
	function getStatusAndDo(){
		$.post(getStatusUrl,function(data){
			controlMusic(data);
			if(data.msgwall_state==1){
				//
				if( window.location.href!=showUrl){
					window.location.href = showUrl;
				}else{
					$('#commentPage').show();
					$('#qrcodePage').hide();
					//上屏
					if(!isWalling){
						isWalling = true;
						$.WeiPHP.initDanmu($('#flyCommentBox'),wHeight-80);
					}
				}
			}
			if(data.msgwall_state!=1 && data.wecome_state==1 && window.location.href!=gameIndexUrl){
				//跳到开场 
				window.location.href = gameIndexUrl;
			}
			if(data.game_state==1 && window.location.href!=gameStartUrl){
				//进入游戏
				window.location.href = gameStartUrl;
			}else if(data.game_state==2 && window.location.href!=gameUrl){
				//开始游戏
				$('.prize_wrap').hide();
				$('.start_count_down').show();
				var leftSec = parseInt($('#leftSec').text());
				var tempInter = setInterval(function(){
					leftSec--;
					$.post(setdaojiUrl,{'type':'set','val':leftSec});
					$('#leftSec').text(leftSec);
					if(leftSec==11){
						clearInterval(tempInter);
						window.location.href = gameUrl;
					}
				},1000);
			}else if(data.game_state!=2  && window.location.href == gameUrl){
				//结束游戏
				if(gameOver!='undefined')gameOver();
			}
			if(window.location.href == gameEndUrl){
				if(getGameEndData != 'undefined')getGameEndData(live_id);
				if(data.game_state==1 && window.location.href != gameStartUrl){
					window.location.href = gameStartUrl;
				}
			}
			if(data.playback_state==1 && window.location.href!=gamePlaybackUrl){
				//进入精彩回顾
				window.location.href = gamePlaybackUrl;
			}
			
		});
	}
})