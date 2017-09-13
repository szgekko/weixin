<?php
namespace Addons\MiniLive\Controller;
use Home\Controller\AddonsController;

class ShowController extends AddonsController{
	var $id;
	var $info;
	function _initialize() {
		$this->id=$_REQUEST['id'];
		$this->info=D('Addons://MiniLive/MiniLive')->getInfo($this->id);
		$liveInfo=$this->info;
		if (empty($liveInfo['status'])){
			$liveInfo=D('Addons://MiniLive/MiniLive')->getLive();
			$this->id=$liveInfo['id'];
		}
		if (empty($liveInfo)){
			$this->error('未开启微现场！');
		}
		$this->info=$liveInfo;
		parent::_initialize ();
	}
	//二维码页面
	function showQrCode(){
	    $id=$this->id;
	    $info=D('Addons://MiniLive/MiniLive')->getInfo($id);
	    $code=$info['qrcode'];
	    $msgwall=D('Addons://MiniLive/MiniMsgwall')->getInfo($info['msgwall_id']);
	    if ($msgwall['bg_img']){
	    	$bgPath=get_cover_url($msgwall['bg_img']);
	    }else{
	    	$bgPath=ADDON_PUBLIC_PATH.'/stage_bg.jpg';
	    }
	     $this->assign('bg_path',$bgPath);
	    $this->assign('qrcode',$code);
		$this -> display();
	}
	//上墙
	function show(){
	    $id=$this->id;
	    $info=D('Addons://MiniLive/MiniLive')->getInfo($id);
	    $code=$info['qrcode'];
	    $this->assign('qrcode',$code);
	    $wallLogo=D('Addons://MiniLive/MiniMsgwall')->getInfo($info['msgwall_id'],'logo_img');
	    $msgwall=D('Addons://MiniLive/MiniMsgwall')->getInfo($info['msgwall_id']);
	    if ($msgwall['bg_img']){
	    	$bgPath=get_cover_url($msgwall['bg_img']);
	    }else{
	    	$bgPath=ADDON_PUBLIC_PATH.'/stage_bg.jpg';
	    }
	    $this->assign('bg_path',$bgPath);
	    
	    $musicFileId=D('Addons://MiniLive/MiniMsgwall')->getInfo($info['msgwall_id'],'music');
	    $downloadConfig=C(DOWNLOAD_UPLOAD);
	    $f=M('file')->find($musicFileId);
	    if (!empty($f)){
	    	$musicPath=SITE_URL . '/Uploads/Download/'.$f['savepath'].$f['savename'];
// 	        $musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f['savepath'].$f['savename'];
	        $this->assign('music_path',$musicPath);
	    }
	    $this->assign('logo',$wallLogo);
	    //赞助商
	    $sponsor=D('Addons://MiniLive/MiniSponsor')->getList($info['msgwall_id']);
	    $this->assign('sponsor',$sponsor);
	    $this->assign('live_id',$info['id']);
		$this -> display();
	}
	
