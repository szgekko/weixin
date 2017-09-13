<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class ShopController extends BaseController {
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop' );
		parent::_initialize ();
	}
	function lists() {
		redirect ( U ( 'summary' ,$this->get_param) );
	}
	function edit() {
		$id = $this->shop_id;
		$model = $this->getModel ();
		if (IS_POST) {
		    $map['token']=get_token();
            $Model = D(parse_name(get_table_name($model['id']), 1));
            if($_POST['mobile']){
                $this->isTel($_POST['mobile']);
            }
//             if($_POST['api_key']){
//                 $this->isUrl($_POST['api_key']);
//             }
            if ($Model->create() && $Model->save()) {
                $this->_saveKeyword($model, $id);
            }
            // 清空缓存
            method_exists($Model, 'clear') && $Model->clear($id, 'edit');
            $this->success ( '保存' . $model ['title'] . '成功！' );
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			// 获取数据
			$data = D ( 'Shop' )->getInfo ( $id, true );
			$data || $this->error ( '数据不存在！' );
			
			$token = get_token ();
			//dump($token);exit;
// 			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
// 				$this->error ( '非法访问！' );
// 			}
			
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			
			$this->display ();
		}
	}
	public function add()
	{
	    if (IS_POST) {
	        $isUser=get_userinfo($this->mid,'manager_id');
	        if ($isUser){
	            $map['manager_id']=$isUser;
	            $map['token']=get_token();
	            $shopid=D('Addons://Shop/Shop')->where($map)->getField('id');
	            $_POST['parent_shop']=$shopid;
	            //满足条件 添加分销用户
	            $dudata['uid']=$this->mid;
	            $dudata['token']=get_token();
	            $res=M('shop_distribution_user')->where(array('uid'=>$dudata['uid']))->getFields('id');
	            if (!$res){
	                $dudata['enable']=1;
	                $dudata['cTime']=time();
	                M('shop_distribution_user')->add($dudata);
	            }
	        }
	        $Model = D(parse_name(get_table_name($this->model['id']), 1));
	        // 获取模型的字段信息
	        $Model = $this->checkAttr($Model, $this->model['id']);
	        if ($Model->create() && $id = $Model->add()) {
	            // 清空缓存
	            method_exists($Model, 'clear') && $Model->clear($id, 'add');
	
	            $this->success('添加' . $this->model['title'] . '成功！', U('lists?model=' . $this->model['name'], $this->get_param));
	        } else {
	            $this->error($Model->getError());
	        }
	    } else {
	        $fields = get_model_attribute($this->model['id']);
	        $this->assign('fields', $fields);
	        $this->display();
	    }
	}
	function summary() {
	    $normal_tips = '若出现“redirect_uri 参数错误”,请检查微信公众平台里的“网页授权获取用户基本信息”是否配置好“授权回调页面域名”';
	    $this->assign ( 'normal_tips', $normal_tips );
	    
		$info = D ( 'Shop' )->getInfo ( $this->shop_id );
		$this->assign ( 'info', $info );
		// dump ( $order );
		
		$publicid = get_token_appinfo ( '', 'id' );
		$time = NOW_TIME - 86400;
		$px = C ( 'DB_PREFIX' );
		$uid=$this->mid;
		$isUser=get_userinfo($uid,'manager_id');
		if ($isUser){
		    $sql = "SELECT count(1) as cc,FROM_UNIXTIME(cTime, '%H') as hh FROM `{$px}visit_log` WHERE module_name='Shop' and publicid='{$publicid}' and uid='{$uid}' AND cTime>'$time' GROUP BY hh";
		    
		}else{
		    $sql = "SELECT count(1) as cc,FROM_UNIXTIME(cTime, '%H') as hh FROM `{$px}visit_log` WHERE module_name='Shop' and publicid='{$publicid}' AND cTime>'$time' GROUP BY hh";
		}
// 		$sql = "SELECT count(1) as cc,FROM_UNIXTIME(cTime, '%H') as hh FROM `{$px}visit_log` WHERE module_name='Shop' and publicid='{$publicid}' AND cTime>'$time' GROUP BY hh";
		$list = M ()->query ( $sql );
		foreach ( $list as $vo ) {
			$log_data [$vo ['hh']] = $vo ['cc'];
		}
		
		$sql = "SELECT count(1) as cc,FROM_UNIXTIME(cTime, '%H') as hh FROM `{$px}shop_order` WHERE shop_id='{$this->shop_id}' AND cTime>'$time' GROUP BY hh";
		$list = M ()->query ( $sql );
		foreach ( $list as $vo ) {
			$order_data [$vo ['hh']] = $vo ['cc'];
		}
		for($i = 23; $i >= 0; $i --) {
			$hh = date ( 'H', NOW_TIME - $i * 3600 );
			$highcharts ['xAxis'] [] = $hh;
			$highcharts ['series'] [] = intval ( $log_data [$hh] );
			$highcharts ['series2'] [] = intval ( $order_data [$hh] );
		}
		
		$highcharts ['xAxis'] = implode ( ',', $highcharts ['xAxis'] );
		$highcharts ['series'] = implode ( ',', $highcharts ['series'] );
		$highcharts ['series2'] = implode ( ',', $highcharts ['series2'] );
		$this->assign ( 'highcharts', $highcharts );
		
		$map['token']=get_token();
		
		//判断普通用户是否可以拥有分销店铺的权限
		if ($isUser){
		    $map ['shop_id'] = $this->shop_id;
		    $check=$this->_check_get_shop();
		    $this->assign('can_get_shop',$check);
		}
		$map['is_delete']=array('eq',0);
		$idsArr=  M ( 'shop_goods' )->where ($map)->getFields('id');
		$goodsDao = D('Goods');
		$count['sale_count'] = 0;
		$count['wait_count'] = 0;
		$count['total_count'] = 0;
		foreach ( $idsArr as $id ) {
		    $goodsInfo = $goodsDao->getInfo ( $id );
		    if ($goodsInfo['is_show']==1 && $goodsInfo['stock_total_num']>0) {
		       $count['sale_count'] ++;
		    }else if($goodsInfo['is_show']==2 && $goodsInfo['stock_total_num']>0){
		        $count['wait_count'] ++;
		    }
		    $count['total_count']++;
		}
		$count['down_count'] =intval( $count['total_count'] - $count['sale_count'] - $count['wait_count']);
// 		$count = M ( 'shop_goods' )->where ($map)->field ( 'sum(is_show) as sale_count, count(1) as total_count' )->find ();
		$this->assign ( 'count', $count );
		//dump ( $count );
		
		$order = M ( 'shop_order' )->where ( $map )->field ( 'sum(is_new) as new_count, count(1) as total_count' )->find ();
		$this->assign ( 'order', $order );
		
		$this->assign('isUser',$isUser);
		$this->display ();
	}
	function preview() {
		$previewUrl = addons_url ( 'Shop://Wap/index', array (
				'shop_id' => $this->shop_id,
				'publicid' => get_token_appinfo ( '', 'id' ),
		        'uid'=>$this->mid
		) );
		$this->assign ( 'url', $previewUrl );
		$this->display ( SITE_PATH . '/Application/Home/View/default/Addons/preview.html' );
	}

    function _check_get_shop()
    {
        $config = get_addon_config('Shop');
        // 开启分销制度
        if ($config['need_distribution'] == 1) {
            if ($config['set_require'] == 1) {
                // 分销条件：商品数：count 总金额：money 积分数：score
                foreach ($config['add_conditon'] as $cc) {
                    $map1[$cc] = $config[$cc . '_value'];
                }
                // 消费总金额
                $data = D('Addons://Shop/Order')->getTotalData($this->mid);
                $userScore = get_userinfo($this->mid, 'score');
                $count_reach = 1;
                $money_reach=1;
                $score_reach=1;
                
                $isAllGoods=$config['is_all_goods'];
				$idsAndNum=$data['goods_id_num'];
				if ($isAllGoods == 0 && $map1['count']) {
                    $data['goods_count'] >= $map1['count'] ? $count_reach = 1 : $count_reach = 0;
                } else if ($isAllGoods && in_array('count', $config['add_conditon'])) {
                        $goodsIds = wp_explode($config['buy_num'], ',');
                        foreach ($goodsIds as $vo) {
                            $goods = wp_explode($vo, ':');
                            if ($idsAndNum[$goods[0]] < $goods[1]) {
                                $count_reach = 0;
                                break;
                            }
                        }
                }
                
                if ($map1['money']) {
                    $data['total_money'] >= $map1['money'] ? $money_reach = 1 : $money_reach = 0;
                }
                if ($map1['score']) {
                    $userScore >= $map1['score'] ? $score_reach = 1 : $score_reach = 0;
                }
                if ($count_reach && $money_reach && $score_reach) {
                    // 满足条件
                    return 1;
                }
            } else {
                // 无条件，后台手动添加
                return 0;
            }
        }
        return 0;
    }
    
    function distribution_data(){
        $isUser=get_userinfo($this->mid,'manager_id');
        $token=get_token();
        $px = C ( 'DB_PREFIX' );
        $month=I('month','9');
        $year=I('year','2015');
        if ($isUser){
            $shop_id=$this->shop_id;
            $sql="SELECT from_unixtime(ctime,'%d') as thedate, sum(profit) as dateprofit FROM `{$px}shop_distribution_profit` where  from_unixtime(ctime,'%c') ='$month' and from_unixtime(ctime,'%Y')='$year' and token='$token' and profit_shop='$shop_id' group by from_unixtime(ctime,'%d');";
        }else{
            $sql="SELECT from_unixtime(ctime,'%d') as thedate, sum(profit) as dateprofit FROM `{$px}shop_distribution_profit` where  from_unixtime(ctime,'%c') ='$month' and from_unixtime(ctime,'%Y')='$year' and token='$token' group by from_unixtime(ctime,'%d');";
        }
        $data=M()->query($sql);
        foreach ($data as &$d){
            $d['dateprofit']=round($d['dateprofit'],4);
            
        }
        $this->ajaxReturn($data,'json');
    }
    
    function user_account(){
        $uid=$this->mid;
        $map['token']=get_token();
        $config=get_addon_config('Shop');
		if ($config['need_distribution']){
		    $shopInfo = D('Addons://Shop/Shop')->where(array('manager_id'=>$uid))->find();
		    $pArr=wp_explode($shopInfo['parent_shop']);
		    //分销用户级别
		    $count=count($pArr);
		    $level=$config['level'];
		    if ($count){
// 		        //用户分销级别及 可获佣金比例
// 		        if ($count==1){
// 		            $profit=$config['level1'];
// 		            $rank=1;
// 		        }else if($count ==2){
// 		            if ($level==1){
// 		                $rank=1;
// 		                $profit=$config['level1'];
// 		            }else{
// 		                $profit=$config['level2'];
// 		                $rank=2;
// 		            }
// 		        }else {
// 		            if ($level==1){
// 		                $rank=1;
// 		                $profit=$config['level1'];
// 		            }else if($level == 2){
// 		                $rank=2;
// 		                $profit=$config['level2'];
// 		            }else{
// 		                $rank=3;
// 		                $profit=$config['level3'];
// 		            }
// 		        }
// 		        $this->assign('profit_percent',$profit);
// 		        $this->assign('level',$rank);
		        
		        //总提现金额
		        $map['profit_shop']=$shopInfo['id'];
		        $totalProfit=M('shop_distribution_profit')->where($map)->getField('sum(profit)');
		        $totalProfit=round($totalProfit,4);
		        
		        //已提现金额
		        $map1['uid']=$this->mid;
		        $map1['token']=get_token();
		        $map1['cashout_status']=1;
		        $hasProfit=M('shop_cashout_log')->where($map1)->getField('sum(cashout_amount)');
		        $hasProfit=round($hasProfit,4);
		        $this->assign('has_profit',$hasProfit);
		       
		        //待结算金额
		        $map2['uid']=$this->mid;
		        $map2['token']=get_token();
		        $map2['cashout_status']=0;
		        $waitProfit=M('shop_cashout_log')->where($map2)->getField('sum(cashout_amount)');
		        $waitProfit=round($waitProfit,4);
		        $this->assign('wait_profit',$waitProfit);
		        
		        //可提现金额
		        $canProfit=$totalProfit-$hasProfit-$waitProfit ;
		        $this->assign('can_profit',$canProfit);
		        
		        //账号
		        $map3['uid']=$this->mid;
		        $map3['token']=get_token();
		        $account=M('shop_cashout_account')->where($map3)->find();
		        $this->assign('cashout_account',$account);
		        
		        //提成设定
		        if ($level==1){
		            $this->assign('level1',$config['level1']);
		        }else if($level ==2){
		            $this->assign('level1',$config['level1']);
		            $this->assign('level2',$config['level2']);
		        }else{
		            $this->assign('level1',$config['level1']);
		            $this->assign('level2',$config['level2']);
		            $this->assign('level3',$config['level3']);
		        }
		       
		    }
		   
		}
		$this->display();
    }
    //编辑提现帐号
    function set_account(){
        $data['account']=I('account');
        $data['name']=I('name');
        $data['type']=I('type');
        $map['uid']=$this->mid;
        $map['token']=get_token();
        $info=M('shop_cashout_account')->where($map)->find();
        $res=0;
        if ($info){
            $res = M('shop_cashout_account')->where($map)->save($data);
        }else {
            $data['uid']=$this->mid;
            $data['token']=get_token();
            $res=M('shop_cashout_account')->add($data);
        }
        echo $res;
    }
    
    //提现记录列表
    function cashout_lists(){
       
        $this->assign ( 'add_button', false );
        $this->assign ('del_button', false);
        $this->assign('check_all',false);
        
        $cashoutStatus=I('cashout_status');
        if ($cashoutStatus){
            $cashoutStatus==1 && $map['cashout_status']=1;
            $cashoutStatus==2 && $map['cashout_status']=2;
            $cashoutStatus==3 && $map['cashout_status']=0;
        }
        $map['uid']=$this->mid;
        $map['token']=get_token();
        session ( 'common_condition', $map );
        
        $model = $this->getModel ( 'shop_cashout_log' );
        $accont_model = $this->getModel ( 'shop_cashout_account' );
        $list_data = $this->_get_model_list ( $model );
        foreach ( $list_data ['list_data'] as &$vo ) {
            $cashoutAccount=json_decode($vo['cashout_account'],true);
            $vo['type']=get_name_by_status($cashoutAccount['type'], 'type', $accont_model['id']);
            $vo['cashout_account']=$cashoutAccount['account'];
            $vo['name']=$cashoutAccount['name'];
            $vo['cashout_status']=get_name_by_status($vo['cashout_status'], 'cashout_status', $model['id']);
        }
        $this->assign ( $list_data );
        $this->display ();
    }
    //添加提现记录
    function cashout_add(){
        $map['uid']=$this->mid;
        $map['token']=get_token();
        $info=M('shop_cashout_account')->where($map)->find();
        $data['cashout_account']=json_encode($info);
        
        $data['cashout_amount']=I('cashout_amount');
        $data['remark']=I('remark');
        $data['ctime']=NOW_TIME;
        $data['uid']=$this->mid;
        $data['token']=get_token();
        
        $res=M('shop_cashout_log')->add($data);
        echo intval($res);
    }
    
    // 获取优惠券列表
    function get_card_conpon() {
        $type=I('type');
        $map ['end_time'] = array (
            'gt',
            NOW_TIME
        );
        $map ['token'] = get_token ();
        if ($type ==1){
            $list = M ( 'shop_coupon' )->where ( $map )->field ( 'id,title' )->order ( 'id desc' )->select ();
        }else if($type==2){
            $list = M ( 'coupon' )->where ( $map )->field ( 'id,title' )->order ( 'id desc' )->select ();
        }
         $this->ajaxReturn($list);
    }
    function isTel($tel,$type='')
    {
        $regxArr = array(
            'sj'  =>  '/^(\+?86-?)?(18|15|13)[0-9]{9}$/',
            'tel' =>  '/^(010|02\d{1}|0[3-9]\d{2})-\d{7,9}(-\d+)?$/',
            '400' =>  '/^400(-\d{3,4}){2}$/',
        );
        if($type && isset($regxArr[$type]))
        {
            return preg_match($regxArr[$type], $tel) ? true:false;
        }
        foreach($regxArr as $regx)
        {
            if(preg_match($regx, $tel ))
            {
                return true;
            }
        }
       $this->error('联系电话错误');
    }
    function isUrl($url){
        $regex ='/\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/';
        $res =preg_match($regex,$url);
        if($res){
            return true;
        }
        $this->error('无效APPKEY');
    }
}
