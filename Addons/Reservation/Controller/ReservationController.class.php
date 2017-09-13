<?php

namespace Addons\Reservation\Controller;
use Home\Controller\AddonsController;

class ReservationController extends AddonsController{
	function _initialize() {
		parent::_initialize ();
		$res ['title'] = '放号管理';
		$res ['url'] = addons_url ( 'Reservation://Reservation/lists' ,$this->get_param);
		$res ['class'] = 'current';
		$nav [] = $res;
		$this -> assign('nav',$nav);
	}
	
	function lists(){
		//打印 s数据
		//for($i=0;$i<48;$i++){
			//echo ($i * 1800).":".second_to_hour($i * 1800).'<br/>';	
		//}
		//$this -> assign('del_button',false);
		
		$map['manager_id'] = $this -> mid;
		session('common_condition', $map);
		
		$model = $this->getModel ( 'reservation' );
		$list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
		$numberModel = M('reservation_number');
		foreach ( $list_data ['list_data'] as &$vo ) {
			$morningCount = $vo['morning_count']; 
			$afternoonCount = $vo['afternoon_count'];
			$morningUseCount = $numberModel -> where(array('reservation_id'=>$vo['id'],'type'=>0,'is_use'=>1))->count();
			$afternoonUseCount = $numberModel -> where(array('reservation_id'=>$vo['id'],'type'=>1,'is_use'=>1))->count();
			$vo['morning_count'] ="放号数：".$morningCount.'<br/>已预约：'.$morningUseCount;
			$vo['afternoon_count'] ="放号数：".$afternoonCount.'<br/>已预约：'.$afternoonUseCount;
		}
		$this->assign ( $list_data );
		$today = (date('Y-m-d',time()));
		$tomorrow =( date("Y-m-d",strtotime("-1 day")));
		$managerId = $this -> mid;
		$token = get_token();
		//dump($token);
		$todayDate = M('reservation') -> where(array('reservation_date'=>strtotime($today),'manager_id'=>$managerId,'token'=>$token)) -> select();
		if($todayDate){
			$dateId = $todayDate[0]['id'];
			$todayAllCount = M('reservation_number') -> where(array('reservation_id'=>$dateId))-> count();
			$todayReCount = M('reservation_number') -> where(array('reservation_id'=>$dateId,'is_use'=>1))-> count();
		}else{
			$todayReCount = 0;
			$todayReCount = 0;
		}
		$this -> assign('todayReCount',$todayReCount);
		$this -> assign('todayAllCount',$todayAllCount);
		$tomorrowDate = M('reservation') -> where(array('reservation_date'=>strtotime($tomorrow),'manager_id'=>$managerId,'token'=>$token)) -> select();
		if($tomorrowDate){
			$dateId = $todayDate[0]['id'];
			$tomorrowAllCount = M('reservation_number') -> where(array('reservation_id'=>$dateId))-> count();
			$tomorrowReCount = M('reservation_number') -> where(array('reservation_id'=>$dateId,'is_use'=>1))-> count();
		}else{
			$tomorrowAllCount = 0;
			$tomorrowReCount = 0;
		}
		$this -> assign('tomorrowReCount',$tomorrowReCount);
		$this -> assign('tomorrowAllCount',$tomorrowAllCount);
		
		$allIdData = M('reservation') -> where(array('manager_id'=>$managerId,'token'=>$token)) -> field('id') -> select();
		foreach($allIdData as $v){
			$allIds[] = $v['id'];
		}
		$getids = implode(',', $allIds);
		$getid = is_array($allIds) ? $getids : $allIds;
		if($getid){
			$map3['reservation_id'] = array ('in',$getid);
		
			$map3['is_use'] = 1;

			$allReCount = M('reservation_number') -> where($map3)-> count();
		}else{
			$allReCount =0;
		}
		$this -> assign('allReCount',$allReCount);
		
		$this->display ();
	}
	function add(){
		$reservation_date = I('reservation_date');
		$map['reservation_date'] = strtotime($reservation_date);
		$map['manager_id'] = $this->mid;
		$map['token'] = get_token();
		$model = getModelByName ( 'reservation' );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		$_POST['manager_id'] = $map['manager_id'];
		$_POST['token'] = get_token();
		if (IS_POST) {
			$res = M('reservation') -> where($map) -> select();
			if($res){
				$this->error ("该天已经放号,需要编辑放号请进入详情进行编辑");
			}
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				$this -> _saveReservationNumberList($id,$reservation_date,$_POST);
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'], $this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$this -> assign('model',$model);
			$fields = get_model_attribute ( $model ['id'] );
			$this->assign ( 'fields', $fields );
			//dump($fields);
			$this->display ();
		}
	}
	