	//游戏开始页面
	function gameStart(){
	    $id=$this->id;
	    $info=D('Addons://MiniLive/MiniLive')->getInfo($id);
	    $this->assign('qrcode',$info['qrcode']);
	    $shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($info['shake_id']);
	    $this->assign('shake',$shakeInfo);
	    if ($shakeInfo['bg_img']){
	    	$bgPath=get_cover_url($shakeInfo['bg_img']);
	    }else{
	    	$bgPath=ADDON_PUBLIC_PATH.'/stage_bg.jpg';
	    }
	    $this->assign('bg_path',$bgPath);
	    
	    $downloadConfig=C(DOWNLOAD_UPLOAD);
	    $f1=M('file')->find($shakeInfo['shake_music']);
	    if (!empty($f1)){
	    	$musicPath=SITE_URL . '/Uploads/Download/'.$f1['savepath'].$f1['savename'];
// 	        $musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f1['savepath'].$f1['savename'];
	        $this->assign('bj_music_path',$musicPath);
	    }
	    $allawardLists=D('Addons://MiniLive/MiniShake')->getAwardlists($info['shake_id']);
	    
	    if ($shakeInfo['once'] == 0){
	        $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($id);
	        //多轮
	        $nowAward=$allawardLists[$monitor['shake_count']];
	        $gameAward[]=$nowAward;
	    }else{
	        $gameAward=$allawardLists;
	    }
	    
	    $shakeCount=$monitor['shake_count']+1;
	    $userAttend= D('Addons://MiniLive/MiniShake')->get_user_attend($id,$info['shake_id'],$shakeCount,0,'user_num');
	    $this->assign('user_attend',$userAttend);
	    $this->assign('awards',$gameAward);
		$this->assign('live_id',$id);
		
		$key='Wap_setDaoJiShu_'.$id ;
		$monitor['daoji']= S($key)===false ? 0:S($key);
		$this -> display();
	}
	//游戏页面
	function game(){

		$id = $this->id;
		$this -> assign('live_id',$id);
		$liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($id);
		$shakeDao=D('Addons://MiniLive/MiniShake');
		$shakeInfo=$shakeDao->getInfo($liveInfo['shake_id']);
		$this->assign('logo',$shakeInfo['company_logo']);
		if ($shakeInfo['bg_img']){
			$bgPath=get_cover_url($shakeInfo['bg_img']);
		}else{
			$bgPath=ADDON_PUBLIC_PATH.'/stage_bg.jpg';
		}
		$this->assign('bg_path',$bgPath);
		
		$downloadConfig=C(DOWNLOAD_UPLOAD);
		$f1=M('file')->find($shakeInfo['shake_music']);
		if (!empty($f1)){
			$musicPath=SITE_URL . '/Uploads/Download/'.$f1['savepath'].$f1['savename'];
			// 	        $musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f1['savepath'].$f1['savename'];
			$this->assign('bj_music_path',$musicPath);
		}
		
		$liveId=$id;
		$liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($liveId);
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveId);
		$shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
		$shakeCount=$monitor['shake_count']+1;
		//获取参与用户
		$map['live_id']=$liveId;
		$map['shake_count']=$shakeCount;
		$map['shake_id']=$liveInfo['shake_id'];
		$map['join_count']=array('gt',0);
		$userdata=M('shake_user_attend')->where($map)->order('join_count desc')->limit(10)->select();
		foreach ($userdata as $v){
			$nickname=get_username($v['uid']);
			$rdata['name']=$nickname?$nickname:'匿名';
			$rdata['img']=get_userface($v['uid']);
			$rdata['count']=$v['join_count'];
			$rdata['totalCount']=$shakeInfo['times'];
			$returnData[]=$rdata;
		}
		
