<?php

namespace Scene\Controller;

use Think\Controller;

class IndexController extends Controller {
	
	public function index() {
		$mid = intval(session('mid'));
		if(!$mid){
			redirect(U('home/user/login'));
		}
		$sysinfo=M('sys')->order('id asc')->find();	
		$sysinfo['web_title'] =	$sysinfo['web_title'] ? trim($sysinfo['web_title'] ):'一秀免费移动场景应用自营销管家';
		$sysinfo['is_open_reg'] =	isset($sysinfo['is_open_reg']) ? intval($sysinfo['is_open_reg'] ):1;
		
		$sysinfo['qi_ad_xds'] =	isset($sysinfo['qi_ad_xds']) ? intval($sysinfo['qi_ad_xds'] ):90;
		$this->assign('sys', $sysinfo); 
		//使用index下的模板
		$this->display();
	}
	public function jumpgo() {
		header ( "Location: " . I ( "get.url" ) );
	}
	public function login(){
		header('Content-type: text/json');
		header('HTTP/1.1 401 Unauthorized');
		echo json_encode(array("success" => false,"code"=> 1001,"msg" => "请先登录!","obj"=> null,"map"=> null,"list"=> null));
		//header('HTTP/1.1 200 ok');
		//echo json_encode(array("success" => true,"code"=> 200,"msg" => "success","obj"=> null,"map"=> null,"list"=> null));
    }
	public function test(){
		echo '<br/>';
	}
}