	function _saveReservationNumberList($reservation_id,$reservation_date,$postData){
		$morning_count = $postData['morning_count'];
		$afternoon_count = $postData['afternoon_count'];
		$amSec = $postData['am_end_time'] - $postData['am_start_time'];
		$pmSec = $postData['pm_end_time'] - $postData['pm_start_time'];
		$amDiff = intval(floor($amSec/$morning_count));
		$pmDiff = intval(floor($pmSec/$afternoon_count));
		$rModel = M('reservation_number');
		$map['reservation_date'] = strtotime($reservation_date);
		$map['reservation_id'] = $reservation_id;
		for($i=0;$i<$morning_count;$i++){
			$data = $map;
			$data['type'] = 0;
			$numStr = str_replace("-","",$reservation_date);
			$time = str_replace(':','',second_to_hour_en($postData['am_start_time']+$amDiff*$i));
			$data['reservation_num'] = $numStr.$time;
			$data['reservation_time'] = $map['reservation_date']+$postData['am_start_time']+$amDiff*$i;
			$rModel -> add($data);
		}
		for($k=1;$k<=$afternoon_count;$k++){
			$data = $map;
			$data['type'] = 1;
			$numStr = str_replace("-","",$reservation_date);
			$time = str_replace(':','',second_to_hour_en($postData['pm_start_time']+$pmDiff*$k));
			$data['reservation_num'] = $numStr.$time;
			$data['reservation_time'] = $map['reservation_date']+$postData['pm_start_time']+$pmDiff*$k;
			$rModel -> add($data);
		}
	}
	
	//删除某天以及当天放号
	function del() {
		$model = $this->getModel ( $model );
		
		! empty ( $ids ) || $ids = I ( 'id' );
		! empty ( $ids ) || $ids = array_filter ( array_unique ( ( array ) I ( 'ids', 0 ) ) );
		! empty ( $ids ) || $this->error ( '请选择要操作的数据!' );
		
		$Model = M ( get_table_name ( $model ['id'] ) );
		$map ['id'] = array (
				'in',
				$ids 
		);
		
		// 插件里的操作自动加上Token限制
		$token = get_token ();
		if (defined ( 'ADDON_PUBLIC_PATH' ) && ! empty ( $token )) {
			$map ['token'] = $token;
			$map ['manager_id'] = $this -> mid;
		}
		if ($Model->where ( $map )->delete ()) {
			// 清空缓存
			method_exists ( $Model, 'clear' ) && $Model->clear ( $ids, 'del' );
			$this -> _deleteReservationNumber($ids);
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败！' );
		}
	}
	function _deleteReservationNumber($ids){
		$map ['reservation_id'] = array (
				'in',
				$ids 
		);
		M('reservation_number') -> where($map) -> delete();
	}	
	
	//链接管理
	function link_manage(){
		$info = get_token_appinfo ();
		$param ['publicid'] = $info ['id'];
		$param ['publicUid'] = get_mid();
		$reservation_list_url = addons_url('Reservation://Wap/lists',$param);
		$urlList[0]['url'] = $reservation_list_url;
		$urlList[0]['desc'] = "预约号列表（显示最近两天的），用户可以在上面选择预约号进行预约(请复制使用)";
		
		$my_url = addons_url('Reservation://Wap/my_reservation',$param);
		$urlList[1]['url'] = $my_url;
		$urlList[1]['desc'] = "个人预约记录，供用户查看自己已经预约过的信息(请复制使用)";
		
		$location_url = addons_url('Reservation://Wap/location',$param);
		$urlList[2]['url'] = $location_url;
		$urlList[2]['desc'] = "导航链接，将跳转到腾讯地图(请复制使用)";
		$this -> assign('urlList',$urlList);
		$this -> display();
	}
}