		$this->assign('user_data',$returnData);
		$this -> display();
	}
	//游戏结束
	function gameEnd(){
		$map['live_id']=$id =$this->id;
		$this -> assign('live_id',$id);
		$liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($id);
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($id);
		$row=12;
		$page=I('next_page');
		if (empty($page)){
		    $page = $monitor['winner_page'];
		}
		$map['shake_count']=$monitor['shake_count'];
		$tnum=M('shake_prize_user')->where($map)->field('distinct uid,ranking')->count();
		$allPage=ceil($tnum / $row);
		if ($page > $allPage){
		    $page=$allPage;
		}
		$this->assign('next_page',$page);
		$prizeUser=M('shake_prize_user')->where($map)->field('distinct uid,ranking')->order ( 'id asc' )->page ( $page, $row )->select();
		$shakeDao=D('Addons://MiniLive/MiniShake');
		$shakeInfo=$shakeDao->getInfo($liveInfo['shake_id']);
		if ($shakeInfo['bg_img']){
			$bgPath=get_cover_url($shakeInfo['bg_img']);
		}else{
			$bgPath=ADDON_PUBLIC_PATH.'/stage_bg.jpg';
		}
		$this->assign('bg_path',$bgPath);

		$downloadConfig=C(DOWNLOAD_UPLOAD);
		$f1=M('file')->find($shakeInfo['award_music']);
		if (!empty($f1)){
			$musicPath=SITE_URL . '/Uploads/Download/'.$f1['savepath'].$f1['savename'];
			// 	        $musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f1['savepath'].$f1['savename'];
			$this->assign('bj_music_path',$musicPath);
		}
		
		foreach ($prizeUser as &$v){
		    $user=get_userinfo($v['uid']);
		    $v['name']=$user['nickname'];
		    $v['headimgurl']=$user['headimgurl'];
		}
		$this->assign('userAward',$prizeUser);
		
		$allPrize=$shakeDao->getLuckyUserLists($id,$monitor['shake_count']);
		$total_count=count($allPrize);
		
		$ling=$shakeDao->getLuckyUserLists($id,$monitor['shake_count'],0,0,1);
		$ling_count=count($ling);
		
		//获奖感言
		vendor ( "qqface" );
		$spMap['live_id']=$id;
		$spMap['cTime']=array('gt',0);
		$spMap['shake_count']=$monitor['shake_count'];
		$prizeContent=M('shake_prize_content')->where($spMap)->select();
		foreach ($prizeContent as &$vv){
		    if ($vv['content']){
		        $vv['nickname']=get_username($vv['uid']);
		        $vv['headimgurl']=get_userface($vv['uid']);
		        $vv['content']=parseHtmlemoji($vv['content']);
		        $vv['content']=qqface_convert_html($vv['content']);
		    }
		}
		$userAttend= D('Addons://MiniLive/MiniShake')->get_user_attend($id,$liveInfo['shake_id'],$monitor['shake_count'],0,'user_num','game');
		$this->assign('speech',$prizeContent);
		$this->assign('user_attend',$userAttend);
		$this->assign('total_count',$total_count);
		$this->assign('ling_count',$ling_count);
		$this->assign('logo',$shakeInfo['company_logo']);
		$this -> display();
	}
	function gameEndAjaxData(){
	    $map['live_id']=$id = $this->id;
	    $liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($id);
	    $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($id);
	    $row=12;
	    $page = $monitor['winner_page'];
	    $map['shake_count']=$monitor['shake_count'];
	    $tnum=M('shake_prize_user')->where($map)->field('distinct uid,ranking')->count();
	    $allPage=ceil($tnum / $row);
	    if ($page > $allPage){
	        $page=$allPage;
	    }
	    //中奖人
	    $prizeUser=M('shake_prize_user')->where($map)->field('distinct uid,ranking')->order ( 'id asc' )->page ( $page, $row )->select();
	    foreach ($prizeUser as &$v){
		    $user=get_userinfo($v['uid']);
		    $v['name']=$user['nickname'];
		    $v['headimgurl']=$user['headimgurl'];
		}
		$returndata['user_award']=$prizeUser;
		
		$shakeDao=D('Addons://MiniLive/MiniShake');
		$shakeInfo=$shakeDao->getInfo($liveInfo['shake_id']);
        //中奖人数
		$allPrize=$shakeDao->getLuckyUserLists($id,$monitor['shake_count']);
		$returndata['total_count']=count($allPrize);
		//领奖人数
		$ling=$shakeDao->getLuckyUserLists($id,$monitor['shake_count'],0,0,1);
		$returndata['ling_count']=count($ling);
		
		$returndata['user_attend']= D('Addons://MiniLive/MiniShake')->get_user_attend($id,$liveInfo['shake_id'],$monitor['shake_count'],0,'user_num','game');
		//获奖感言
		$spMap['live_id']=$id;
		$spMap['cTime']=array('gt',0);
		$spMap['shake_count']=$monitor['shake_count'];
		$sRow=5;
		$pCount=M('shake_prize_content')->where($spMap)->count();
		$sPage = $monitor['winner_page'];
		$spAllPage=ceil($pCount / $sRow);
		if ($sPage > $spAllPage){
		    $sPage = $spAllPage;
		}
		$prizeContent=M('shake_prize_content')->where($spMap)->page ( $sPage, $sRow )->select();
		vendor ( "qqface" );
		foreach ($prizeContent as &$vv){
		    if ($vv['content']){
		        $vv['nickname']=get_username($vv['uid']);
		        $vv['headimgurl']=get_userface($vv['uid']);
		        $vv['content']=parseHtmlemoji($vv['content']);
		        $vv['content']=qqface_convert_html($vv['content']);
		    }
		}
		$returndata['speech']=$prizeContent;
		$this->ajaxReturn($returndata);
	}
	
	//开场页面
	function index(){
	    $id=$this->id;
	    $info=D('Addons://MiniLive/MiniLive')->getInfo($id);
	    $msgwall=D('Addons://MiniLive/MiniMsgwall')->getInfo($info['msgwall_id']);
	    $this->assign('album_cover',$info['album_cover']);
	    if ($msgwall['bg_img']){
	    	$bgPath=get_cover_url($msgwall['bg_img']);
	    }else{
	    	$bgPath=ADDON_PUBLIC_PATH.'/stage_bg.jpg';
	    }
	    $this->assign('bg_path',$bgPath);
	    $downloadConfig=C(DOWNLOAD_UPLOAD);
	    $f=M('file')->find($msgwall['music']);
	    if (!empty($f)){
	    	$musicPath=SITE_URL . '/Uploads/Download/'.$f['savepath'].$f['savename'];
// 	    	$musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f['savepath'].$f['savename'];
	    	$this->assign('music_path',$musicPath);
	    }
	    $gallery_pic=explode(',', $msgwall['gallery_pic']);
	    $this->assign('picArr',$gallery_pic);
	    $this->assign('logo',$msgwall['logo_img']);
		$this->assign('live_id',$id);
		$this ->display();
	}
	function getComment(){
	    $liveId=I('get.live_id');
	    $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveId);
	    $map['live_id']=$liveId;
	    $map['shake_count']=$monitor['shake_count']+1;
	    vendor ( "qqface" );
	    $list=M('msgwall_content')->where($map)->order('id desc')->limit(5)->select();
		foreach ($list as &$v){
	        $uid=get_uid_by_openid(true,$v['openid']);
			$user=getUserInfo($uid);
	        $v['headimgurl']=$user['headimgurl']?$user['headimgurl']:SITE_URL.'/Public/Home/images/default.png';
	        $v['name']=$user['nickname']?$user['nickname']:'匿名';
	        $v['content']=parseHtmlemoji($v['content']);
	        $v['content']=qqface_convert_html($v['content']);
	    }
