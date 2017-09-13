<?php

namespace Addons\Reservation\Controller;
use Home\Controller\AddonsController;

class ReservationNumberController extends AddonsController{
	function _initialize() {
		parent::_initialize ();
		$res ['title'] = '预约号号管理';
		$res ['url'] = addons_url ( 'Reservation://ReservationNumber/lists' );
		$res ['class'] = 'current';
		$nav [] = $res;
		$this -> assign('nav',$nav);
	}
	
	function lists(){
		$reservation_num = I('reservation_num');
		$map['reservation_id'] = I('reservation_id');
		$model = $this->getModel ( 'reservation_number' );
		$list_data = $this->_get_model_list ( $model, 0, 'id asc', true );
		if($reservation_num){
			$map['reservation_num'] = $reservation_num;
		}else{
			$this -> assign('placeholder','请输入预约号查询');
		}
		$data = M('reservation_number') -> where($map)-> order('id asc') -> select();
		foreach($data as &$v){
			if($v['is_use']==1){
				$v['is_use'] = "<span style='color:#ea4106'>已预约<span>";
			}
		}
		$list_data['list_data'] =$data;
		$list_data['_page'] ="";
		$this->assign ( $list_data );
		$this->display ();
	}
	
	function add(){
		$reservation_id = I('get.reservation_id');
		$model = getModelByName ( 'reservation_number' );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		$type = I('type');
		$reservationInfo = M('reservation') -> find($reservation_id);
		$this -> assign('reservationInfo',$reservationInfo);
		$_POST['reservation_date'] = intval($reservationInfo['reservation_date']);
		$_POST['reservation_id'] = $reservation_id;
		$date = day_format($reservationInfo['reservation_date']);
		$date = str_replace('-','',$date);
		if (IS_POST) {
			
			// 获取模型的字段信息
			$_POST['reservation_num'] = str_replace('-','',$_POST['reservation_time']);
			$_POST['reservation_num'] = str_replace(' ','',$_POST['reservation_num']);
			$_POST['reservation_num'] = str_replace(':','',$_POST['reservation_num']);
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				//更新数量
				$this -> _addCount($reservation_id,I('type'));
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
	
	function edit(){
		$id || $id = I ( 'id' );
		$reservation_id = I ( 'get.reservation_id' );
		$model = getModelByName ( 'reservation_number' );
		$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
		$data || $this->error ( '数据不存在！' );
		
		$token = get_token ();
		if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
			$this->error ( '非法访问！' );
		}
		$reservationInfo = M('reservation') -> find($reservation_id);
		$this -> assign('reservationInfo',$reservationInfo);
		if (IS_POST) {
			$_POST['uid'] = $this->mid;
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $Model->save ()) {
				$this->_saveKeyword ( $model, $id );
				
				// 清空缓存
				method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'edit' );
				
				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'], $this->get_param ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this -> assign('model',$model);
			$this->display ('edit');
		}
	}
	
	
	//删除某天以及当天放号
	function del() {
		$model = getModelByName ( 'reservation_number' );
		$reservation_id = I('get.reservation_id');
		! empty ( $ids ) || $ids = I ( 'id' );
		! empty ( $ids ) || $ids = array_filter ( array_unique ( ( array ) I ( 'ids', 0 ) ) );
		! empty ( $ids ) || $this->error ( '请选择要操作的数据!' );
		
		$Model = M ( get_table_name ( $model ['id'] ) );
		$map ['id'] = array (
				'in',
				$ids 
		);
		
		$deleteInfos = $Model -> where ( $map ) -> select();
		//dump($map);
		if ($Model->where ( $map )->delete ()) {
			// 清空缓存
			method_exists ( $Model, 'clear' ) && $Model->clear ( $ids, 'del' );
			$this -> _delCount($reservation_id,$deleteInfos);
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败！' );
		}
	}
	
	function _addCount($reservation_id,$type){
		 $model = M('reservation');
		 $reservationInfo = $model -> find($reservation_id);
		 if($type==0){
			$model -> where(array('id'=>$reservation_id)) -> save(array('morning_count'=>$reservationInfo['morning_count']+1));
		 }else{
			 $model -> where(array('id'=>$reservation_id)) -> save(array('afternoon_count'=>$reservationInfo['afternoon_count']+1));	
		 }
		 
	}
	function _delCount($reservation_id,$deleteInfos){
		 $model = M('reservation');
		 $reservationInfo = $model -> find($reservation_id);
		 $morningCount = 0;
		 $afternoonCount = 0;
		 if($deleteInfos){
			foreach($deleteInfos as $v){
				if($v['type']==0){
					$morningCount++;
				}else{
					$afternoonCount++;
				}
			}	
		 }
		$model -> where(array('id'=>$reservation_id)) -> save(array('morning_count'=>$reservationInfo['morning_count']-$morningCount,'afternoon_count'=>$reservationInfo['afternoon_count']-$afternoonCount));
		 
	}

}
