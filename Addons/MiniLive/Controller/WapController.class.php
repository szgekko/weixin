<?php

namespace Addons\MiniLive\Controller;

use Home\Controller\AddonsController;

class WapController extends AddonsController {
    var $liveId;
    var $liveInfo;
	function _initialize() {
	    $this->liveId=$_REQUEST['live_id'];
	    $this->liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($this->liveId);
	    $liveInfo=$this->liveInfo;
	    if (empty($liveInfo['status'])){
	        $liveInfo=D('Addons://MiniLive/MiniLive')->getLive();
	        $this->liveId=$liveInfo['id'];
	    }
	    if (empty($liveInfo)){
	        $this->error('未开启微现场！');
	    }
	    $this->liveInfo=$liveInfo;
		parent::_initialize ();
	}
	// 活动首页，摇一摇游戏
	//扫二维码，点击图文进来
	function shake(){
	    //微现场
	    $liveInfo=$this->liveInfo;
// 	    $liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($this->liveId);
	    //摇一摇活动
	    $shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
	    $shake_logo=get_cover_url($shakeInfo['shake_logo']);
	    //摇控器
	    $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveInfo['id']);
	    
	    $key='Wap_setDaoJiShu_'.$liveInfo['id'];
	    $monitor['daoji']= S($key)===false ? 0:S($key);
	    $this->assign('daoji',$monitor['daoji']);
	    $this->assign('game_state',$monitor['game_state']);
	    if ($shakeInfo['shake_music']){
	    	$downloadConfig=C(DOWNLOAD_UPLOAD);
	    	$f=M('file')->find($shakeInfo['shake_music']);
	    	if (!empty($f)){
	    		$musicPath=SITE_URL . '/Uploads/Download/'.$f['savepath'].$f['savename'];
// 	    		$musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f['savepath'].$f['savename'];
	    	}
	    }   
	    if (empty($musicPath)){
	    	$musicPath=ADDON_PUBLIC_PATH.'/mp3/yaojiang.mp3';
	    } 
	    $this->assign('music_path',$musicPath);
// 	    $this->assign('tatal_shake',$shakeInfo['times']);
		$bg_img=get_cover_url($shakeInfo['bg_img']);
		if (empty($bg_img)){
			$bg_img=ADDON_PUBLIC_PATH.'/images/shake_bg.jpg';
		}
		$this->assign('bg_img',$bg_img);
	    $this->assign('img',$shake_logo);
	    $this->assign('info',$shakeInfo);
	    $this->assign('live_id',$liveInfo['id']);
	    
