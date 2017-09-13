<?php

namespace Addons\MiniLive\Controller;
use Home\Controller\AddonsController;

class MiniLiveController extends AddonsController{
    function lists() {
        $this->assign('check_all',false);
        $this->assign('del_button',false);
        $model = $this->getModel ( 'mini_live' );
        $list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
        $dao=D('Addons://MiniLive/MiniLive');
        foreach ($list_data['list_data'] as &$vo){
            $info=$dao->getInfo($vo['id']);
            $shakeId=$vo['shake_id'];
            $vo['shake_id']=$info['shake_title'];
            $vo['msgwall_id']=$info['msgwall_title'];
            $vo['live_id']=$info['live_pick_title'];
            $liveParam['id']=$vo['id'];
            //精彩回放相册链接
            $picUrl=U('picLists',$liveParam);
            //查看留言列表
            $onWallsUrl=U('msgwallContent',$liveParam);
            //查看黑名单
            $blackList=U('blackLists',$liveParam);
            //查看中奖列表
            $prizeUrl=addons_url('MiniLive://Shake/prize_lists',array('live_id'=>$vo['id'],'id'=>$shakeId));
            $vo['links']="<a href=$picUrl target='_blank'>精彩回放相册</a>&nbsp;&nbsp;<a href=$onWallsUrl target='_blank' >查看留言列表</a><br/><a href=$blackList target='_blank' >查看黑名单</a>&nbsp;&nbsp;<a href=$prizeUrl target='_blank' >中奖列表</a>";
            if ($vo['status']==1){
                $showUrl=addons_url('MiniLive://Show/index',$liveParam);
                
                // 展示二维码
                $showQrcode=addons_url('MiniLive://Show/showQrCode',$liveParam);
                $vo['links'].="&nbsp;&nbsp;<a href=$showQrcode target='_blank' >展示二维码</a>&nbsp;&nbsp;<a href=$showUrl target='_blank' >查看现场</a>";
            }
           
            
            $param['id']=$vo['id'];
            $param['status']=$vo['status'];
            $statusUrl=U('setStatus',$param);
            $vo['status']=$vo['status']==1?"<a href=$statusUrl title='点击设置为禁用'>已启用</a>":"<a href=$statusUrl title='点击设置为启用'>已禁用</a>"; 
            
            if (! empty ( $vo ['qrcode'] )) {
                $vo ['qrcode'] = "<a target='_blank' href='{$vo[qrcode]}'><img src='{$vo[qrcode]}' class='list_img'></a>";
                continue;
            }
            $res = D ( 'Home/QrCode' )->add_qr_code ( 'QR_LIMIT_SCENE', 'MiniLive', $vo['id'] );
            if (! ($res < 0)) {
                $map2 ['id'] = $vo ['id'];
                M ( 'mini_live' )->where ( $map2 )->setField ( 'qrcode', $res );
                $vo ['qrcode'] = $res;
                $vo ['qrcode'] = "<a target='_blank' href='{$vo[qrcode]}'><img src='{$vo[qrcode]}' class='list_img'></a>";
            }
        }
       
        $this->assign($list_data);
        $this->display();
    }
    function add() {
        $model = $this->getModel ( 'mini_live' );
        if (IS_POST) {
            $Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
            // 获取模型的字段信息
            $Model = $this->checkAttr ( $Model, $model ['id'] );
            if ($Model->create () && $id = $Model->add ()) {
                //添加控制器
                $addMonitor['live_id']=$id;
                $addMonitor['token']=get_token();
                M('mini_monitor')->add($addMonitor);
                // 清空缓存
                method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'add' );
                $this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'], $this->get_param ) );
            } else {
                $this->error ( $Model->getError () );
            }
        } else {
            $fields = get_model_attribute ( $model ['id'] );
            $this->assign ( 'fields', $fields );
            $this->display ();
        }
    }

    public function del()
    {
        $mmap['live_id'] = $map['id'] = $id = I('id');
        $mmap['token'] = $map['token'] = get_token();
        $res = M('mini_live')->where($map)->delete();
        if ($res) {
            M('mini_monitor')->where($mmap)->delete();
            $key = 'MiniLive_getInfo_' . $id;
            S($key, null);
            $key1 = 'MiniMonitor_getInfo_' . $id;
            $info = S($key1, null);
            $this->success('删除成功！');
        } else {
            $this->error('删除失败！');
        }
    }
    
    function setStatus(){
        $status=I('status');
        $id=I('id');
        $liveDao=D('Addons://MiniLive/MiniLive');
        if ($status ==0){
            //获取启动的现场
            $map['token']=get_token();
            $map ['status'] = 1;
            $upids=$liveDao->where($map)->getFields('id');
            $save['status']=1;
            $res=$liveDao->where(array('id'=>$id))->save($save);
            if (!empty($upids)){
                $setdownMap['id']=array('in',$upids);
                $downsave['status']=0;
                $liveDao->where($setdownMap)->save($downsave);
            }
            $liveDao->clear($upids);
        }else{
            $save['status']=0;
            $res=$liveDao->where(array('id'=>$id))->save($save);
        }
        $liveDao->clear($id);
        if ($res){
            $this->success ( '修改成功！');
        }
    }
    //留言列表
    function msgwallContent(){
        $this->assign ( 'add_button', false );
        $this->assign ( 'del_button', false );
        $this->assign ( 'search_button', false );
        $this->assign ( 'check_all', false );
        
        $id=I('id');
        $maplive['live_id']=$id;
        session('common_condition',$maplive);
        $model = $this->getModel ( 'msgwall_content' );
        
        $list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
        
        $list_data['fields']=array('msgwall_id','openid','content','cTime');
        $grid ['field'] = 'msgwall_id';
        $grid ['title'] = '上墙活动';
        $list_grids ['msgwall_id'] = $grid;
        
        $grid ['field'] = 'openid';
        $grid ['title'] = '用户';
        $list_grids ['openid'] = $grid;
        
        $grid ['field'] = 'content';
        $grid ['title'] = '留言内容';
        $list_grids ['content'] = $grid;

        $grid ['field'] = 'cTime';
        $grid ['title'] = '留言时间';
        $list_grids ['cTime'] = $grid;
        $list_data ['list_grids'] = $list_grids;
        
        $map['token']=get_token();
        $msgwall=M('mini_msgwall')->where($map)->getFields('id,title');
        foreach ($list_data['list_data'] as &$vo){
            $uid=get_uid_by_openid(true,$vo['openid']);
            $vo['openid']=get_username($uid);
            $vo['msgwall_id']=$msgwall[$vo['msgwall_id']];
            $vo['cTime']=time_format($vo['cTime']);
        }
        $this->assign($list_data);
        $this->display('lists');
        
    }
    
    //精彩回放列表
    function picLists(){
        $this->assign ( 'add_button', false );
        $this->assign ( 'del_button', false );
        $this->assign ( 'search_button', false );
        $this->assign ( 'check_all', false );
        
        $id=I('id');
        $maplive['live_id']=$id;
        session('common_condition',$maplive);
        $model = $this->getModel ( 'mini_live_pic' );
        
        $liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($id);
        $list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
        
        $list_data['fields']=array('live_id','openid','pic_url','cTime');
        $grid ['field'] = 'live_id';
        $grid ['title'] = '现场活动';
        $list_grids ['live_id'] = $grid;
        
        $grid ['field'] = 'openid';
        $grid ['title'] = '用户';
        $list_grids ['openid'] = $grid;
        
        $grid ['field'] = 'pic_url';
        $grid ['title'] = '回放图片';
        $list_grids ['pic_url'] = $grid;

        $grid ['field'] = 'cTime';
        $grid ['title'] = '上传时间';
        $list_grids ['cTime'] = $grid;
        $list_data ['list_grids'] = $list_grids;
        
        foreach ($list_data['list_data'] as &$vo){
            $uid=get_uid_by_openid(true,$vo['openid']);
            $vo['openid']=get_username($uid);
            $vo['live_id']=$liveInfo['title'];
            $vo['cTime']=time_format($vo['cTime']);
            if (empty($vo['cover_id'])){
                $coverid=down_media($vo['media_id']);
                if ($coverid){
                    $savedata['cover_id']=$coverid;
                    M('mini_live_pic')->where(array('id'=>$vo['id']))->save($savedata);
                    $vo['pic_url']="<img src='".get_cover_url($coverid)."' class='list_img'>";
                }
                $vo['pic_url']="";
            }else{
                $vo['pic_url']="<img src='".get_cover_url($vo['cover_id'])."' class='list_img'>";
            }
           
        }
        $this->assign($list_data);
        $this->display('lists');
    
    }
    
    //黑名单列表
    function blackLists(){
        $this->assign ( 'add_button', false );
        $this->assign ( 'del_button', false );
        $this->assign ( 'search_button', false );
        $this->assign ( 'check_all', false );
    
        $id=I('id');
        $maplive['live_id']=$id;
        $maplive['is_black']=1;
        session('common_condition',$maplive);
        $model = $this->getModel ( 'upwall_user' );
    
        $liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($id);
        $list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
        $list_data['fields']=array('live_id','openid');
        $grid ['field'] = 'live_id';
        $grid ['title'] = '现场活动';
        $list_grids ['live_id'] = $grid;
    
        $grid ['field'] = 'openid';
        $grid ['title'] = '黑名单用户';
        $list_grids ['openid'] = $grid;
    
        $list_data ['list_grids'] = $list_grids;
    
        foreach ($list_data['list_data'] as &$vo){
            empty($vo['uid']) && $vo['uid']=get_uid_by_openid(true,$vo['openid']);
            $vo['openid']=get_username($vo['uid']);
            $vo['live_id']=$liveInfo['title'];
        }
        $this->assign($list_data);
        $this->display('lists');
    
    }
    //复制创建
    function copyadd(){
    	$liveId=I('live_id');
    	$liveInfo=D('Addons://MiniLive/MiniLive')->getInfo($liveId);
    	unset($liveInfo['id']);
    	$liveInfo['cTime']=time();
    	unset($liveInfo['qrcode']);
    	$liveInfo['status']=0;
    	$id=M('mini_live')->add($liveInfo);
    	if ($id){
    		//添加控制器
    		$addMonitor['live_id']=$id;
    		$addMonitor['token']=get_token();
    		M('mini_monitor')->add($addMonitor);
    		echo $id;
    	}else{
    		echo 0;
    	}
    }
    
}
