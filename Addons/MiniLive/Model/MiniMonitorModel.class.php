<?php

namespace Addons\MiniLive\Model;
use Think\Model;

/**
 * MiniLive模型
 * 摇控器
 */
class MiniMonitorModel extends Model{
    //根据现场id获取摇控器
    function getInfo($live_id, $field = '', $update = false, $data = array()) {
        $key = 'MiniMonitor_getInfo_' . $live_id;
        $info = S ( $key );
        if ($info === false || $update) {
            $map['live_id']=$live_id;
            $map['token']=get_token();
            $info = empty ( $data ) ? $this->where($map)->find () : $data;
            S ( $key, $info, 86400 );
        }
        return empty ( $field ) ? $info : $info [$field];
    }
    // 通用的清缓存的方法
    function clear($live_ids, $type = '', $uid = '') {
        is_array ( $live_ids ) || $live_ids = explode ( ',', $live_ids );
        foreach ( $live_ids as $id ) {
            $this->getInfo($id,'',true);
        }
    }
    
    function update($live_id,$save){
        $map['live_id']=$live_id;
        $map['token']=get_token();
        $res=$this->where($map)->save($save);
        if($res){
            $this->clear($live_id);
        }
    }
    
}