	    if ($monitor['game_state'] ==2){
	    	$shakeCount=$monitor['shake_count']+1;
	    }else{
	    	$shakeCount=$monitor['shake_count'];
	    }
	    $canshake=1;
	    $uid=$this->mid;
	    //摇一摇游戏参与抽奖奖品
	    if ($shakeInfo['once'] == 0){
	    	//是否已经中奖
	    	//$shakeCount--;
	    	$luckyData=D('Addons://MiniLive/MiniShake')->getLuckyUserLists($liveInfo['id'],-1,$uid);
	    	$getPrizeCount=count($luckyData);
	    	//多轮
	    	//多轮重复中奖repeat
	    	if ($shakeInfo['repeat'] == 0 && $getPrizeCount>0){
	    		//不允许
	    		$canshake=0;
	    	}
	    }
	    $this->assign('can_shake',$canshake);
	    $this->display();
	}
	
	function ajaxAddCount(){
		$isend=0;
		$liveId=$this->liveId;
		$sCount=I('the_count',0,'intval');
		$liveInfo=$this->liveInfo;
		$shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
		
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveInfo['id']);
		$shakeCount=$monitor['shake_count']+1;
		$uid=$this->mid;
		//活动未开始
		if ($monitor['game_state'] !=2){
			$isend =-1;
		}
		
		//摇一摇游戏参与抽奖奖品
		if ($isend==0 && $shakeInfo['once'] == 0){
			//是否已经中奖
			//$sc=$shakeCount-1;
			$luckyData=D('Addons://MiniLive/MiniShake')->getLuckyUserLists($liveInfo['id'],-1,$uid);
			$getPrizeCount=count($luckyData);
			//多轮
			//多轮重复中奖repeat
			if ($shakeInfo['repeat'] == 0 && $getPrizeCount>0){
				//不允许
				$isend=2;
			}
		}
		if ($isend ==0){
			$userAttend= D('Addons://MiniLive/MiniShake')-> getUserShake($liveId,$liveInfo['shake_id'],$shakeCount,$uid);
			if (!empty($userAttend)){
				if ($sCount < $shakeInfo['times']){
					// 		$userAttend= D('Addons://MiniLive/MiniShake')->get_user_attend($liveId,$liveInfo['shake_id'],$shakeCount,$uid);
					$uaMap['live_id']=$liveId;
					$uaMap['shake_id']=$liveInfo['shake_id'];
					$uaMap['shake_count']=$shakeCount;
					$uaMap['uid']=$uid;
					// 				$res=M('shake_user_attend')->where($uaMap)->setField('join_count',$sCount);
					D('Addons://MiniLive/MiniShake')-> setShakeCount($liveId,$liveInfo['shake_id'],$shakeCount,$uid, 'join_count', $sCount);
				}else{
					$uaMap['live_id']=$liveId;
					$uaMap['shake_id']=$liveInfo['shake_id'];
					$uaMap['shake_count']=$shakeCount;
					$uaMap['uid']=$uid;
					M('shake_user_attend')->where($uaMap)->setField('join_count',$sCount);
					$userAttend['join_count']=$sCount;
					D('Addons://MiniLive/MiniShake')->getUserShake($liveId,$liveInfo['shake_id'],$shakeCount,$uid,true,$userAttend);
					$isend=1;
					//达到摇的数量，游戏结束
					//获取摇摇活动轮数
					if ($shakeInfo['once'] == 0){
						//多轮
						$awardLists=D('Addons://MiniLive/MiniShake')->getAwardlists($shakeInfo['id']);
						$acount=count($awardLists);
					}else{
						$acount=1;
					}
					$acount = $acount - $monitor['shake_count'];
					$save['shake_count']=$monitor['shake_count'] +1;
					if ($acount == 1){
						$monitor['msgwall_state']=$save['msgwall_state']=3;//关闭
						$monitor['shake_count'] = $save['shake_count'];
						$monitor['game_state']=$save['game_state']=3;
					}else {
						$monitor['msgwall_state']=$save['msgwall_state']=0;//开启上墙
						$monitor['shake_count'] = $save['shake_count'];
						$monitor['game_state']=$save['game_state']=0;
					}
					$monitor['is_speech']=$save['is_speech']=1;
					$map['id']=$monitor['id'];
					$res=M('mini_monitor')->where($map)->save($save);
					if($res){
						D('Addons://MiniLive/MiniMonitor')->getInfo($liveId,'',true,$monitor);
						$this->sendGiftTips();
					}
				}
			}else{
				$addUA['token']=get_token();
				$addUA['live_id']=$liveId;
				$addUA['shake_count']=$shakeCount;
				$addUA['uid']=$uid;
				$addUA['join_count']=$sCount;
				$addUA['shake_id']=$liveInfo['shake_id'];
				$res=M('shake_user_attend')->add($addUA);
			}
		}

		echo $isend;
	}
	//游戏结束，发送中奖人提示语
	function sendGiftTips(){
		//获取奖品
		$liveId=$this->liveId;
		$liveInfo=$this->liveInfo;
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveInfo['id']);
		$shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
		$allawardLists=D('Addons://MiniLive/MiniShake')->getAwardlists($shakeInfo['id']);
		//摇一摇游戏参与抽奖奖品
		if ($shakeInfo['once'] == 0){
			$ind=$monitor['shake_count']-1;
			$nowAward=$allawardLists[$ind];
			$gameAward[]=$nowAward;
		}else{
			$gameAward=$allawardLists;
		}
		foreach ($gameAward as $vv){
			for($i=0;$i<$vv['number'];$i++){
				$awardLists[]=$vv;
			}
		}
		//获取参与用户
		$map['live_id']=$liveId;
		$map['shake_count']=$monitor['shake_count'];
		$map['shake_id']=$liveInfo['shake_id'];
		$map['join_count']=array('gt',0);
		
		$userdata=M('shake_user_attend')->where($map)->order('join_count desc')->select();
		$commonDao=D('Common/Custom');
		foreach ($userdata as $key=>$vo){
			$str='';
			$prize=$awardLists[$key];
			$saveData=null;
			if ($prize){
				$name=get_username($vo['uid']);
				$rank=$key+1;
				$str.=$name.'恭喜您在“'.$liveInfo['title'].'” 夺得第'.$rank.'名，获得了 '.$prize['prize_level'].',请立即发表获奖感言领取奖品！';
				$commonDao->replyText($vo['uid'],$str);
					
				//保存中奖信息
				$saveData['live_id']=$liveId;
				$saveData['shake_id']=$liveInfo['shake_id'];
				$saveData['cTime']=time();
				$saveData['award_id']=$prize['id'];
				$saveData['uid']=$vo['uid'];
				$saveData['num']=1;
				$saveData['state']=0;
				$saveData['token']=get_token();
				$saveData['ranking']=$rank;
				$saveData['shake_count']=$monitor['shake_count'];
				switch ($prize['award_type']){
					case 0:
						//0:虚拟奖品
						$saveData['state']=1;
						$saveData['djtime']=time();
						$credit['score']=$prize['score'];
						$credit['title']='微现场摇一摇游戏活动';
						$credit['uid']=$vo['uid'];
						add_credit('mini_shake',0,$credit);
						break;
					case 1:
						//1:实物奖品
						$str=time();
						$rand=rand(1000, 9999);
						$str.=$rand;
						$saveData['scan_code']=$str;
						break;
					case 2:
						//2:优惠券
						$saveData['state']=1;
						$saveData['djtime']=time();
						$snId=D ( 'Addons://Coupon/Coupon' )->sendCoupon ( $prize['coupon_id'], $vo['uid'] );
						$couponInfo=D('Addons://Coupon/Coupon')->getInfo($prize['coupon_id']);
						break;
					case 3:
						//3:代金券
						$saveData['state']=1;
						$saveData['djtime']=time();
						$snId= D ( 'Addons://ShopCoupon/ShopCoupon' )->sendCoupon ( $prize['coupon_id'], $vo['uid'] );
						break;
					default:
						break;
				}
			}
			if ($saveData){
				$saveArr[]=$saveData;
			}
		}
