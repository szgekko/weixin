<?php

namespace Addons\MiniLive\Controller;
use Home\Controller\AddonsController;

class ShakeController extends AddonsController{
    function lists() {
        $model = $this->getModel ( 'mini_shake' );
        $list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
        $this->assign($list_data);
        $this->display();
    }
    
    function add() {
        $model = $this->getModel ( 'mini_shake' );
        $this->assign('post_url',U('add',$this->get_param));
        if (IS_POST) {
            $Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
            // 获取模型的字段信息
            $Model = $this->checkAttr ( $Model, $model ['id'] );
            if ($Model->create () && $id = $Model->add ()) {
                $this->_add_award($id, $_POST);
                // 清空缓存
                method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'add' );
                $this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'], $this->get_param ) );
            } else {
                $this->error ( $Model->getError () );
            }
        } else {
            $fields = get_model_attribute ( $model ['id'] );
            $this->assign ( 'fields', $fields );
            $this->display ( 'edit' );
        }
    }
    function edit() {
        $id = I ( 'id' );
        $model = $this->getModel ( 'mini_shake' );
        if (IS_POST) {
            $Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
            // 获取模型的字段信息
            $Model = $this->checkAttr ( $Model, $model ['id'] );
            $res = false;
			$Model->create () && $res=$Model->save ();
			if ($res !== false) {
			    $this->_add_award($id, $_POST);
                D ( 'Addons://MiniLive/MiniShake' )->clear ( $id );
                $this->success('保存' . $model['title'] . '成功！', U('lists?model=' . $model['name'], $this->get_param));
            } else {
                $this->error ( $Model->getError () );
            }
        } else {
            // 获取数据
            $data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
            $data || $this->error ( '数据不存在！' );
            $token = get_token ();
            if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
                $this->error ( '非法访问！' );
            }
            $this->assign ( 'data', $data );
            $fields = get_model_attribute ( $model ['id'] );
            $this->assign ( 'fields', $fields );
            $awardList=D ( 'Addons://MiniLive/MiniShake' )->getAwardlists($id);
            $this->assign('award_list',$awardList);
            $this->display ();
        }
    }
    
    function _add_award($shakeId,$postData){
        $awardIdArr=$postData['award_id'];
         
        $gradeArr=$postData['grade'];
        $numArr=$postData['num'];
        $orderArr=$postData['order'];
        $awardDao=D ( 'Addons://Draw/Award' );
        $map['shake_id']=$shakeId;
        $map['token']= get_token();
        $map['is_del']=0;
        $lotteryData=M('mini_shake_award')->where($map)->getFields('award_id,id,prize_level,number,order');
        $order_num=1;
        foreach ($awardIdArr as $awardId){
            if ($lotteryData[$awardId]){
                //保存
                $saveData['prize_level']=$gradeArr[$awardId];
                $saveData['number']=$numArr[$awardId];
                $saveData['order']=$order_num;
                $map['award_id']=$awardId;
                $res=M('mini_shake_award')->where($map)->save($saveData);
            }else{
                //添加
                $addData['shake_id']=$shakeId;
                $addData['award_id']=$awardId;
                $addData['token']=$map['token'];
                $addData['prize_level']=$gradeArr[$awardId];
                $addData['number']=$numArr[$awardId];
                $addData['order']=$order_num;
                $addData['is_del']=0;
                $addDatas[]=$addData;
            }
            $order_num++;
        }
        if (!empty($addDatas)){
            $res=M('mini_shake_award')->addAll($addDatas);
        }
         
        foreach ($lotteryData as $key=>$v){
            if (!in_array($key, $awardIdArr)){
                $ids[]=$v['id'];
            }
        }
        if (!empty($ids)){
            $map1['id']=array('in',$ids);
            $savedel['is_del']=1;
            $res=M('mini_shake_award')->where($map1)->save($savedel);
        }
        $key = 'MiniShake_getAwardlists_' . $shakeId;
        $info = S ( $key ,null);
        return $res;
    }
    
    function prize_lists(){
    	$this->assign('add_button',false);
    	$this->assign('del_button',false);
    	$this->assign('search_button',false);
    	$this->assign('check_all',false);
		$grids['fields']=array(
				'shake_name',
				'live_id',
				'nickname',
				'award_id',
				'prize_level',
				'cTime',
				'ranking',
				'join_count',
				'state'
		);
		$grids['list_grids']['shake_name']=array(
				'field'=>'shake_name',
				'title'=>'摇摇游戏'
		);
		$grids['list_grids']['live_id']=array(
				'field'=>'live_id',
				'title'=>'现场活动'
		);
		
		$grids['list_grids']['nickname']=array(
				'field'=>'nickname',
				'title'=>'用户名'
		);
		$grids['list_grids']['award_id']=array(
				'field'=>'award_id',
				'title'=>'奖品名'
		);
		$grids['list_grids']['prize_level']=array(
				'field'=>'prize_level',
				'title'=>'奖项等级'
		);
		$grids['list_grids']['cTime']=array(
				'field'=>'cTime',
				'title'=>'中奖时间'
		);
		$grids['list_grids']['ranking']=array(
				'field'=>'ranking',
				'title'=>'排名'
		);
		$grids['list_grids']['join_count']=array(
				'field'=>'join_count',
				'title'=>'摇摇次数'
		);
		$grids['list_grids']['state']=array(
				'field'=>'state',
				'title'=>'状态'
		);
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		$row=20;
		$liveId=I('live_id');
		$shakeId=I('id');
		if ($shakeId){
			$map['shake_id']=$shakeId;
		}
		if ($liveId){
			$map['live_id']=$liveId;
			
		}
		$map['token']=get_token();
    	$datas=M('shake_prize_user')->where($map)->order ( 'id desc' )->page ( $page, $row )->select ();
    	$awardlists=D('Addons://MiniLive/MiniShake')->getAwardlists($map['shake_id']);
    	foreach ($awardlists as $vo){
    		$awards[$vo['id']]=$vo;
    	}
    	$liveDao=D('Addons://MiniLive/MiniLive');
    	$ShakeDao=D('Addons://MiniLive/MiniShake');
    	foreach ($datas as &$v){
    		$liveId=$v['live_id'];
    		$liveInfo=$liveDao->getInfo($v['live_id']);
    		$v['live_id']=$liveInfo['title'];
    		$shakeInfo=$ShakeDao->getInfo($v['shake_id']);
    		$v['shake_name']=$shakeInfo['title'];
    		$v['nickname']=get_username($v['uid']);
    		$prize=$awards[$v['award_id']];
    		$v['award_id']=$prize['name'];
    		$v['prize_level']=$prize['prize_level'];
    		$v['cTime']=time_format($v['cTime']);
    		$v['ranking']='第'.$v['ranking'].'名';
    		$v['join_count']=0;
    		$changeUrl=U('changeState',array('state'=>$v['state'],'prize_id'=>$v['id']));
    		$v['state']=$v['state']==0?'<a href='.$changeUrl.' >未兑换</a>':'<a href='.$changeUrl.' >已兑换</a>';
    		
    		$map1['live_id']=$liveId;
    		$map1['shake_id']=$v['shake_id'];
    		$map1['uid']=$v['uid'];
    		$map1['shake_count']=$v['shake_count'];
    		$v['join_count']=M('shake_user_attend')->where($map1)->getField('join_count');
    	}
    	$grids['list_data']=$datas;
    	$this->assign($grids);
		$this->display('lists');
    }
    function changeState(){
    	$state=I('state',0,'intval');
    	$id=I('prize_id');
    	if ($state == 0){
    		$save['state']=1;
    		$save['djtime']=time();
    	}else{
    		$save['state']=0;
    	}
    	$res=M('shake_prize_user')->where(array('id'=>$id))->save($save);
    	if ($res){
    		$this->success('修改成功');
    	}
    }
}
