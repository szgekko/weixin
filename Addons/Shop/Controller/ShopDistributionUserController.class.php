<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class ShopDistributionUserController extends BaseController {
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop_distribution_user' );
		parent::_initialize ();
	}
	function lists() {
	    $this->assign('add_button',false);
		$this->assign('del_button',false);
		$this->assign('check_all',false);
	    $param['mdm']=$_GET['mdm'];
	    $res['title']='个人渠道';
	    $res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
	    $res ['class'] = _ACTION == 'lists' ? 'current' : '';
	    $nav[]=$res;
	    $res['title']='粉丝统计';
	    $res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
	    $res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
	    $nav[]=$res;
// 	    $res['title']='提成统计';
// 	    $res['url']=addons_url('Shop://ShopDistributionUser/profit_details',$param);
// 	    $res ['class'] = _ACTION == 'profit_details' ? 'current' : '';
// 	    $nav[]=$res;
	    $config = get_addon_config('Shop');
	    if ($config['need_distribution'] == 1){
	    	$res['title']='提现中心';
	    	$res['url']=addons_url('Shop://ShopDistributionUser/cashout_log_lists',$param);
	    	$res ['class'] = _ACTION == 'cashout_log_lists' ? 'current' : '';
	    	$nav[]=$res;
	    }
	    
	    $this->assign('nav',$nav);
	    
		$map ['token'] = get_token ();
		$did=I('did',0,'intval');
		if ($did){
			$duser = M('shop_distribution_user')->find($did);
			$lmap['uid|upper_user']=$duser['uid'];
			$uids=M('shop_user_level_link')->where($lmap)->getFields('uid');
			if ($duser['level'] == 1){
				$lmap['uid|upper_user']=array('in',$uids);
				$uids=M('shop_user_level_link')->where($lmap)->getFields('uid');
				$lmap['uid|upper_user']=array('in',$uids);
			}
			foreach ($uids as $k=>$u){
				if ($u != $duser['uid']){
					$uidArr[]=$u;
				}
			}
			if (!empty($uidArr)){
				$map['uid']=array('in',$uidArr);
			}
			
		}
		
		
		$levelkey=I('level_key',0,'intval');
		if ($levelkey){
			$map['level']=$levelkey;
		}
		$isCTime=I('is_ctime');
		if ($isCTime){
		    $startVal=I('start_ctime',0,'strtotime');
		    $endVal=I('end_ctime',0,'strtotime');
		    $endVal= $endVal==0?0:$endVal+ 86400 -1;
		    if($startVal && $endVal){
		        $startVal<$endVal && $map['ctime']=array('between',array($startVal,$endVal));
		        $startVal>$endVal && $map['ctime']=array('between',array($startVal,$endVal));
		        $startVal==$endVal && $map['ctime']=array('egt',$startVal);
		    }else if (!empty($startVal)){
		        $map['ctime']=array('egt',$startVal);
		    }else if (!empty($endVal)){
		        $map['ctime']=array('elt',$endVal );
		    }
		}
		$search=$_REQUEST['truename'];
		if ($search) {
		    $this->assign ( 'search', $search );
		    
		    $map1 ['truename'] = array (
		        'like',
		        '%' . htmlspecialchars ( $search ) . '%'
		    );
		    $truename_follow_ids = D ( 'Common/User' )->where ( $map1 )->getFields ( 'uid' );
// 		    $truename_follow_ids = implode ( ',', $truename_follow_ids );
		    if (! empty ( $truename_follow_ids )) {
		        $map ['uid'] = array (
		            'in',
		             $truename_follow_ids 
		        );
		    }else{
		        $map['id']=0;
		    }
		        
		    unset ( $_REQUEST ['truename'] );
		}
		$map['is_delete']=0;
		session ( 'common_condition', $map );
		$list_data = $this->_get_model_list ( $this->model );
		$typeName=$this->_get_level_name();
		$dDao = D('Addons://Shop/Distribution');
		foreach ( $list_data ['list_data'] as &$vo ) {
			$vo['level_key']=$vo['level'];
			if ($vo['is_audit'] == 2){
				$vo['level'] = '审核未通过';
			}else{
				$vo['level']=empty($vo['level'])?'未审核':$typeName[$vo['level']];
			}
		    $user=get_userinfo($vo['uid']);
		    $duid=$vo['uid'];
		    $vo['truename']=$user['truename'];
		    $vo['uid']=$user['nickname'];
		    $vo['mobile']=$user['mobile'];
		    $param['id']=$vo['id'];
		    $param['enable']=$vo['enable'];
		    $url=addons_url('Shop://ShopDistributionUser/changeEnable',$param);
		    $vo['enable']=$vo['enable']=='0'?"<a  title='点击切换为启用' href='$url'>已禁用</a>":"<a href='$url' title='点击切换为禁用'>已启用</a>";
		    if (! empty ( $vo ['qr_code'] )) {
// 		        $vo ['qr_code'] = "<a target='_blank' href='{$vo[qr_code]}'><img src='{$vo[qr_code]}' class='list_img'></a>";
		        continue;
		    }
		    $res = D ( 'Home/QrCode' )->add_qr_code ( 'QR_LIMIT_SCENE', 'Shop', $duid );
		    if (! ($res < 0)) {
		        $map2 ['id'] = $vo ['id'];
		        M ( 'shop_distribution_user' )->where ( $map2 )->setField ( 'qr_code', $res );
		        $vo ['qr_code'] = $res;
		        $dDao -> getDistributionUser($duid,true);
// 		        $vo ['qr_code'] = "<a target='_blank' href='{$vo[qr_code]}'><img src='{$vo[qr_code]}' class='list_img'></a>";
		    }
		}
		unset($list_data['list_grids']['is_audit']);
		$this->assign('typeName',$typeName);
// 		dump($list_data['list_data']);
		$this->assign ( $list_data );
		$this->assign('model',$this->model ['id'] );
		$templateFile = $this->model ['template_list'] ? $this->model ['template_list'] : '';
		$this->display ( $templateFile );
	}
	
	function edit() {
		$id = I('id','0','intval');
		if (IS_POST) {
// 		    $_POST['ctime']=time();
		    $this->_checkData($_POST,$id);
		    $res=$this->_saveUserInfo($_POST['uid'], $_POST['truename'], $_POST['mobile']);
		    
            $Model = D(parse_name(get_table_name($this->model['id']), 1));
            if ($Model->create() && $Model->save()) {
            	D('Addons://Shop/Distribution')->getDistributionUser($_POST['uid'],true);
//                 $this->_saveKeyword($this->model, $id);
            }
            // 清空缓存
            method_exists($Model, 'clear') && $Model->clear($id, 'edit');
            $this->success ( '保存' . $this->model ['title'] . '成功！' ,U('lists?model=' . $this->model['name'],$this->get_param));
		} else {
			$fields = get_model_attribute ( $this->model ['id'] );
			$cshop=$this->_get_coupon_shop();
			$this->assign('coupon_shop',$cshop);
			// 获取数据
			$data = M('shop_distribution_user')->find($id);
			$userinfo=get_userinfo($data['uid']);
			$data['truename']=$userinfo['truename'];
			$data['mobile']=$userinfo['mobile'];
			$data['nickname']=$userinfo['nickname'];
			$data['userimg']=$userinfo['headimgurl'];
			$data || $this->error ( '数据不存在！' );
			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->assign('is_edit',1);
			$this->display ();
		}
	}
	public function add()
	{
	    if (IS_POST) {
// 	        $_POST['ctime']=time();
	        $this->_checkData($_POST);
	        //添加二维码
	        $res=$this->_saveUserInfo($_POST['uid'], $_POST['truename'], $_POST['mobile']);
	        
	        $Model = D(parse_name(get_table_name($this->model['id']), 1));
	        // 获取模型的字段信息
	        $Model = $this->checkAttr($Model, $this->model['id']);
	        if ($res && $Model->create() && $id = $Model->add()) {
	            // 清空缓存
	            method_exists($Model, 'clear') && $Model->clear($id, 'add');
	
	            $this->success('添加' . $this->model['title'] . '成功！', U('lists?model=' . $this->model['name'],$this->get_param));
	        } else {
	            $this->error($Model->getError());
	        }
	    } else {
	        $cshop=$this->_get_coupon_shop();
	        $this->assign('coupon_shop',$cshop);
	        $fields = get_model_attribute($this->model['id']);
	        $this->assign('fields', $fields);
	        $this->assign('is_edit',0);
	        $this->display('edit');
	    }
	}
	function _get_coupon_shop(){
	    $map['manager_id']=$this->mid;
	    $map['token']=get_token();
	    $cShop=M('coupon_shop')->where($map)->getFields('id,name');
	    return $cShop;
	}
	function _checkData($data,$id=0){
	    if (empty($data['truename'])){
	        $this->error('真实名字不能为空!');
	    }
	    if (empty($data['mobile'])){
	        $this->error('手机号码不能为空!');
	    }
	    if (!preg_match('/^\d{11}$/', $data['mobile'])) {
	        $this->error ( '请输入正确的手机号码!' );
	    }
	    if (empty($data['uid'])){
	        $this->error('请指定微信名称');
	    }
	    $map['token']=get_token();
	    if (!$id){
	        $map['uid']=$data['uid'];
	        $res=M('shop_distribution_user')->where($map)->getField('uid');
	        if ($res){
	            $this->error('该微信名称已经存在！');
	        }
	    }else{
	        $users=M('shop_distribution_user')->where($map)->getFields('id,uid');
    	    foreach ($users as $k=>$u){
    	        if ($k != $id){
    	            if ($data['uid']==$u){
    	                $this->error('该微信名称已经存在！');
    	            }
    	        }
    	    }
	    }
	}
	function _saveUserInfo($uid,$truename,$mobile){
	    $map['uid']=$uid;
	    $save['truename']=$truename;
	    $save['mobile']=$mobile;
	    $res=D ( 'Common/User' )->where($map)->save($save);
	    D ( 'Common/User' )->getUserInfo ( $uid, true );
	    
	    return $res;
	}
	
	function changeEnable(){
	    $map['id']=I('id');
	    $enable=I('enable');
	    $save['enable']=1-$enable;
	    $res=M('shop_distribution_user')->where($map)->save($save);
	    if ($res){
	        $this->success('切换成功',U('lists?model=' . $this->model['name']));
	    }
	}
	
	function statistics_lists(){
	    $param['mdm']=$_GET['mdm'];
	    $res['title']='个人渠道';
	    $res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
	    $res ['class'] = _ACTION == 'lists' ? 'current' : '';
	    $nav[]=$res;
	    $res['title']='粉丝统计';
	    $res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
	    $res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
	    $nav[]=$res;
// 	    $res['title']='提成统计';
// 	    $res['url']=addons_url('Shop://ShopDistributionUser/profit_details',$param);
// 	    $res ['class'] = _ACTION == 'profit_details' ? 'current' : '';
// 	    $nav[]=$res;

	    $config = get_addon_config('Shop');
	    if ($config['need_distribution'] == 1){
	    	$res['title']='提现中心';
	    	$res['url']=addons_url('Shop://ShopDistributionUser/cashout_log_lists',$param);
	    	$res ['class'] = _ACTION == 'cashout_log_lists' ? 'current' : '';
	    	$nav[]=$res;
	    }
	    $this->assign('nav',$nav);
	    
	    $this->assign('add_button',false);
	    $this->assign('del_button',false);
	    $this->assign('check_all',false);
	    $this->assign('search_button',false);
// 	    $model=$this->getModel('shop_distribution_user');
// 	    $list_data = $this->_get_model_list ( $model );
// 	    dump($list_data);
	    $grid ['field']  = 'id';
	    $grid ['title'] = '序号';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'truename';
	    $grid ['title'] = '分销用户';
	    $list_grids [] = $grid;
	    
	    $grid ['field'] = 'follow_count';
	    $grid ['title'] = '关注量';
	    $list_grids [] = $grid;
	    
	    $grid ['field'] = 'male';
	    $grid ['title'] = '男性';
	    $list_grids [] = $grid;
	    
	    $grid ['field'] = 'fmale';
	    $grid ['title'] = '女性';
	    $list_grids [] = $grid;
	    
	    $grid ['field'] = 'ids';
	    $grid ['title'] = '查看详情';
	    $list_grids [] = $grid;
	    
	    $list_data ['list_grids'] = $list_grids;
	    $isCTime=I('is_ctime');
	    if ($isCTime){
	        $startVal=I('start_ctime',0,'strtotime');
	        $endVal=I('end_ctime',0,'strtotime');
	        $endVal= $endVal==0?0:$endVal+ 86400 -1;
	        if($startVal && $endVal){
	            $startVal<$endVal && $map['ctime']=array('between',array($startVal,$endVal));
	            $startVal>$endVal && $map['ctime']=array('between',array($startVal,$endVal));
	            $startVal==$endVal && $map['ctime']=array('egt',$startVal);
	        }else if (!empty($startVal)){
	            $map['ctime']=array('egt',$startVal);
	        }else if (!empty($endVal)){
	            $map['ctime']=array('elt',$endVal );
	        }
	    }
	    session ( 'common_condition', $map );
	    $model=$this->getModel('shop_distribution_user');
	    $user_data = $this->_get_model_list ( $model );
	    $data=$user_data['list_data'];
	    //获取关注量
	    $map1['token']=get_token();
	    $followData=M('shop_statistics_follow')->where($map1)->field('uid,duid')->select();
	    $token=get_token();
	    foreach ($followData as $f){
	        $userinfo = get_userinfo($f['uid']);
	        if ($userinfo['has_subscribe'][$token] ==1){
	            $fcount[$f['duid']] += 1;
	        }
	        
	    }
	    //获取用户带来的粉丝
	    $fusers=M('shop_statistics_follow')->where($map1)->getFields('uid,duid');
	    $male=0;
	    $fmale=0;
	
	    foreach ($fusers as $k=>$fu){
	        $userinfo = get_userinfo($k);
	        if ($userinfo['has_subscribe'][$token] ==1){
	            if ($userinfo['sex']==1){
	                //男
	                $countbysex[$fu]['mcount'] +=1;
	                $male+=1;
	            }else if ($userinfo['sex']==2){
	                //女
	                $countbysex[$fu]['fcount'] +=1;
	                $fmale+=1;
	            }
	        }
	       
	    }
	    $sexcount['male']=$male;
	    $sexcount['fmale']=$fmale;
	    $this->assign('pieSexCount',$sexcount);
	    $param['mdm']=$_GET['mdm'];
	    foreach ( $data as &$vo ) {
	        $user=get_userinfo($vo['uid']);
	        $vo['truename']=$user['truename'];
	        $vo['follow_count']=intval($fcount[$vo['uid']]);
	        
	        $userArr[]="'".$vo['truename']."'";
	        $fcountArr[]=$vo['follow_count'];
	        
	        $vo['male']=intval($countbysex[$vo['uid']]['mcount']);
	        $vo['fmale']=intval($countbysex[$vo['uid']]['fcount']);
	        $url=addons_url("Shop://ShopDistributionUser/show_details",array('duid'=>$vo['uid'],'mdm'=>$_GET['mdm']));
	        $param['duid']=$vo['uid'];
	        $furl=addons_url('Shop://ShopDistributionUser/get_user_from',$param);
	        if ($vo['follow_count'] >0){
	        	$vo['ids']="<a data-duid='".$vo['uid']."' class='details' href='$url'>查看详情</a>
	        	<a data-duid='".$vo['uid']."' class='details' href='$furl'>粉丝详情</a>
	        	";
	        }else{
	        	$vo['ids']="";
	        }
	        
	    }
	   
	    $highcharts['xAxis']=implode(',', $userArr);
	    $highcharts['series']=implode(',', $fcountArr);
	    $this->assign('highcharts',$highcharts);
	    
	    $list_data['list_data']=$data;
	    $this->assign ( $list_data );
	    
	    $templateFile = $this->model ['template_list'] ? $this->model ['template_list'] : '';
	    $this->display ( $templateFile );
	}
	//粉丝统计
	function show_details(){
	    $param['mdm']=$_GET['mdm'];
	    $res['title']='个人渠道';
	    $res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
	    $res ['class'] = _ACTION == 'lists' ? 'current' : '';
	    $nav[]=$res;
	    $res['title']='粉丝统计';
	    $res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
	    $res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
	    $nav[]=$res;
	    
// 	    $res['title']='提成统计';
// 	    $res['url']=addons_url('Shop://ShopDistributionUser/profit_details',$param);
// 	    $res ['class'] = _ACTION == 'profit_details' ? 'current' : '';
// 	    $nav[]=$res;
	    
	    $res['title']='查看详情数据';
	    $res['url']=addons_url('Shop://ShopDistributionUser/show_details',$param);
	    $res ['class'] = _ACTION == 'show_details' ? 'current' : '';
	    $nav[]=$res;
	    
	    $this->assign('nav',$nav);
	    
	    $this->assign('add_button',false);
	    $this->assign('del_button',false);
	    $this->assign('check_all',false);
	    $this->assign('search_button',false);
	    
	    $grid ['field']  = 'truename';
	    $grid ['title'] = '用户名';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'card_member';
	    $grid ['title'] = '会员卡';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'theday';
	    $grid ['title'] = '日期';
	    $list_grids [] = $grid;
	     
	    $grid ['field']  = 'fcount';
	    $grid ['title'] = '女';
	    $list_grids [] = $grid;
	     
	    $grid ['field'] = 'mcount';
	    $grid ['title'] = '男';
	    $list_grids [] = $grid;
	     
	    $grid ['field'] = 'num';
	    $grid ['title'] = '关注量';
	    $list_grids [] = $grid;
	    $list_data ['list_grids'] = $list_grids;
	    
	    $map['duid'] = I('duid');
	    $map['token']=get_token();
// 	    $fcount1=M('shop_statistics_follow')->where($map)->group("from_unixtime(ctime,'%Y-%m-%d')")->getFields("from_unixtime(ctime,'%Y-%m-%d') theday,count(uid) num");
	    $fusers=M('shop_statistics_follow')->where($map)->getFields("uid,from_unixtime(ctime,'%Y-%m-%d') date");
// 	    $fcount=0;
        $token=get_token();
        $userinfo=get_userinfo($map['duid']);
        
        $username=$userinfo['truename'];
        $map1['uid']=$map['duid'];
        $cardMember=M('card_member')->where($map1)->find();
        if ($cardMember['number']){
            $cardLevel=D('Addons://Card/CardLevel')->getCardMemberLevel($map['duid']);
            $card=$cardMember['number'].'<br/>'.$cardLevel['level'];
        }
        
	    foreach ($fusers as $k=>$v){
	        $user=get_userinfo($k);
	        if ($user['has_subscribe'][$token] ==1){
	            $fcount[$v['date']]['theday']=$v['date'];
	            $fcount[$v['date']]['num']+=1;
	            if ($user['sex'] == 1){
	                $sexcount[$v['date']]['mcount'] +=1;
	            }else if($user['sex'] ==2){
	                $sexcount[$v['date']]['fcount'] +=1;
	            }
	        }
	    }
	    foreach ($fcount as $key=>$vo){
	        $vo['card_member']=$card;
	        $vo['truename']=$username;
	        $vo['mcount']=intval($sexcount[$key]['mcount']);
	        $vo['fcount']=intval($sexcount[$key]['fcount']);
	        $vo['num']=intval($vo['num']);
	        $data[]=$vo;
	    }
	    $list_data['list_data']=$data;
	    $this->assign ( $list_data );
	    $this->display();
// 	    $this->ajaxReturn($fcount);
	}
	
	//提成统计
	function profit_details(){
	    $param['mdm']=$_GET['mdm'];
	    $res['title']='个人渠道';
	    $res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
	    $res ['class'] = _ACTION == 'lists' ? 'current' : '';
	    $nav[]=$res;
	    $res['title']='粉丝统计';
	    $res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
	    $res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
	    $nav[]=$res;
	     
// 	    $res['title']='提成统计';
// 	    $res['url']=addons_url('Shop://ShopDistributionUser/profit_details',$param);
// 	    $res ['class'] = _ACTION == 'profit_details' ? 'current' : '';
// 	    $nav[]=$res;
	     
	    $this->assign('nav',$nav);
	     
	    $this->assign('add_button',false);
	    $this->assign('del_button',false);
	    $this->assign('check_all',false);
	    $this->assign('search_button',false);
	    
	    $grid ['field']  = 'id';
	    $grid ['title'] = '序号';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'truename';
	    $grid ['title'] = '用户姓名';
	    $list_grids [] = $grid;
	     
	    $grid ['field']  = 'card_member';
	    $grid ['title'] = '会员卡号';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'profit';
	    $grid ['title'] = '提成金额（￥）';
	    $list_grids [] = $grid;
	
	    $grid ['field'] = 'fcount';
	    $grid ['title'] = '增粉数量';
	    $list_grids [] = $grid;
	    
// 	    $grid ['field'] = 'fans_gift_money';
// 	    $grid ['title'] = '增粉赠送金额';
// 	    $list_grids [] = $grid;
	    
// 	    $grid ['field'] = 'fans_gift_score';
// 	    $grid ['title'] = '增粉赠送积分';
// 	    $list_grids [] = $grid;
	    
// 	    $grid ['field'] = 'fans_gift_shop_coupon';
// 	    $grid ['title'] = '增粉赠送优惠券(张)';
// 	    $list_grids [] = $grid;
	    
// 	    $grid ['field'] = 'fans_gift_coupon';
// 	    $grid ['title'] = '增粉赠送代金券(张)';
// 	    $list_grids [] = $grid;
	
	    $list_data ['list_grids'] = $list_grids;
	    
// 	    $model=$this->getModel('shop_distribution_user');
// 	    $user_data = $this->_get_model_list ( $model );
// 	    $data=$user_data['list_data'];
        $map['token']=get_token();
	    $data=M('shop_distribution_user')->where($map)->select();
	    //获取关注量
	    $map1['token']=get_token();
	    $follows=M('shop_statistics_follow')->where($map1)->field('uid,duid')->select();
	    $token=get_token();
	    foreach ($follows as $f){
	        $user=get_userinfo($f['uid']);
	        if ($user['has_subscribe'][$token] ==1){
	            $fcount[$f['duid']] +=1;
	        }
	    }
// 	    $levels=M('card_level')->where($map)->getFields('id,level');
	    
	    foreach ( $data as $k=>&$vo ) {
	        $user=get_userinfo($vo['uid']);
	        $map['uid']=$vo['uid'];
	        $cardMember=M('card_member')->where($map)->find();
	        
	        if ($cardMember['number']){
	            $cardLevel=D('Addons://Card/CardLevel')->getCardMemberLevel($vo['uid']);
	            $vo['card_member']=$cardMember['number'].'<br/>'.$cardLevel['level'];
	        }
	        $vo['truename']=$user['truename'];
	        $param['duid']=$vo['uid'];
	        
	        $furl=addons_url('Shop://ShopDistributionUser/get_user_from',$param);
	        $vo['fcount']=intval($fcount[$vo['uid']])==0?0:"<a href='$furl' >".intval($fcount[$vo['uid']])."</a>";
	     
	        $profit=$this->_get_user_profit($vo['uid']);
	        $purl=addons_url('Shop://ShopDistributionUser/get_profit_from',$param);
	        $vo['profit']=$profit==0?0:"<a href='$purl' >".$profit."</a>";
	        $url=addons_url("Shop://ShopDistributionUser/show_details",array('duid'=>$vo['uid']));
// 	        $vo['ids']="<a data-duid='".$vo['uid']."' class='details' href='$url'>查看详情</a>";
            $vo['id']=$k+1;
	    }
	    $list_data['list_data']=$data;
	    $this->assign ( $list_data );
	    $this->display('show_details');
	    // 	    $this->ajaxReturn($fcount);
	}
	function _get_user_profit($uid){
	    $config=get_addon_config('Shop');
	    $level = $config['level'];
	    $total=0;
	    if($level==1){
	        //一级分佣
	        $map['token']=get_token();
	        $map['uid']=$uid;
	        $map['profit_shop']=0;
	        
	    }else{
	        $map1['token']=get_token();
	        $map1['manager_id']=$uid;
	        $shopid=D('Addons://Shop/Shop')->where($map1)->getField('id');
	        if ($shopid){
	            $map['token']=get_token();
	            $map['profit_shop']=$shopid;
	        }
	    }
	    $totals=M('shop_distribution_profit')->where($map)->field('sum(profit) totals')->select();
	    $total=wp_money_format($totals[0]['totals']);
	    return $total;
	}
	//获取提成的来源  注释的内容为原先分销系统内容
	function get_profit_from(){
		$uid = I ( 'duid', 0, 'intval' );
		$duserName = get_userinfo($uid,'truename');
		$is_duser=I('is_duser',0,'intval');
	    $param['mdm']=$_GET['mdm'];
	    $res['title']='个人渠道';
	    $res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
	    $res ['class'] = _ACTION == 'lists' ? 'current' : '';
	    $nav[]=$res;
	    $res['title']='粉丝统计';
	    $res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
	    $res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
	    $nav[]=$res;
	    
// 	    $res['title']='提成统计';
// 	    $res['url']=addons_url('Shop://ShopDistributionUser/profit_details',$param);
// 	    $res ['class'] = _ACTION == 'profit_details' ? 'current' : '';
// 	    $nav[]=$res;
	    
	    $res['title']=$duserName.' 的提成详情';
	    $res['url']=addons_url('Shop://ShopDistributionUser/get_profit_from',$param);
	    $res ['class'] = _ACTION == 'get_profit_from' ? 'current' : '';
	    $nav[]=$res;
	    $this->assign('nav',$nav);
	    $bt['title'] = '返回';
	    $bt['url'] = U('duser_profit_analysis',array('mdm'=>$_GET['mdm'],'duid'=>$uid));
	    $btn[]=$bt;
	    $this->assign('top_more_button',$btn);
	    
	    $this->assign('add_button',false);
	    $this->assign('del_button',false);
	    $this->assign('check_all',false);
	    $this->assign('search_button',false);
	    
	    
	    if ($is_duser){
	    	$grid ['field']  = 'upper_user';
	    	$grid ['title'] = '我的下级分销商 ';
	    	$list_grids [] = $grid;
	    }else{
	    	$grid ['field']  = 'upper_user';
	    	$grid ['title'] = '我的客户';
	    	$list_grids [] = $grid;
	    }
	    
	    if ($is_duser){
		    $grid ['field']  = 'level';
		    $grid ['title'] = '分销商等级';
		    $list_grids [] = $grid;
		    

		    $grid ['field']  = 'followid';
		    $grid ['title'] = '消费用户';
		    $list_grids [] = $grid;
	    }
	    
	    
	    $grid ['field']  = 'order_number';
	    $grid ['title'] = '订单号';
	    $list_grids [] = $grid;
	    
// 	    $grid ['field']  = 'totals';
// 	    $grid ['title'] = '用户消费金额';
// 	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'profit_precent';
	    $grid ['title'] = '提成比例';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'profit';
	    $grid ['title'] = '提成金额';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'time';
	    $grid ['title'] = '交易时间';
	    $list_grids [] = $grid;
	    $list_data ['list_grids'] = $list_grids;
	    $levelName = $this->_get_level_name ();
	    
		$followMember =D ( 'Addons://Shop/Distribution' )->get_follow_member($uid,0);
		if (empty($is_duser)){
			//客户带来的收益
			$uidArr [] = $uid;
			$map ['upper_user'] = array (
					'in',
					$uidArr
			);
			$map ['token'] = get_token ();
			if (!empty($followMember)){
				$uuarr= getSubByKey($followMember,'uid');
				$map['uid']=array('in',$uuarr);
			}else{
				$map ['uid'] = 0;
			}
		}else{
			$uidArr = D ( 'Addons://Shop/Distribution' )->get_duser_member ( $uid, 0 );
			$map['duser']=array('in',$uidArr);
			$map['upper_user'] = $uid;
			$map['token']=get_token();
		}
	
			
			// $config=get_addon_config('Shop');
			// $level = $config['level'];
			// if($level==1){
			// $map['token']=get_token();
			// $map['uid']=$uid;
			// $map['profit_shop']=0;
			
		// }else {
			// $map1['token']=get_token();
			// $map1['manager_id']=$uid;
			// $shopid=D('Addons://Shop/Shop')->where($map1)->getField('id');
			// if ($shopid){
			// $map['token']=get_token();
			// $map['profit_shop']=$shopid;
			// }
			// }
		$profitData = M ( 'shop_distribution_profit' )->where ( $map )->select ();
		$orderDao = D ( 'Addons://Shop/Order' );
		foreach ( $profitData as $v ) {
			$data ['profit_precent'] = ($v ['distribution_percent'] * 100) . '%';
			$order = $orderDao->getInfo ( $v ['order_id'] );
			
			$data ['totals'] = $order ['total_price'];
			$data ['profit'] = wp_money_format ( $v ['profit'] );
			$data ['time'] = time_format ( $v ['ctime'] );
			$orderUrl = addons_url('Shop://Order/lists',array('order_id'=>$order['id']));
			$data ['order_number'] = "<a href='$orderUrl' target='_blank' >".$order ['order_number']."</a>";
			if ($is_duser){
				$data ['followid'] = get_userinfo ( $order ['uid'], 'nickname' );
				$data ['level'] = $levelName [$v ['upper_level']];
				$data ['upper_user'] = get_userinfo ( $v ['duser'], 'truename' );
			}else{
				$data['upper_user'] = get_userinfo ( $order ['uid'], 'nickname' );
			}
			$datas [] = $data;
		}
		$list_data ['list_data'] = $datas;
		$this->assign ( $list_data );
		$this->display ( 'show_details' );
	}
	
	function get_user_from(){
	    $param['mdm']=$_GET['mdm'];
	    $res['title']='个人渠道';
	    $res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
	    $res ['class'] = _ACTION == 'lists' ? 'current' : '';
	    $nav[]=$res;
	    $res['title']='粉丝统计';
	    $res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
	    $res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
	    $nav[]=$res;
	     
// 	    $res['title']='提成统计';
// 	    $res['url']=addons_url('Shop://ShopDistributionUser/profit_details',$param);
// 	    $res ['class'] = _ACTION == 'profit_details' ? 'current' : '';
// 	    $nav[]=$res;
	     
	    $res['title']='粉丝详情';
	    $res['url']=addons_url('Shop://ShopDistributionUser/get_user_from',$param);
	    $res ['class'] = _ACTION == 'get_user_from' ? 'current' : '';
	    $nav[]=$res;
	    $this->assign('nav',$nav);
	     
	    $this->assign('add_button',false);
	    $this->assign('del_button',false);
	    $this->assign('check_all',false);
	    $this->assign('search_button',false);
	
	    $grid ['field']  = 'followid';
	    $grid ['title'] = '带来的粉丝';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'card_member';
	    $grid ['title'] = '会员卡号';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'sex';
	    $grid ['title'] = '性别';
	    $list_grids [] = $grid;
	     
	     
	    $grid ['field']  = 'time';
	    $grid ['title'] = '关注时间';
	    $list_grids [] = $grid;
	    $list_data ['list_grids'] = $list_grids;
	    
	    $map['duid']=I('duid');
	    $map['token']=get_token();
	    $duser=M('shop_statistics_follow')->where($map)->getFields('uid,ctime');
	    $token=get_token();
// 	    $levels=M('card_level')->where($map)->getFields('id,level');
	    foreach ($duser as $k=>$v){
	        $data['card_member']='';
	        $user=get_userinfo($k);
	        if ($user['has_subscribe'][$token]==1){
	            $map1['uid']=$k;
	            $map1['token']=$token;
	            $cardMember=M('card_member')->where($map1)->find();
	            $cardLevel=D('Addons://Card/CardLevel')->getCardMemberLevel($k);
	            if ($cardMember['number']){
	                $data['card_member']=$cardMember['number'].'<br/>'.$cardLevel['level'];
	            }else{
	                $data['card_member']==''&& $data['card_member']='非会员';
	            }
	            
	            $data['followid']=$user['nickname'];
	            $data['sex']=$user['sex']==1?'男':'女';
	            $data['time']=time_format($v);
	            $datas[]=$data;
	        }
	        
	         
	    }
	    $list_data['list_data']=$datas;
	    $this->assign ( $list_data );
	    $this->display('show_details');
	}
	
	///////////////////升级分销功能 新增函数/////////////////////////
	//分销用户设置分销商级别
	function set_user_level() {
		$dMap['id'] = $id=I('id');
		if (empty($id)){
			$this->error('找不到数据');
		}
		if (IS_POST){
			$dSave['is_audit']=intval($_POST['is_audit']);
			if ($dSave['is_audit'] == 1){
				//审核通过
				$dSave['level']=$_POST['level'];
			}else{
				$dSave['level'] = 0;
			}
			$uMap['uid']=$_POST['uid'];
			$uMap['token']=get_token();
			$userlevel=M('shop_user_level_link')->where($uMap)->find();
			if (!empty($userlevel)){
				$saveData['level']=$dSave['level'];
				$saveData['upper_user']=$_POST['upper_user'];
				$res1=M('shop_user_level_link')->where($uMap)->save($saveData);
			}else {
				if (!empty($dSave['level'])){
					$addData['level']=$dSave['level'];
					$addData['upper_user']=$_POST['upper_user'];
					$addData['uid']=$uMap['uid'];
					$addData['cTime']=time();
					$addData['token']=get_token();
					$res1=M('shop_user_level_link')->add($addData);
				}
			}
			$res = M('shop_distribution_user')->where($dMap)->save($dSave);
			if ($res || $res1){
				D('Addons://Shop/Distribution') -> getDistributionUser($uMap['uid'],true);
				echo 1;
			}else{
				echo 0;
			}
			exit();
		}else {
			$duser=M('shop_distribution_user')->find($id);
			if (empty($duser['uid'])){
				$this->error('找不到用户');
			}
			$typeName=$this->_get_level_name();
			
			//查询一二级分销商
			$map['token']=get_token();
			$map['level']=array('in',array(1,2));
			$map['uid'] = array('neq',$duser['uid']);
			$userLinks=M('shop_user_level_link')->where($map)->select();
			foreach ($userLinks as $vo){
				$user=get_userinfo($vo['uid']);
				$vo['username']=empty($user['truename'])?$user['nickname']:$user['truename'];
				$userdatas[$vo['level']][]=$vo;
			}
			if (!isset($userdatas[1])){
				unset($typeName[2]);
				unset($typeName[3]);
			}else if (!isset($userdatas[2])){
				unset($typeName[3]);
			}
			
			// 		dump($userLinks);
			$data['type_name']=$typeName;
			$data['user_data']=$userdatas;
			$data['duser']=$duser;
			$this->assign($data);
			$this->display();
		}
		
		
	}
	
	//获取分销级别类型名称
	function _get_level_name(){
		$config=get_addon_config('Shop');
		
		$typeName=array();
		switch ($config['level']){
			case 1:
				if ($config['level_name_1']){
					$typeName[1]=$config['level_name_1'];
				}else{
					$typeName[1]='一级分销商';
				}
				break;
			case 2:
				if ($config['level_name_1']){
					$typeName[1]=$config['level_name_1'];
				}else{
					$typeName[1]='一级分销商';
				}
				if ($config['level_name_2']){
					$typeName[2]=$config['level_name_2'];
				}else{
					$typeName[2]='二级分销商';
				}
				break;
			case 3:
				if ($config['level_name_1']){
					$typeName[1]=$config['level_name_1'];
				}else{
					$typeName[1]='一级分销商';
				}
				if ($config['level_name_2']){
					$typeName[2]=$config['level_name_2'];
				}else{
					$typeName[2]='二级分销商';
				}
				if ($config['level_name_3']){
					$typeName[3]=$config['level_name_3'];
				}else{
					$typeName[3]='三级分销商';
				}
				break;
			default:
				$typeName=null;
				break;
		}
		return $typeName;
	}
	//删除用户 使用is_delete 标识
	function do_del_duser(){
		$did = I ( 'id' );
		$duser = M ( 'shop_distribution_user' )->find ( $did );
		if (empty ( $duser )) {
			echo 0;
			exit ();
		}
		$lmap ['uid|upper_user'] = $duser ['uid'];
		$uids = M ( 'shop_user_level_link' )->where ( $lmap )->getFields ( 'uid' );
		// 将该用户以下关系级别设置为0，相当于删除
		if ($duser ['level'] == 1) {
			$lmap ['uid|upper_user'] = array (
					'in',
					$uids 
			);
			$uids = M ( 'shop_user_level_link' )->where ( $lmap )->getFields ( 'uid' );
			$lmap ['uid|upper_user'] = array (
					'in',
					$uids 
			);
		} else {
			$lmap ['uid|upper_user'] = $duser ['uid'];
		}
// 		$lsave ['level'] = 0;
// 		$res1 = M ( 'shop_user_level_link' )->where ( $lmap )->save ( $lsave );
		$res1 = M ( 'shop_user_level_link')->where ( $lmap )->delete ();
		// if ($res1){
		if (!empty($uids)){
			$map ['uid'] = array (
					'in',
					$uids
			);
		}else{
			$map['uid']= $duser['uid'];
		}
// 		$save ['is_delete'] = 1;
// 		$res = M ( 'shop_distribution_user' )->where ( $map )->save ( $save );
		$res = M ( 'shop_distribution_user' )->where ( $map )->delete ();
		if ($res) {
			$followMap ['duid'] = $map ['uid'];
			$followMap ['token'] = get_token ();
			M ( 'shop_statistics_follow' )->where ( $followMap )->delete ();
			$disDao = D ( 'Addons://Shop/Distribution' );
			foreach ( $uids as $uid ) {
				$disDao->getDistributionUser ( $uid, true );
			}
			echo 1;
		} else {
			echo - 1;
		}
		// }else{
		// echo -1;
		// }
	}
	
	function user_detail() {
		$this->assign ( 'del_button', false );
		$this->assign ( 'check_all', false );
		$this->assign ( 'add_button', false );
		$bt['title'] = '返回列表';
		$bt['url'] = U('lists',array('mdm'=>$_GET['mdm']));
		$btn[]=$bt;
		$this->assign('top_more_button',$btn);
		$param ['mdm'] = $_GET ['mdm'];
		$res ['title'] = '个人渠道';
		$res ['url'] = addons_url ( 'Shop://ShopDistributionUser/lists', $param );
		$res ['class'] = _ACTION == 'lists' ? 'current' : '';
		$nav [] = $res;
		$res ['title'] = '用户详情';
		$res ['url'] = addons_url ( 'Shop://ShopDistributionUser/user_detail', $param );
		$res ['class'] = _ACTION == 'user_detail' ? 'current' : '';
		$nav [] = $res;
		$this->assign ( 'nav', $nav );
		
		$grid ['field'] = 'truename';
		$grid ['title'] = '姓名';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'mobile';
		$grid ['title'] = '手机号';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'wechat';
		$grid ['title'] = '微信号';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'inviter';
		$grid ['title'] = '邀请人';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'level';
		$grid ['title'] = '分销级别';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'profit_money';
		$grid ['title'] = '收益金额';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'now_money';
		$grid ['title'] = '现有金额';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'member_count';
		$grid ['title'] = '我的团队';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'coustom_count';
		$grid ['title'] = '我的客户';
		$list_grids [] = $grid;
		
		$list_data ['list_grids'] = $list_grids;
		
		$map ['token'] = get_token ();
		$did = I ( 'did', 0, 'intval' );
		$duid = I('duid',0,'intval');
		if (empty ( $did ) && empty($duid)) {
			$this->error ( '找不到该分销用户！' );
		}
		$dDao=D ( 'Addons://Shop/Distribution' );
		if ($did){
			$duser = M ( 'shop_distribution_user' )->find ( $did );
		}else{
			$duser = $dDao ->getDistributionUser($duid);
		}
		$uidArr = $dDao ->get_duser_member ( $duser ['uid'], 0 ,1);
		if (! empty ( $uidArr )) {
			$map ['uid'] [] = array (
					'in',
					$uidArr 
			);
		} else {
			$map ['id'] = 0;
		}
		
		$search = $_REQUEST ['truename'];
		if ($search) {
			$this->assign ( 'search', $search );
			
			$map1 ['truename'] = array (
					'like',
					'%' . htmlspecialchars ( $search ) . '%' 
			);
			$truename_follow_ids = D ( 'Common/User' )->where ( $map1 )->getFields ( 'uid' );
			// $truename_follow_ids = implode ( ',', $truename_follow_ids );
			if (! empty ( $truename_follow_ids )) {
				$map ['uid'] [] = array (
						'in',
						$truename_follow_ids 
				);
			} else {
				$map ['id'] = 0;
			}
			
			unset ( $_REQUEST ['truename'] );
		}
		$profitData = D('Addons://Shop/Distribution') ->get_duser_profit($duser['uid']);
		$map ['is_delete'] = 0;
		$datas = M ( 'shop_distribution_user' )->where ( $map )->select ();
		if (empty($datas)){
			$datas[]=$duser;
		}else{
			array_unshift($datas, $duser);
		}
		
		// $list_data = $this->_get_model_list ( $this->model );
		$typeName = $this->_get_level_name ();
		foreach ( $datas as $vo ) {
			$vo ['level_key'] = $vo ['level'];
			if ($vo['is_audit'] ==2){
				$vo['level'] = '审核未通过';
			}else{
				$vo ['level'] = empty ( $vo ['level'] ) ? '未审核' : $typeName [$vo ['level']];
			}
			$user = get_userinfo ( $vo ['uid'] );
			$vo ['truename'] = $user ['truename'];
			$vo ['nickname'] = $user ['nickname'];
			$vo ['mobile'] = $user ['mobile'];
			$profit =floatval($profitData [$vo['uid']]);
// 			$vo ['profit_money'] = $vo ['profit_money'];
			$vo ['profit_money'] =wp_money_format($profit);
			if ($vo['profit_money'] > 0){
				$purl =U('duser_profit_analysis',array('duid'=>$vo['uid'],'mdm'=>$_GET['mdm']));
				$vo ['profit_money'] = "<a href='".$purl."' >".$vo['profit_money']."</a>";
			}
			$nowMoney = $dDao -> get_duser_cashout($vo['uid']) ;
			$vo ['now_money'] =wp_money_format( $profit - $nowMoney);
			
			$vo ['member_count'] =  $dDao ->get_duser_member ( $vo ['uid'] );
			$vo ['coustom_count'] = $dDao ->get_follow_member($vo['uid']);
			if ($vo ['member_count'] !=0 && $vo['uid'] != $duser['uid']){
				$lurl=U('user_detail',array('mdm'=>$_GET['mdm'],'duid'=>$vo['uid']));
				$vo ['member_count'] = "<a href='".$lurl."'>".$vo['member_count']."</a>";
			}
			if ($vo['coustom_count']>0){
				$vo['coustom_count'] = "<a href='".U('coustom_details',array('duid'=>$vo['uid'],'mdm'=>$_GET['mdm']))."'>".$vo['coustom_count']."</a>";
			}
			$list_data ['list_data'] [] = $vo;
		}
		$this->assign ( 'search_key', 'truename' );
		$this->assign ( 'search_url', U ( 'user_detail', array (
				'did' => $did,
				'mdm' => $_GET ['mdm'] 
		) ) );
		$this->assign ( $list_data );
		$this->display ();
	}
	//客户信息表
	function coustom_details(){
		$duid=I('duid',0,'intval');
	    $param['mdm']=$_GET['mdm'];
	    $res['title']='个人渠道';
	    $res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
	    $res ['class'] = _ACTION == 'lists' ? 'current' : '';
	    $nav[]=$res;
	    $dname=get_userinfo($duid,'truename');
	    $res['title']=$dname.' 客户列表';
	    $res['url']='';
	    $res ['class'] = _ACTION == 'coustom_details' ? 'current' : '';
	    
	    $nav[]=$res;
	    $this->assign('nav',$nav);
	    $bt['title'] = '返回详情列表';
	    $bt['url'] = U('user_detail',array('duid'=>$duid,'mdm'=>$_GET['mdm']));
	    $btn[]=$bt;
	    $this->assign('top_more_button',$btn);
	    
	    $this->assign('add_button',false);
	    $this->assign('del_button',false);
	    $this->assign('check_all',false);
	    $this->assign('search_button',false);
	    
	    $grid ['field']  = 'nickname';
	    $grid ['title'] = '昵称';
	    $list_grids [] = $grid;
	     
	    $grid ['field']  = 'userface';
	    $grid ['title'] = '头像';
	    $list_grids [] = $grid;
	    
	    $grid ['field']  = 'sex';
	    $grid ['title'] = '性别';
	    $list_grids [] = $grid;
	
	    $list_data ['list_grids'] = $list_grids;
	    
	    $uidArr = D('Addons://Shop/Distribution') -> get_follow_member($duid, 0);
	    foreach ($uidArr as $uid){
	    	$user=get_userinfo($uid['uid']);
	    	$data=array();
	    	$data['nickname'] = $user['nickname'];
	    	$data['userface'] =  url_img_html($user['headimgurl']);
	    	$data['sex'] = $user['sex_name'] ?'保密':$user['sex_name'];
	    	$datas[]= $data;
	    }
	    $list_data['list_data']=$datas;
	    $this->assign ( $list_data );
	    $this->display('show_details');
	    // 	    $this->ajaxReturn($fcount);
	}
	//分销用户收益统计表
	function duser_profit_analysis(){
		$duid=I('duid',0,'intval');
		$param['mdm']=$_GET['mdm'];
		$res['title']='个人渠道';
		$res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
		$res ['class'] = _ACTION == 'lists' ? 'current' : '';
		$nav[]=$res;
		
		$res['title']='粉丝统计';
		$res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
		$res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
		$nav[]=$res;
		
		$dname=get_userinfo($duid,'truename');
		$res['title']=$dname.' 获利统计表';
		$res['url']='';
		$res ['class'] = _ACTION == 'duser_profit_analysis' ? 'current' : '';
		 
		$nav[]=$res;
		$this->assign('nav',$nav);
		$bt['title'] = '返回详情列表';
		$bt['url'] = U('user_detail',array('duid'=>$duid,'mdm'=>$_GET['mdm']));
		$btn[]=$bt;
		$this->assign('top_more_button',$btn);
		 
		$this->assign('add_button',false);
		$this->assign('del_button',false);
		$this->assign('check_all',false);
		$this->assign('search_button',false);
		 
		$grid ['field']  = 'truename';
		$grid ['title'] = '分销用户';
		$list_grids [] = $grid;
	
		$grid ['field']  = 'level';
		$grid ['title'] = '分销等级';
		$list_grids [] = $grid;
		 
		$grid ['field']  = 'coustom_profit';
		$grid ['title'] = '我的客户带来收益';
		$list_grids [] = $grid;
	
		$grid ['field']  = 'team_profit';
		$grid ['title'] = '下级分销商带来收益';
		$list_grids [] = $grid;
		
		$grid ['field']  = 'total_profit';
		$grid ['title'] = '总收益';
		$list_grids [] = $grid;
		$list_data ['list_grids'] = $list_grids;
		
		$dDao=D('Addons://Shop/Distribution');
		//获取下级
		$uidArr = $dDao->get_duser_member($duid,0,1);
		if (empty($uidArr)){
			$uidArr[]=$duid;
		}else{
			array_unshift($uidArr,$duid);//将用户本身插入到最前
		}
		foreach ($uidArr as $uid){
			$data=array();
			$data = $dDao ->get_total_profit_from($uid);
			if ($data['coustom_profit'] >0){
				$data['coustom_profit']="<a href='".U('get_profit_from',array('mdm'=>$_GET['mdm'],'duid'=>$uid))."' >".wp_money_format($data['coustom_profit'])."</a>";
			}else{
				$data['coustom_profit'] = wp_money_format($data['coustom_profit']);
			}
			if ($data['team_profit'] >0 && $uid != $duid){
				$data['team_profit']="<a href='".U('duser_profit_analysis',array('mdm'=>$_GET['mdm'],'duid'=>$uid))."' >".wp_money_format($data['team_profit'])."</a>";
			}else if($data['team_profit'] >0 && $uid == $duid){
				$data['team_profit']="<a href='".U('get_profit_from',array('mdm'=>$_GET['mdm'],'duid'=>$uid,'is_duser'=>1))."' >".wp_money_format($data['team_profit'])."</a>";
			}else{
				$data['team_profit'] = wp_money_format($data['team_profit']);
			}
			$duser = $dDao -> getDistributionUser($uid);
			$levelName=$this->_get_level_name();
			$data['truename'] =  get_userinfo($uid,'truename');
			$data['level'] =  $levelName[$duser['level']];
			$datas[]=$data;
		}
		
		
// 		$uidArr = D('Addons://Shop/Distribution') -> get_follow_member($duid, 0);
// 		foreach ($uidArr as $uid){
// 			$user=get_userinfo($uid['uid']);
// 			$data=array();
// 			$data['nickname'] = $user['nickname'];
// 			$data['userface'] =  url_img_html($user['headimgurl']);
// 			$data['sex'] = $user['sex_name'] ?'保密':$user['sex_name'];
// 			$datas[]= $data;
// 		}
		$list_data['list_data']=$datas;
		$this->assign ( $list_data );
		$this->display();
		// 	    $this->ajaxReturn($fcount);
	}
	
	//分销提现记录表
	function cashout_log_lists(){
		$param['mdm']=$_GET['mdm'];
		$res['title']='个人渠道';
		$res['url']=addons_url('Shop://ShopDistributionUser/lists',$param);
		$res ['class'] = _ACTION == 'lists' ? 'current' : '';
		$nav[]=$res;
		$res['title']='粉丝统计';
		$res['url']=addons_url('Shop://ShopDistributionUser/statistics_lists',$param);
		$res ['class'] = _ACTION == 'statistics_lists' ? 'current' : '';
		$nav[]=$res;
		 
		// 	    $res['title']='提成统计';
		// 	    $res['url']=addons_url('Shop://ShopDistributionUser/profit_details',$param);
		// 	    $res ['class'] = _ACTION == 'profit_details' ? 'current' : '';
		// 	    $nav[]=$res;
		$config = get_addon_config('Shop');
		if ($config['need_distribution'] == 1){
			$res['title']='提现中心';
			$res['url']=addons_url('Shop://ShopDistributionUser/cashout_log_lists',$param);
			$res ['class'] = _ACTION == 'cashout_log_lists' ? 'current' : '';
			$nav[]=$res;
		}
		$this->assign('nav',$nav);
		$this->assign('del_button',false);
		$this->assign('add_button',false);
		$this->assign('check_all',false);
		$this->assign('search_key','truename');
		$this->assign('placeholder','输入分销商姓名搜索');
		$searUrl = U('cashout_log_lists',$param);
		$this->assign('search_url',$searUrl);
		
		$grid ['field']  = 'truename';
		$grid ['title'] = '分销商姓名';
		$list_grids [] = $grid;
		 
		$grid ['field']  = 'mobile';
		$grid ['title'] = '手机号';
		$list_grids [] = $grid;
		 
		$grid ['field']  = 'level';
		$grid ['title'] = '分销级别';
		$list_grids [] = $grid;
		
		$grid ['field']  = 'zfb_name';
		$grid ['title'] = '支付宝名称';
		$list_grids [] = $grid;
		
		$grid ['field']  = 'zfb_account';
		$grid ['title'] = '支付宝帐号';
		$list_grids [] = $grid;
		
		$grid ['field']  = 'amount';
		$grid ['title'] = '提现金额';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'ctime';
		$grid ['title'] = '申请时间';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'remark';
		$grid ['title'] = '备注';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'status';
		$grid ['title'] = '状态';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'ids';
		$grid ['title'] = '设置状态';
		$list_grids [] = $grid;
		
		$search=$_REQUEST['truename'];
		if ($search) {
			$this->assign ( 'search', $search );
		
			$map1 ['truename'] = array (
					'like',
					'%' . htmlspecialchars ( $search ) . '%'
			);
			$truename_follow_ids = D ( 'Common/User' )->where ( $map1 )->getFields ( 'uid' );
			// 		    $truename_follow_ids = implode ( ',', $truename_follow_ids );
			if (! empty ( $truename_follow_ids )) {
				$map ['uid'] = array (
						'in',
						$truename_follow_ids
				);
			}else{
				$map['id']=0;
			}
		
			unset ( $_REQUEST ['truename'] );
		}
		$status = I('status',0,'intval');
		if ($status==3){
			$map['cashout_status']=0;
		}else if($status == 1){
			$map['cashout_status'] =1;
		}else if($status == 2){
			$map['cashout_status'] =2;
		}
        $map['token'] = get_token();
        $list_data['list_data'] = M('shop_cashout_log')->where($map)->select();
        $list_data['list_grids'] = $list_grids;
        $dDao = D('Addons://Shop/Distribution');
		$levelName = $this->_get_level_name();
        foreach ($list_data['list_data'] as &$vo) {
            $vo['ctime'] = time_format($vo['ctime']);
            $duser = $dDao->getDistributionUser($vo['uid']);
            $vo['zfb_name'] = $duser['zfb_name'];
            $vo['zfb_account'] = $duser['zfb_account'];
            $vo['level'] = $levelName[$duser['level']];
            $userinfo = get_userinfo($vo['uid']);
            $vo['truename'] = $userinfo['truename'];
            $vo['mobile'] = $userinfo['mobile'];
            $vo['amount'] = wp_money_format($vo['cashout_amount']);
			if ($vo['cashout_status']==0){
				$vo['status']='未处理';
				$vo['ids']="<a onClick='set_status(".$vo['id'].");' href='javascript:;' >设置状态</a>";
			}else if($vo['cashout_status'] == 1){
				$vo['status']='提现成功';
				$vo['ids']="--";
			}else{
				$vo['status']='提现失败';
				$vo['ids']="--";
			}
			
		}
		
		$bt['title'] = '导出';
		$bt['url'] = U('output',array('status'=>$status,'truename'=>$search));
		$btn[]=$bt;
		$this->assign('top_more_button',$btn);
		
		$this->assign ( $list_data );
		$this->display();
	}
	function output(){
		$grid ['field']  = 'truename';
		$grid ['title'] = '分销商姓名';
		$list_grids [] = $grid;
			
		$grid ['field']  = 'mobile';
		$grid ['title'] = '手机号';
		$list_grids [] = $grid;
			
		$grid ['field']  = 'level';
		$grid ['title'] = '分销级别';
		$list_grids [] = $grid;
		
		$grid ['field']  = 'amount';
		$grid ['title'] = '提现金额';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'ctime';
		$grid ['title'] = '申请时间';
		$list_grids [] = $grid;
		
		$grid ['field'] = 'status';
		$grid ['title'] = '状态';
		$list_grids [] = $grid;
		
		
		$search=$_REQUEST['truename'];
		if ($search) {
			$this->assign ( 'search', $search );
		
			$map1 ['truename'] = array (
					'like',
					'%' . htmlspecialchars ( $search ) . '%'
			);
			$truename_follow_ids = D ( 'Common/User' )->where ( $map1 )->getFields ( 'uid' );
			// 		    $truename_follow_ids = implode ( ',', $truename_follow_ids );
			if (! empty ( $truename_follow_ids )) {
				$map ['uid'] = array (
						'in',
						$truename_follow_ids
				);
			}else{
				$map['id']=0;
			}
		
			unset ( $_REQUEST ['truename'] );
		}
		$status = I('status',0,'intval');
		if ($status==3){
			$map['cashout_status']=0;
		}else if($status == 1){
			$map['cashout_status'] =1;
		}else if($status == 2){
			$map['cashout_status'] =2;
		}
		$map['token']=get_token();
		$list_data['list_data'] = M('shop_cashout_log')->where($map)->select();
		$list_data ['list_grids'] = $list_grids;
		$dDao=D('Addons://Shop/Distribution');
		$levelName=$this->_get_level_name();
		foreach ( $list_data['list_grids'] as $vv ) {
			$fields [] = $vv['field'];
			$titleArr [] = $vv['title'];
		}
		$dataArr [] = $titleArr;
		foreach ($list_data['list_data'] as $vo){
			$duser=$dDao ->getDistributionUser($vo['uid']);
			$userinfo=get_userinfo($vo['uid']);
			$dd['truename']=$userinfo['truename'];
			$dd['mobile']=$userinfo['mobile'];
			$dd['level']=$levelName[$duser['level']];
			$dd['amount']=wp_money_format($vo['cashout_amount']);
			$dd['ctime']=time_format($vo['ctime']);
			if ($vo['cashout_status']==0){
				$dd['status']='未处理';
			}else if($vo['cashout_status'] == 1){
				$dd['status']='提现成功';
			}else{
				$dd['status']='提现失败';
			}
			$dataArr[]=$dd;
		}
		vendor ( 'out-csv' );
		export_csv ( $dataArr, 'card_member' );
	}
	
	function set_cashout_status(){
		$id=I('id');
		if(IS_POST){
			$res = 0;
			$logs =M('shop_cashout_log')->find($id);
			$save['cashout_status']=$_POST['is_status'];
			if ( $save['cashout_status'] ){
				$res=M('shop_cashout_log')->where(array('id'=>$id))->save($save);
			}
			echo $res;
			exit();
		}
		$this->assign('id',$id);
		$this->display();
	}
}