// 		D('Common/Custom')->replyText(11884,'恭喜你中奖了');
		if ($saveArr){
			$res=M('shake_prize_user')->addAll($saveArr);
		}
// 		$otherData['prize_id']=$res;
// 		$otherData['live_id']=$liveId;
// 		$otherData['uid']=$uid;
// 		$otherData['token']=get_token();
// 		$otherData['shake_count']=$shakeCount;
// 		M('shake_prize_content')->add($otherData);
		
	}

	//黑名单
	function hmd(){
	    $map['is_black']=1;
	    $map['live_id']=$this->liveId;
	    $map['state']=1;
	    $uids=M('upwall_user')->where($map)->getFields('id,uid');
	    foreach ($uids as $key=> $u){
	        $user['id']=$key;
	        $user['nickname']=get_username($u);
	        $user['headimgurl']=get_userface($u);
	        $searh['openid']=getOpenidByUid($u);
	        $user['content']=M('msgwall_content')->where($searh)->order('cTime desc')->getField('content');
	        $data[]=$user;
	    }
	    $this->assign('data',$data);
	    $this->assign('live_id',$this->liveId);
	    $this->display();
	}
	function sqlb(){
	    $map['is_black']=0;
	    $map['live_id']=$this->liveId;
	    $uids=M('upwall_user')->where($map)->getFields('id,uid');
	    foreach ($uids as $key=>$u){
	        $user['id']=$key;
	        $user['nickname']=get_username($u);
	        $user['headimgurl']=get_userface($u);
	        $searh['openid']=getOpenidByUid($u);
	        $user['content']=M('msgwall_content')->where($searh)->order('cTime desc')->getField('content');
	        $data[]=$user;
	    }
	    $this->assign('data',$data);
	    $this->assign('live_id',$this->liveId);
	    $this->display();
	}
	//
	function set_black(){
	    $map['id']=I('id');
	    $save['is_black']=I('value');
	    $res=M('upwall_user')->where($map)->save($save);
	    if ($save['is_black'] == 1){
	        redirect(U('sqlb',array('live_id'=>$this->liveId)));
	    }else{
	        redirect(U('hmd',array('live_id'=>$this->liveId)));
	    }
	}
	function ykq_pwd(){
	    $liveId=I('live_id');
	    $this->assign('live_id',$liveId);
	    if (IS_POST){
	        $liveInfo=$this->liveInfo;
// 	        $liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($liveId);
	        if ($liveInfo['start_pwd'] == $_POST['pwd']){
	            $uid=$this->mid;
	            $key='ykq_pwd_'.'_'.$liveId.'_'.$uid;
	            S($key,$_POST['pwd'],86400);
	            redirect(U("ykq",array('live_id'=>$liveId)));
	        }else{
	            $this->error('密码不正确');
	        }
	    }
	    $this->display();
	}
	//发送ykq 点击
	function ykq(){
	    $uid=$this->mid;
	    $key='ykq_pwd_'.'_'.$this->liveId.'_'.$uid;
	    $pwd=S($key);
	    if ($pwd === false){
	        $pwdUrl=U('ykq_pwd',array('live_id'=>$this->liveId));
	        redirect($pwdUrl);
	    }
	    $token=get_token();
	    $reloadUrl=U('ykq',array('live_id'=>$this->liveId,'token'=>$token));
	    $this->assign('reload_url',$reloadUrl);
		//微现场
	    $liveInfo=$this->liveInfo;
// 	    $liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($this->liveId);
	    if ($liveInfo['status'] == 0){
	        $liveInfo=D('Addons://MiniLive/MiniLive')->getLive();
	    }
	    $this->assign('live',$liveInfo);
	    //获取摇控器
	    $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($this->liveId);
	    //是否有精彩回放图片
	    //回放图片
	    $picMap['live_id']=$this->liveId;
// 	    $picMap['shake_count']=$monitor['shake_count'];
	    $picData=M('mini_live_pic')->where($picMap)->getFields('id,media_id,cover_id');
	    $picCount=count($picData);
	    $this->assign('picCount',$picCount);
	    
	    //获取是否有摇一摇活动
	    $shakeId=$liveInfo['shake_id'];
	    if ($shakeId){
	        $this->assign('has_shake',1);
	    }
	    //获取摇摇活动轮数
	    $shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($shakeId);
	    if ($shakeInfo['once'] == 0){
	        //多轮
	        $awardLists=D('Addons://MiniLive/MiniShake')->getAwardlists($shakeId);
	        $acount=count($awardLists);
	    }else{
	        $acount=1;
	    }
	    $acount = $acount - $monitor['shake_count'];
	    $this->assign('shake_count',$acount);
	    
	    $str_title='活动未开始';
	   if ($monitor['msgwall_state']==1){
	       $str_title='上墙中';
	   }else if($monitor['wecome_state']==1){
	       $str_title='开场欢迎';
	   }else if($monitor['game_state']==1){
	       $str_title='进入游戏';
	   }else if($monitor['game_state']==2){
	       $str_title='开始游戏';
	   }else if($monitor['game_state']==3 || ($monitor['game_state']==0 && $monitor['wecome_state']==3)){
	       $str_title='结束游戏';
	   }
	   // dump($monitor);
	   $this->assign('start_title',$str_title);
	    $this->assign('monitor',$monitor);
		$this -> display();
	}
	function ykq_change_state(){
		$liveInfo=$this->liveInfo;
		$res=0;
		$type=I('type');
		$value=I('val');
		//摇一摇轮数
		$shakeCount=I('shake_count');
		$map['id']=$monitor_id=I('monitor_id');
		$monitor=M('mini_monitor')->find($monitor_id);
		if (empty($monitor)){
			$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($this->liveId);
			$monitor_id=$map['id']=$monitor['id'];
		}
		switch ($type){
		    case 'msgwall_state':
		    	$monitor['msgwall_state']=$save['msgwall_state']=$value;
		    	$monitor['wecome_state']=$save['wecome_state']=0;
		    	$monitor['is_speech']=$save['is_speech']=0;
		    	$monitor['playback_state']=$save['playback_state']=0;
		    	break;
	    	case 'wecome_state':
	    	    $monitor['wecome_state']=$save['wecome_state']=$value;
	    	    $monitor['msgwall_state']=$save['msgwall_state']=2;//暂停
	    	    $monitor['is_speech']=$save['is_speech']=0;
	    	    $monitor['playback_state']=$save['playback_state']=0;
	    	    break;
	    	case 'game_state':
	    	    if ($value == 0){
	    	        //结束游戏
	    	    	//达到摇的数量，游戏结束
	    	    	//获取摇摇活动轮数
	    	        if ($shakeCount == 1){
	    	            $monitor['msgwall_state']=$save['msgwall_state']=3;//关闭
	    	            $monitor['shake_count'] = $save['shake_count'];
	    	            $monitor['game_state']=$save['game_state']=3;
	    	        }else {
	    	            $monitor['msgwall_state']=$save['msgwall_state']=0;//开启上墙
	    	           
	    	            $monitor['shake_count'] = $save['shake_count'];
	    	            $monitor['game_state']=$save['game_state']=$value;
	    	        }
	    	        if ($monitor['game_state'] != 3 || $monitor['game_state'] != 0){
	    	        	$save['shake_count']=$monitor['shake_count'] +1;
	    	        }
	    	        
	    	        $monitor['is_speech']=$save['is_speech']=1;
	    	        //获取摇摇活动轮数
	    	        $shakeId=D('Addons://MiniLive/MiniLive')->getInfo($monitor['live_id'],'shake_id');
	    	        $shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($shakeId);
	    	        $shakeInfo['attent_order']=0;
	    	        D('Addons://MiniLive/MiniShake')->where(array('id'=>$shakeId))->setField('attent_order',0);
	    	        $shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($shakeId,'',true,$shakeInfo);
	    	        $this->sendGiftTips();
	    	    }else{
	    	        //进入或开始摇摇游戏
	    	        $monitor['wecome_state']=$save['wecome_state']=3;
	    	        $monitor['msgwall_state']=$save['msgwall_state']=3;//关闭
	    	        $monitor['game_state']=$save['game_state']=$value;
	    	        $monitor['is_speech']=$save['is_speech']=0;
	    	        $monitor['playback_state']=$save['playback_state']=0;
	    	        if ($value == 2){
	    	        	$attendMap['live_id']=$liveInfo['id'];
	    	        	$attendMap['shake_id']=$liveInfo['shake_id'];
	    	        	$uidarr=M('shake_user_attend')->where($attendMap)->getFields('uid');
	    	        	$uidarr=array_unique($uidarr);
	    	        }
	    	    }
	    	    break;
	    	case 'playback_state':
	    		$monitor['wecome_state']=$save['wecome_state']=3;
	    		$monitor['msgwall_state']=$save['msgwall_state']=3;//关闭
	    	    $monitor['playback_state']=$save['playback_state']=$value;
	    	    $monitor['is_speech']=$save['is_speech']=0;
	    	    break;
	    	case 'music_state':
	    	    $monitor['music_state']=$save['music_state']=$value;
	    	    break;
	    	case 'music_size':
	    	    $monitor['music_size']=$save['music_size']=$value;
	    	    break;
	    	case 'winner_page_up':
	    	    $value = $value -1;
	    	    $monitor['winner_page']=$save['winner_page']=$value;
	    	    break;
	    	case 'winner_page_next':
	    	    $value = $value + 1;
	    	    $monitor['winner_page']=$save['winner_page']=$value;
	    	    break;
	    	case 'daoji':
	    		$monitor['daoji']=$save['daoji']=$value;
	    		break;
		    default:
		    	break;
		}
		$res=M('mini_monitor')->where($map)->save($save);
		if($res){
			D('Addons://MiniLive/MiniMonitor')->getInfo($monitor['live_id'],'',true,$monitor);
			if (!empty($uidarr)){
				$custom=D('Common/Custom');
				foreach ($uidarr as $uid){
					if ($liveInfo['game_msg_title']){
						$url1=addons_url( 'MiniLive://Wap/shake',array('token'=>get_token(),'live_id'=>$liveInfo['id']));
						$articles [0] = array (
								'title' => $liveInfo['game_msg_title'],
								'description' => $liveInfo['game_msg_intro'],
								'picurl' => get_cover_url($liveInfo['game_msg_img']),
								'url' =>$url1
						);
						$param ['news'] ['articles'] = $articles;
						$custom ->_replyData($uid,$param,'news');
					}
				}
			}
		}
		echo $res;
	}
	function daoJiShu(){
		$live_id=$this->liveId;
		$val=I('val');
		$type=I('type');
		$key='Wap_setDaoJiShu_'.$live_id;
		$dd=S($key);
		if (dd ===false){
			S($key,30);
		}
		S($key,$val);
		echo 1;
	}
	
	///////////////摇一摇抽奖用到的函数，暂没用到//////////////////
	function let_player_down($msg='') {
	    empty($msg) && $msg='没有摇中奖品，别灰心，继续努力！';
	    $liveInfo=$this->liveInfo;
	    $map['msgwall_id']=$liveInfo['msgwall_id'];
	    $map['token']=get_token();
	    $map['is_del']=0;
	    $sponsor=M('mini_sponsor')->where($map)->select();
	    if (!empty($sponsor)){
	        foreach ($sponsor as $v){
	            $ad_info['ad_name']=$v['name'].'提醒您：'.$msg;
	            $ad_info['id']=$v['id'];
	            $ad_info['img']=get_cover_url($v['img']);
	            $adArr[]=$ad_info;
	        }
	    }else {
	        // 随机广告
	        $ad_info ['ad_name'] = '家乡货 提醒您：'.$msg;
	        $ad_info ['id'] = 1;
	        $ad_info ['img']=ADDON_PUBLIC_PATH.'/jiaoyu.png';
	        $adArr[]=$ad_info;
	        $ad_info ['ad_name'] = '圆梦云科技有限公司 提醒您：'.$msg;
	        $ad_info ['id'] = 2;
	        $ad_info ['img']=ADDON_PUBLIC_PATH.'/yuan.png';
	        $adArr[]=$ad_info;
	    }
	    shuffle($adArr);
	    $ad=$adArr[0];
	    echo json_encode ( array (
	        "name" => $ad ['ad_name'],
	        "img"=>$ad['img'],
	        "status" => 2
	    ) );
	    die ();
	} 
	function do_lucky_lottery($yao_count,$prizeArr,$event_str,$update=false){
	    $key = 'do_lucky_lottery_' .$event_str;
	    $res = S ( $key );
	    if ($res === false || $update) {
	        foreach ( $prizeArr as $p ) {
	            for($i = 0; $i < $p ['prize_num']; $i ++) {
	                $rand [] = $p ['prize_id'];
	            }
	        }
	        shuffle ( $rand );
	        for ($n=1;$n<=$yao_count;$n++){
	            $numArr[]=$n;
	        }
	        shuffle($numArr);
	        $total_num=count($rand);
	        for ($y=0; $y < $total_num;$y++){
	            $ind=$numArr[$y];
	            $awardList[$ind]=$rand[$y];
	        }
	        $res=$awardList;
	        S ( $key, $res , 86400 );
	    }
	    return $res;
	}
	function del_lottery($index, $event_str) {
	    $key = 'do_lucky_lottery_' .$event_str;
	    $res = S ( $key );
	    if ($res === false)
	        return false;
	
	    unset ( $res [$index] );
	    S ( $key, $res );
	}
	public function ajax_api() {
	    $msg='';
	    $liveId=I('live_id');//现场id
	    if (empty($liveId)){
	        $liveId=$this->liveId;
	    }
	    //摇控器
	    $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveId);
	    $shakeCount=$monitor['shake_count']+1;
	    if ($monitor['game_state'] !=2){
	        $msg='游戏未开始或已结束！';
	        $this->let_player_down($msg);
	    }
	    //摇一摇活动
	    $shakeId=I('id');
	    $shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($shakeId);
	    if (empty($shakeInfo)){
	        //没有奖品
	        $msg='活动未进行！';
	        $this->let_player_down($msg);
	    }
	    //摇一摇奖品
	    $allawardLists=D('Addons://MiniLive/MiniShake')->getAwardlists($shakeInfo['id']);
	    if (empty($allawardLists)){
	        //没有奖品
	        $msg='奖品已抽完！';
	        $this->let_player_down($msg);
	    }
	    
	    $uid=$this->mid;
	    $userAttend= D('Addons://MiniLive/MiniShake')->get_user_attend($liveId,$shakeId,$shakeCount,$uid);
	    if ($userAttend['user_num'] != 0){	        
	        $uaMap['live_id']=$liveId;
	        $uaMap['shake_id']=$shakeId;
	        $uaMap['shake_count']=$shakeCount;
	        $uaMap['uid']=$uid;
	        M('shake_user_attend')->where($uaMap)->setInc('join_count');
	    }else{
	        $addUA['token']=get_token();
	        $addUA['live_id']=$liveId;
	        $addUA['shake_count']=$shakeCount;
	        $addUA['uid']=$uid;
	        $addUA['join_count']=1;
	        $addUA['shake_id']=$shakeId;
	        M('shake_user_attend')->add($addUA);
	    }
	    //是否已经中奖
	    $luckyData=D('Addons://MiniLive/MiniShake')->getLuckyUserLists($liveId,$shakeCount,$uid);
	    $getPrizeCount=count($luckyData);
	    //摇一摇游戏参与抽奖奖品
	    if ($shakeInfo['once'] == 0){
	        //多轮  
	        $nowAward=$allawardLists[$monitor['shake_count']];
	        $gameAward[]=$nowAward;
	        //多轮重复中奖repeat
	        if ($shakeInfo['repeat'] == 0 && $getPrizeCount>0){
	            //不允许
	            $msg='没有摇中奖品！';
	            $this->let_player_down($msg);
	        }else{
	            $luckyData1=D('Addons://MiniLive/MiniShake')->getLuckyUserLists($liveId,$shakeCount,$uid,$nowAward['id']);
	            $getPrizeCount1=count($luckyData1);
	            if ($getPrizeCount1 > 0){
	                $msg='没有摇中奖品！';
	                $this->let_player_down($msg);
	            }
	            $ranking=D('Addons://MiniLive/MiniShake')->get_ranking($liveId,$nowAward['id']);
	        }
	    }else{
	        if ($getPrizeCount >0){
	            $msg='没有摇中奖品！';
	            $this->let_player_down($msg);
	        }
	        $gameAward=$allawardLists;
	        $ranking=D('Addons://MiniLive/MiniShake')->get_ranking($liveId);
	    }