// 		$data['content'] = "hello world";
// 		$data['headimgurl'] = "";
// 		$data['name'] = "Jacyxie";
// 		for($i=0;$i<5;$i++){
// 			$list[] = $data;
// 		}
		return $this -> ajaxReturn($list,'JSON');
	}
	function getPrizeUserByAjax(){

//  		$data['name'] = "jacyxie";
//  		$data['img'] = "";
// 		$data['count'] = 300;
// 		$data['totalCount'] = 300;
// 		$list_data[] = $data;
// 		$list_data[] = $data;
// 		$list_data[] = $data;
// 		$this->ajaxReturn($list_data,'JSON');
		
		
		$liveId=$this->id;
		$liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($liveId);
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveId);
		$shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
		$shakeCount=$monitor['shake_count']+1;
		//获取参与用户
		$map['live_id']=$liveId;
		$map['shake_count']=$shakeCount;
		$map['shake_id']=$liveInfo['shake_id'];
		$map['join_count']=array('gt',0);
		$shakeDao=D('Addons://MiniLive/MiniShake');
		$userdata=M('shake_user_attend')->where($map)->field('uid')->order('join_count desc')->limit(10)->select();
		foreach ($userdata as $v){
			$shakeData=$userAttend= $shakeDao-> getUserShake($liveId,$liveInfo['shake_id'],$shakeCount,$v['uid']);
			$nickname=get_username($v['uid']);
			$rdata['name']=$nickname?$nickname:'匿名';
			$rdata['img']=get_userface($v['uid']);
			$rdata['count']=$shakeData['join_count'];
			$rdata['totalCount']=$shakeInfo['times'];
			$returnData[]=$rdata;
		}
