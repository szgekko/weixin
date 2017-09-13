<?php

namespace Addons\MiniLive\Model;
use Think\Model;

/**
 * MiniLive模型
 */
class MiniLiveModel extends Model{
    function getInfo($id, $field = '', $update = false, $data = array()) {
        $key = 'MiniLive_getInfo_' . $id;
        $info = S ( $key );
        if ($info === false || $update) {
            $info = empty ( $data ) ? $this->field ( true )->find ( $id ) : $data;
            if ($info){
                $shakeMap['id']=$info['shake_id'];
                $info['shake_title']=M('mini_shake')->where($shakeMap)->getField('title');
                $livePickMap['id']=$info['live_id'];
                $info['live_pick_title']=M('mini_game_live_pick')->where($livePickMap)->getField('title');
                $wallMap['id']=$info['msgwall_id'];
                $info['msgwall_title']=M('mini_msgwall')->where($wallMap)->getField('title');
            }
            S ( $key, $info, 86400 );
        }
        return empty ( $field ) ? $info : $info [$field];
    }
    // 通用的清缓存的方法
    function clear($ids, $type = '', $uid = '') {
        is_array ( $ids ) || $ids = explode ( ',', $ids );
        foreach ( $ids as $id ) {
            $this->getInfo($id,'',true);
        }
    }
    
    //获取已启动的现场
    function getLive(){
        $map['status']=1;
        $map['token']=get_token();
        $id=$this->where($map)->getField('id');
        if ($id){
            return $this->getInfo($id);
        }else{
            return false;
        }
    }
    //设置用户上场,并返回用户可否上场状态
    function isUpUser($uid,$liveId,$state=-1,$openid=''){
        //0：未上场，1：可上场， 2：黑名单
        $upMap['live_id']=$liveId;
        if ($uid !=0){
            $upMap['uid']=$uid;
        }else if ($openid && $uid ==0){
            $upMap['openid']=$openid;
        }
        $data=M('upwall_user')->where($upMap)->find();
        if ($state == -1){
            if ($data['is_black']==1){
                return 2;
            }else{
                return intval($data['state']);
            }
        }
        if (empty($data)){
            if ($uid == 0 ){
               $uid= get_uid_by_openid(true,$openid) ;
            }
            $data['cTime']=time();
            $data['state']=$state;
            $data['uid']=$uid;
            $data['live_id']=$liveId;
            $data['is_black']=0;
            $data['openid']=$openid;
            M('upwall_user')->add($data);
        }else if ($data['state'] != $state){
            $data['state']= $save['state']= $state;
            M('upwall_user')->where($upMap)->save($save);
        }
        if ($data['is_black']==1){
              return 2;
        }else{
              return intval($data['state']);
        }
    }
    
    //上场回复 随机字符串
    function _str_rand(){
        $strarr=array(
            '么么哒，还在围观？',
            '么么哒，快到碗里来！',
            '么么哒!',
            '亲，还在等什么？'
        );
        shuffle($strarr);
        return $strarr[0];
    }
    
    function get_pic($openid,$liveId,$save=NULL){
        $map['openid']=$openid;
        $map['live_id']=$liveId;
        if (empty($save)){
            $res = M('upwall_user')->where($map)->getField('is_pic');
            return $res;
        }else{
            $res=M('upwall_user')->where($map)->save($save);
            return $res;
        }
       
    }
}
