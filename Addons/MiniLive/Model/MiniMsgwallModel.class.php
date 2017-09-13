<?php

namespace Addons\MiniLive\Model;
use Think\Model;

/**
 * Sponsor模型
 * 赞助商
 */
class MiniMsgwallModel extends Model{
    
    function getInfo($id, $field = '', $update = false, $data = array()) {
		$key = 'MiniMsgwall_getInfo_' . $id;
		$info = S ( $key );
		if ($info === false || $update) {
			$info = empty ( $data ) ? $this->field ( true )->find ( $id ) : $data;
			S ( $key, $info, 86400 );
		}
		return empty ( $field ) ? $info : $info [$field];
	}
    
    // 通用的清缓存的方法
    function clear($shakeIds, $type = '', $uid = '') {
        is_array ( $shakeIds ) || $shakeIds = explode ( ',', $shakeIds );
    
        foreach ( $shakeIds as $shakeId ) {
            $this->getInfo($shakeId,'',true);
        }
    }
    
    //获取用户留言
    function get_content($openid,$liveId,$wallId,$shakeCount=0,$update=false){
        $key="MiniMsgwall_get_content".$openid.'_'.$liveId.'_'.$wallId.'_'.$shakeCount;
        $info=S($key);
        if ($info === false || $update){
            $map['live_id']=$liveId;
            $map['openid']=$openid;
            if ($shakeCount !=0){
                $map['shake_count']=$shakeCount;
            }
            if ($wallId == 0){
                $wallId =D('Addons://MiniLive/MiniLive')->getInfo($liveId,'msgwall_id');
            }
            $map['msgwall_id']=$wallId;
            $info = M('msgwall_content')->where($map)->order('cTime desc')->select();
            S ( $key, $info, 86400 );
        }
        return $info;
    }
    function add_content($content,$openid,$liveId,$wallId,$shake_count=0){
        $savedata['cTime']=time();
        $savedata['live_id']=$liveId;
        $savedata['content']=$content;
        $savedata['openid']=$openid;
        $savedata['msgwall_id']=$wallId;
        $savedata['shake_count']=$shake_count;
        M('msgwall_content')->add($savedata);
        $this->get_content($openid, $liveId,$wallId,$shake_count,true);
    }
    
}