// 		dump($returnData);
		$this->ajaxReturn($returnData);
		
		/*
	    $map['live_id']=I('live_id');
	    $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($map['live_id']);
	    $map['shake_count']=$monitor['shake_count']+1;
	    
		
		$map['token']=get_token();
		$map ['id'] = array (
		    'gt',
		    I ( 'last_id', 0, 'intval' )
		);
		// $map ['redbag_id'] = I ( 'redbag_id' );
		$info = M ( 'shake_prize_user' )->where ( $map )->order ( 'id asc' )->find ();
		if (empty ( $info )) {
		    echo 0;
		} else {
		    $user = getUserInfo ( $info ['uid'] );
		    $data ['img'] = $user ['headimgurl'];
		    $data ['name'] =$user['nickname'];
		    $awardInfo=D('Addons://MiniLive/MiniShake')->getPrize($info['award_id']);
		    $data ['prize'] = $awardInfo['prize_level'].$awardInfo['name'] .'一份';
		    $data ['last_id'] = $info ['id'];
		    $this -> ajaxReturn($data,'JSON');
		}
		*/
	}
	
	function playback(){
	    $id=$this->id;
	    $info=D('Addons://MiniLive/MiniLive')->getInfo($id);
	    //review_music
	    $downloadConfig=C(DOWNLOAD_UPLOAD);
	    $f1=M('file')->find($info['review_music']);
	    if (!empty($f1)){
	    	$musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f1['savepath'].$f1['savename'];
	    	$this->assign('bj_music_path',$musicPath);
	    }
	    $msgwall=D('Addons://MiniLive/MiniMsgwall')->getInfo($info['msgwall_id']);
	    if ($msgwall['bg_img']){
	    	$bgPath=get_cover_url($msgwall['bg_img']);
	    }else{
	    	$bgPath=ADDON_PUBLIC_PATH.'/stage_bg.jpg';
	    }
	    $this->assign('bg_path',$bgPath);
	    $downloadConfig=C(DOWNLOAD_UPLOAD);
	    $f=M('file')->find($msgwall['music']);
	    if (!empty($f)){
	    	$musicPath=SITE_URL . '/Uploads/Download/'.$f['savepath'].$f['savename'];
	    	// 	    	$musicPath=SITE_PATH.substr($downloadConfig['rootPath'],1).$f['savepath'].$f['savename'];
	    	$this->assign('music_path',$musicPath);
	    }
	    
// 	    $monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($id);
	    //回放图片
	    $picMap['live_id']=$id;
// 	    $picMap['shake_count']=$monitor['shake_count'];
	    $picData=M('mini_live_pic')->where($picMap)->getFields('id,media_id,cover_id');
	    
	    foreach ($picData as $vo){
	        if (empty($vo['cover_id'])){
	            $coverid=down_media($vo['media_id']);
	            if ($coverid){
	                $savedata['cover_id']=$coverid;
	                M('mini_live_pic')->where(array('id'=>$vo['id']))->save($savedata);
	                $gallery_pic[]=$coverid;
	            }
	        }else{
	            $gallery_pic[]=$vo['cover_id'];
	        }
	    }
	    foreach ($gallery_pic as $vv){
	    	$picurl=get_cover_url($vv);
	    	$imgSize=getimagesize($picurl);
	    	$gallery['img_url']=$picurl;
	    	$gallery['width']=$imgSize[0];
	    	$gallery['height']=$imgSize[1];
	    	$gallery_data[]=$gallery;
	    }
	    $this->assign('live_id',$id);
	    $this->assign('picArr',$gallery_data);
	    $this->assign('logo',$msgwall['logo_img']);
	    $this ->display();
	}
	
	function getStatusByAjax(){
		$liveId = $this->id;
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveId);
		$key='Wap_setDaoJiShu_'.$liveId ;
		$monitor['daoji']= S($key)===false ? 0:S($key);
		$this -> ajaxReturn($monitor,'JSON');
	}
	
	function getShakeUser(){
		$liveId=$this->id;
		$liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($liveId);
		$monitor=D('Addons://MiniLive/MiniMonitor')->getInfo($liveId);
		//$shakeInfo=D('Addons://MiniLive/MiniShake')->getInfo($liveInfo['shake_id']);
		$shakeCount=$monitor['shake_count']+1;
		//获取参与用户
		$map['live_id']=$liveId;
		$map['shake_count']=$shakeCount;
		$map['shake_id']=$liveInfo['shake_id'];
		$map['join_count']=array('gt',0);
		$userdata=M('shake_user_attend')->where($map)->order('join_count desc')->limit(3)->select();
		foreach ($userdata as $v){
			$rdata['img']=get_userface($v['uid']);
			$returnData[]=$rdata;
		}
// 		dump($returnData);
		$this->ajaxReturn($returnData);
	}
	
	//测试表情
	function testemoji(){
		vendor ( "emoji" );
		$text="/:love/:jump哈哈";
		$this->parseHtmlemoji($text);
		// 		$clean_text = emoji_docomo_to_unified($str);
	
		// 		$newstr=emoji_unified_to_html($clean_text);
		// 		echo '<p>'.$newstr.'</p>';
		$this->display('show');
	}
	
	

}
