<?php

namespace Addons\Reservation\Controller;
use Home\Controller\AddonsController;

class WapController extends AddonsController{
	function _initialize() {
		parent::_initialize ();
	}
	
	function lists(){
		$today = (date('Y-m-d',time()));
		$tomorrow =( date("Y-m-d",strtotime("+1 day")));
		$managerId = session('publicUid');
		$token = get_token();
		//dump($token);
		$todayDate = M('reservation') -> where(array('reservation_date'=>strtotime($today),'manager_id'=>$managerId,'token'=>$token)) -> select();
		if($todayDate){
			$dateId = $todayDate[0]['id'];
			$todayData = M('reservation_number') -> where(array('reservation_id'=>$dateId))-> order('id asc') -> select();
		}else{
			$todayData = array();
		}
		$tomorrowDate = M('reservation') -> where(array('reservation_date'=>strtotime($tomorrow),'manager_id'=>$managerId,'token'=>$token)) -> select();
		if($tomorrowDate){
			$t_dateId = $tomorrowDate[0]['id'];
			$tomorrowData = M('reservation_number') -> where(array('reservation_id'=>$t_dateId))-> order('id asc') -> select();
		}else{
			$tomorrowData = array();
		}
		$this->assign ('todayData',$todayData);
		$this->assign ('tomorrowData',$tomorrowData);
		$this->assign ('today',$today);
		$this->assign ('tomorrow',$tomorrow);
		$this->display ();
	}
	
	function doReservation(){
		$reservation_id = I('id');
		$numberDao = M('reservation_number');
		$info = $numberDao -> find($reservation_id);
		//dump($info);
		$this -> assign('info',$info);
		$this -> display();
	}
	function saveReservation(){
		$reservation_id = I('get.id');
		$data['name'] = I('post.name');
		$data['phone'] = I('post.phone');
		$data['desc'] = I('post.desc');
		$data['uid'] = $this -> mid;
		$data['is_use'] = 1;
		$data['use_time'] = time();
		$numberDao = M('reservation_number');
		
		if(empty($data['name'])){
			$res['result'] = "fail";
			$res['msg'] = "请填写姓名";
			$this -> ajaxReturn($res,'JSON');
			exit;
		}
		//dump( count($data['phone']));
		if(empty($data['phone'])){
			$res['result'] = "fail";
			$res['msg'] = "请填写手机号";
			$this -> ajaxReturn($res,'JSON');
			exit;
		}
		if(strlen($data['phone'])<11){
			$res['result'] = "fail";
			$res['msg'] = "请填写正确的手机号";
			$this -> ajaxReturn($res,'JSON');
			exit;
		}
		if(empty($data['desc'])){
			$res['result'] = "fail";
			$res['msg'] = "请填写病症描述";
			$this -> ajaxReturn($res,'JSON');
			exit;
		}
		
		if($numberDao->where(array('id'=>$reservation_id))->save($data)){
			$res['result'] = "success";
			$res['msg'] = "提交成功";
			$this -> ajaxReturn($res,'JSON');
		}else{
			$res['result'] = "fail";
			$res['msg'] = "提交失败";
			$this -> ajaxReturn($res,'JSON');	
		}
	}
	
	function my_reservation(){
		$follow_id = $map['uid'] = $this -> mid;
		$model = M('reservation_number');
		$list = $model -> where($map) -> select();
		$this -> assign('list_data',$list);
		$managerId = session('publicUid');
		$publicid = get_token_appinfo ( '', 'id' );
		$listsUrl = addons_url('Reservation://Wap/lists',array('publicid'=>$publicid,'publicUid'=>$managerId));
		$this -> assign('listUrl',$listsUrl);
		$this -> display();
	}
	
	function location(){
		$managerId = session('publicUid');
		$publicid = get_token_appinfo ( '', 'id' );
		$listsUrl = addons_url('Reservation://Wap/lists',array('publicid'=>$publicid,'publicUid'=>$managerId));
		$this -> assign('listsUrl',$listsUrl);
		$this -> display();
	}
	
}
