<?php
        	
namespace Addons\MiniLive\Model;
use Home\Model\WeixinModel;
        	
/**
 * MiniLive的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'MiniLive' ); // 获取后台插件的配置参数	
		//dump($config);
		$con=strtolower($dataArr['Content']);
		$openid = $dataArr ['FromUserName'];
		$uid=get_uid_by_openid(true,$openid);
		$liveInfo=$keywordArr;
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveInfo['id']);
		$shakeCount=$monitor['shake_count']+1;
		$isup=D('Addons://MiniLive/MiniLive')->isUpUser(0,$liveInfo['id'],-1,$openid);
		if ($isup == 2){
		    //加入黑名单
		    $this->replyText ('您的账号暂无法参加活动');
		    return true;
		}
		$text = '';
		$is_pic= D('Addons://MiniLive/MiniLive')->get_pic($openid,$liveInfo['id']);
		
// 		$userAttend= D('Addons://MiniLive/MiniShake')->get_user_attend($liveInfo['id'],$liveInfo['shake_id'],$shakeCount,$uid);
		$userAttend= D('Addons://MiniLive/MiniShake')-> getUserShake($liveInfo['id'],$liveInfo['shake_id'],$shakeCount,$uid);
		if (empty($userAttend)){
			$addUA['token']=get_token();
			$addUA['live_id']=$liveInfo['id'];
			$addUA['shake_count']=$shakeCount;
			$addUA['uid']=$uid;
			$addUA['join_count']=0;
			$addUA['shake_id']=$liveInfo['shake_id'];
			M('shake_user_attend')->add($addUA);
			$key='MiniShake_getUserShake_'.$liveInfo['id'].'_'.$liveInfo['shake_id'].'_'.$shakeCount.'_'.$uid;
			S($key,null);
		}
		switch ($con){
		    case 'up':
		    	if ($isup == 0){
		    		D('Addons://MiniLive/MiniLive')->isUpUser(0,$liveInfo['id'],1,$openid);
		    	}
		    	
		        if ($monitor['msgwall_state']==1){
		            $text= D('Addons://MiniLive/MiniLive')->_str_rand();
		            $text.=$liveInfo['up_push'];
		        }else if($monitor['game_state']==1){
		        	$url1=addons_url( 'MiniLive://Wap/shake',array('token'=>get_token(),'live_id'=>$liveInfo['id']));
		            if ($liveInfo['game_msg_title']){
		            	$articles [0] = array (
		            			'Title' => $liveInfo['game_msg_title'],
		            			'Description' => $liveInfo['game_msg_intro'],
		            			'PicUrl' => get_cover_url($liveInfo['game_msg_img']),
		            			'Url' =>$url1
		            	);
		            	$res = $this->replyNews ( $articles );
		            }else{
		            	$text = "游戏在即将开始，<a href='{$url1}'>马上点击参与 >></a>";
		            }
		            return true;
		        }else if($monitor['playback_state']==1){
		        	if ($liveInfo['review_msg_title'] ){
		        		$articles [0] = array (
		        				'Title' => $liveInfo['review_msg_title'],
		        				'Description' => $liveInfo['review_msg_intro'],
		        		);
		        		$res = $this->replyNews ( $articles );
		        	}else {
		        		$text='精彩回放中';
		        	}
		            return true;
		        }else if($monitor['game_state']==2){
		        	$url1=addons_url( 'MiniLive://Wap/shake',array('token'=>get_token(),'live_id'=>$liveInfo['id']));
		        	if ($liveInfo['game_msg_title']){
		        		$articles [0] = array (
		        				'Title' => $liveInfo['game_msg_title'],
		        				'Description' => $liveInfo['game_msg_intro'],
		        				'PicUrl' => get_cover_url($liveInfo['game_msg_img']),
		        				'Url' =>$url1
		        		);
		        		$res = $this->replyNews ( $articles );
		        	}else{
		        		 $text = "游戏在进行中，<a href='{$url1}'>马上点击参与 >></a>";
		        	}
		        }else {
		            $text ='上墙还没开始或已结束！';
		        }
		        break;
		    case 'down':
		        $res1=D('Addons://MiniLive/MiniLive')->isUpUser(0,$liveInfo['id'],0,$openid);
		        if ($res1 == 0){
		            $text='您已切换到正常模式！' ;
		        }
		        break;
		    case 'ykq':
		        $url=addons_url('MiniLive://Wap/ykq',array('live_id'=>$liveInfo['id'],'token'=>get_token()));
		        $text ="<a href='{$url}'>摇控器</a>";
		        break;
		    case 'pic':
		        //上传图片
		        $save['is_pic']=1;
		        D('Addons://MiniLive/MiniLive')->get_pic($openid,$liveInfo['id'],$save);
		        $text='正在切换到上传图片模式，请输入密码：' ;
		        break;
		    default:
		        //获取上传图片状态
		        if ($is_pic == 1 && $dataArr["MsgType"] == "text"){
		            if ($dataArr['Content'] == $liveInfo['pic_pwd']){
		                $save['is_pic']=2;
		                $res2=D('Addons://MiniLive/MiniLive')->get_pic($openid,$liveInfo['id'],$save);
		                $res2 && $text='密码正确，请上传图片！';
		            }else {
		                $save['is_pic']=0;
		                $res2=D('Addons://MiniLive/MiniLive')->get_pic($openid,$liveInfo['id'],$save);
		                $text='密码错误！如果要切换到图片上传模式，请重新发送pic（不区分大小写）';
		            }
		           break;
		        }else if($is_pic == 2 && $dataArr["MsgType"] == "image" ){
		            //上传相册图片
		            $picData['openid']=$openid;
		            $picData['pic_url']=$dataArr['PicUrl'];
		            $picData['cTime']=time();
		            $picData['live_id']=$liveInfo['id'];
		            $picData['media_id']=$dataArr['MediaId'];
		            $picData['shake_count']=$shakeCount;
		            $res2=M('mini_live_pic')->add($picData);
		            if ($res2){
		            	$text='您好，文件已收到...';
		            }else{
		            	$text='上传失败';
		            }
		            break;
		        }  
		       
		        if ($isup == 1){
		            //摇一摇游戏轮数
		            if ($monitor['msgwall_state']==1){
		                
		                $msgwall=D('Addons://MiniLive/MiniMsgwall')->getInfo($liveInfo['msgwall_id']);
		                //每人上墙次数
		                $number=$msgwall['number'];
		                //每人上墙频率
		                $frequency=$msgwall['frequency']/1000;
		                $contentData=D('Addons://MiniLive/MiniMsgwall')->get_content($openid,$liveInfo['id'],$liveInfo['msgwall_id'],$shakeCount);
		                
		                $sec=NOW_TIME - $contentData[0]['cTime'];
		                if ($sec > $frequency){
		                    if ($number == 0 || count($contentData) < $number){
		                        //可发
		                        $savedata['cTime']=time();
		                        if ($dataArr['Content']){
		                            D('Addons://MiniLive/MiniMsgwall')-> add_content($dataArr['Content'],$openid,$liveInfo['id'],$liveInfo['msgwall_id'],$shakeCount);
		                             
		                            $rep["{userName}"]=get_username($uid);
		                            $text=strtr($liveInfo['success_push'], $rep);
		                            if ($text == ''){
		                                $text='上墙成功';
		                            }
		                        }else{
		                            $text='上墙失败！';
		                        }
		                       
		                    }else{
		                        $text ='上墙次数用完';
		                    }
		                }else{
		                    $text ='太频繁了，休息一下再来！' ;
		                }
		            }else if ($monitor['game_state'] == 1) {
		            	$url1=addons_url( 'MiniLive://Wap/shake',array('token'=>get_token(),'live_id'=>$liveInfo['id']));
		            	if ($liveInfo['game_msg_title']){
		            		$articles [0] = array (
		            				'Title' => $liveInfo['game_msg_title'],
		            				'Description' => $liveInfo['game_msg_intro'],
		            				'PicUrl' => get_cover_url($liveInfo['game_msg_img']),
		            				'Url' =>$url1
		            		);
		            		$res = $this->replyNews ( $articles );
		            	}else{
		            		$text = "游戏在即将开始，<a href='{$url1}'>马上点击参与 >></a>";
		            	}
                    } else if ($monitor['game_state'] == 2) {
                       
                    $url1=addons_url( 'MiniLive://Wap/shake',array('token'=>get_token(),'live_id'=>$liveInfo['id']));
		            	if ($liveInfo['game_msg_title']){
		            		$articles [0] = array (
		            				'Title' => $liveInfo['game_msg_title'],
		            				'Description' => $liveInfo['game_msg_intro'],
		            				'PicUrl' => get_cover_url($liveInfo['game_msg_img']),
		            				'Url' =>$url1
		            		);
		            		$res = $this->replyNews ( $articles );
		            	}else{
		            		 $text = "游戏在进行中，<a href='{$url1}'>马上点击参与 >></a>";
		            	}
                    }else if($monitor['is_speech'] == 1 ){
                        //是否可以发表获奖感言
                        $shakeCount--;
                       
						$prizeMap['live_id']=$liveInfo['id'];
						$prizeMap['shake_id']=$liveInfo['shake_id'];
						$prizeMap['uid']=$uid;
						$prizeMap['shake_count']=$shakeCount;
						$prizeInfo=M('shake_prize_user')->where($prizeMap)->find();
						if ($prizeInfo){
							$prizeContent=D('Addons://MiniLive/MiniShake')->send_prize_content($liveInfo['id'],$uid,$shakeCount);
							if ($prizeContent){
								$save['cTime']=time();
								$save['content']=$dataArr['Content'];
								$map['uid']=$uid;
								$map['live_id']=$liveInfo['id'];
								$res3=M('shake_prize_content')->where($map)->save($save);
								if ($res3){
									$prizeContent['cTime']=$save['cTime'];
									$prizeContent['content']=$save['content'];
									$shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
									D('Addons://MiniLive/MiniShake')->send_prize_content($liveInfo['id'],$uid,$shakeCount,true,$prizeContent);
									$prizeDetail=D('Addons://MiniLive/MiniShake')->getPrize($prizeInfo['award_id']);
									$exp["{priNum}"]='第'.$prizeInfo['ranking'].'名';
									$exp["{priLevel}"]=$prizeDetail['prize_level'];
									$exp["{prizeName}"]=$prizeDetail['name'];
									$text=strtr($shakeInfo['prize_message'], $exp);
									if (empty($text)){
										$text='发送获奖感言成功！';
									}
// 									$text.='<a href="'. addons_url('MiniLive://Wap/get_prize',array('id'=>$prizeContent['prize_id'],'token'=>get_token())).'">点击查看奖品</a>';
							
								}
							
							}else{
								$addContent['token']=get_token();
								$addContent['uid']=$uid;
								$addContent['cTime']=time();
								$addContent['content']=$dataArr['Content'];
								$addContent['live_id']=$liveInfo['id'];
								$addContent['prize_id']=$prizeInfo['id'];
								$addContent['shake_count']=$shakeCount;
								$res3=M('shake_prize_content')->add($addContent);
								if ($res3){
									$shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
									$prizeDetail=D('Addons://MiniLive/MiniShake')->getPrize($prizeInfo['award_id']);
									$exp["{priNum}"]='第'.$prizeInfo['ranking'].'名';
									$exp["{priLevel}"]=$prizeDetail['prize_level'];
									$exp["{prizeName}"]=$prizeDetail['name'];
									$text=strtr($shakeInfo['prize_message'], $exp);
									if (empty($text)){
										$text='发送获奖感言成功！';
									}
// 									$text.='<a href="'. addons_url('MiniLive://Wap/get_prize',array('id'=>$prizeContent['prize_id'],'token'=>get_token())).'">点击查看奖品</a>';
								}
									
							}
						}else{
							$text='你现处于微现场模式，回复down可以切换到正常模式哦！';
						}
                        
                    }
                }
		        break;
		}
		if ($text){
		    $this->replyText ($text);
		}
	}
	
}
        	