//	    D('Addons://MiniLive/MiniShake')->setCount($shakeInfo['id'],'join_count');
	   
	    $hasPrizeNum= D('Addons://MiniLive/MiniShake')->getLuckyAwardNum($liveId);
	    
	    //获取奖品
	    foreach ($gameAward as $v){
	        $prize['prize_id']=$v['id'];
	        $prize['prize_num']=$v['number'] - $hasPrizeNum[$v['id']];
	        $prizeArr[$v['id']]=$prize;
	    }
	    
	    $eventStr=$liveId.'_'.$shakeId;
	    $prizeData=$this->do_lucky_lottery($shakeInfo['times'],$prizeArr,$eventStr);

	    $yaoCount=$shakeInfo['attent_order']+1;
	    D('Addons://MiniLive/MiniShake')->setCount($shakeInfo['id'],'attent_order');
	    if ($prizeData[$yaoCount]){
	        //中奖
	        $draw_res=$prizeData[$yaoCount];
	        $theAward=D('Addons://MiniLive/MiniShake')->getPrize($draw_res);
	        //保存中奖信息
	        $saveData['live_id']=$liveId;
	        $saveData['shake_id']=$shakeId;
	        $saveData['cTime']=time();
	        $saveData['award_id']=$draw_res;
	        $saveData['uid']=$uid;
	        $saveData['num']=1;
	        $saveData['state']=0;
	        $saveData['token']=get_token();
	        $saveData['ranking']=$ranking;
	        $saveData['shake_count']=$shakeCount;
	        switch ($theAward['award_type']){
	            case 0:
	                //0:虚拟奖品
	                $saveData['state']=1;
	                $saveData['djtime']=time();
	                $credit['score']=$theAward['score'];
	                $credit['title']='微现场摇一摇游戏活动';
	                $credit['uid']=$uid;
	                add_credit('mini_shake',0,$credit);
	                $name=$theAward['score']."积分,赶紧用微信发信息发表获奖感言吧！";
	                $img=ADDON_PUBLIC_PATH."/smile.png";
	                $jumpUrl="javascript:;";
	                $is=0;
	                break;
                case 1:
                    //1:实物奖品
                    $str=time();
                    $rand=rand(1000, 9999);
                    $str.=$rand;
                    $saveData['scan_code']=$str;
                    $is = 1;
                    $name=$theAward['name'].',赶紧用微信发信息发表获奖感言吧！';
                    $img=$theAward['img_url'];
                    $jumpUrl='';
                    break;
	            case 2:
	                //2:优惠券
	                $saveData['state']=1;
	                $saveData['djtime']=time();
	                $is = 2;
	                $snId=D ( 'Addons://Coupon/Coupon' )->sendCoupon ( $theAward['coupon_id'], $uid );
                    $couponInfo=D('Addons://Coupon/Coupon')->getInfo($theAward['coupon_id']);
	                $name='优惠券 '.$couponInfo['title'].' 一张,赶紧用微信发信息发表获奖感言吧！';
	                $img=get_cover_url($couponInfo['background']);
	                $jumpUrl=addons_url('Coupon://Wap/show',array('id'=>$theAward['coupon_id'],'sn_id'=>$snId));
	                 
	                break;
	            case 3:
	                //3:代金券
	                $saveData['state']=1;
	                $saveData['djtime']=time();
	                $is = 3;
	                $snId= D ( 'Addons://ShopCoupon/ShopCoupon' )->sendCoupon ( $theAward['coupon_id'], $uid );
	                $ShopcouponInfo=D('Addons://Coupon/Coupon')->getInfo($theAward['coupon_id']);
	                $name='代金券 '.$ShopcouponInfo['title'].' 一张,赶紧用微信发信息发表获奖感言吧！';
	                $img=ADDON_PUBLIC_PATH.'/bag_1.png';
	                $jumpUrl=addons_url('ShopCoupon://Wap/show',array('id'=>$theAward['coupon_id'],'sn_id'=>$snId));
	                break;
	            default:
	                break;
	        }
	        $res=M('shake_prize_user')->add($saveData);
	        $res && $this->del_lottery($yaoCount, $eventStr);
	        $otherData['prize_id']=$res;
	        $otherData['live_id']=$liveId;
	        $otherData['uid']=$uid;
	        $otherData['token']=get_token();
	        $otherData['shake_count']=$shakeCount;
	        M('shake_prize_content')->add($otherData);
	        if ($jumpUrl == ''){
	            $jumpUrl= addons_url('MiniLive://Wap/get_prize',array('id'=>$res));
	        }
	        $return_data['status']=1;
	        $return_data['img']=$img;
	        $return_data["name"]=$name;
	        $return_data['is']=$is;
	        $return_data['url']=$jumpUrl;
	        echo json_encode($return_data);
	    }else{
	        //未中奖
	        $this->let_player_down();
	    }
	}
	
	//领取实物
	function get_prize(){
	    $id=I('id');
	    $userAward=M('shake_prize_user')->find($id);
	    $awardInfo=D('Addons://MiniLive/MiniShake')->getPrize($userAward['award_id']);
	    $userAward['prize_level']=$awardInfo['prize_level'];
	    $userAward['img']=$awardInfo['img'];
	    $this->assign('user_award',$userAward);
	    // 	    dump($addressList);
	    $this ->display();
	}
	
	//实物奖品扫码核销
	function scan_success(){
	    $cTime=I('cTime',0,'intval');
	    $tt= NOW_TIME * 1000 - $cTime;
	    if($cTime > 0){
	        if ($tt >30000){
	            $this->error('二维码已经过期');
	        }
	    }
	    //扫码员id
	    $mid=$this->mid;
	    //授权表查询
	    $map['uid']=$mid;
	    $map['token']=get_token();
	    $map['enable']=1;
	    $role=M('servicer')->where($map)->getField('role');
	    $roleArr=explode(',', $role);
	    if (!in_array(2, $roleArr)){
	        $this->error('你还没有扫码验证的权限');
	        exit();
	    }
	     
	    $scanCode=I('scan_code');
	    $map1['id']= I('id');
	    $lucky=M('shake_prize_user')->find($map1['id']);
	    $is_check=0;
	    if($lucky['scan_code'] == $scanCode){
	        //验证成功
	        $save['state']=1;
	        $save['djtime']=time();
	        $res=M('shake_prize_user')->where($map1)->save($save);
	        if ($res){
	            $is_check=1;
	        }
	    }
	    $userAward=M('shake_prize_user')->find($map1['id']);
	    $awardInfo=D('Addons://MiniLive/MiniShake')->getPrize($userAward['award_id']);
	    $userAward['prize_level']=$awardInfo['prize_level'];
	    $userAward['img']=$awardInfo['img'];
	    $this->assign('user_award',$userAward);
	    	
	    $this->assign('is_check',$is_check);
	    $this -> display('get_prize');
	}
	function get_state(){
	    $id=I('id');
	    $state=M('shake_prize_user')->where(array('id'=>$id))->getField('state');
	    echo $state;
	}
	function get_pic_count(){
		$picMap['live_id']=$this->liveId;
		// 	    $picMap['shake_count']=$monitor['shake_count'];
		$picData=M('mini_live_pic')->where($picMap)->getFields('id');
		$picCount=count($picData);
		echo $picCount;
	}
	//游戏结束判断用户是否中奖
	function is_user_win(){
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($this->liveId);
		$map['shake_count']=$monitor['shake_count'];
		$map['uid']=$this->mid;
		$map['live_id']=$this->liveId;
		$map['shake_id']=I('shake_id');
		$count=M('shake_prize_user')->where($map)->count();
		echo $count;
	}
}
