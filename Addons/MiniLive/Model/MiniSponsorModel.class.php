<?php

namespace Addons\MiniLive\Model;
use Think\Model;

/**
 * Sponsor模型
 * 赞助商
 */
class MiniSponsorModel extends Model{

    function set($msgwall_id, $post) {
        $opt_data ['msgwall_id'] = $msgwall_id;
        foreach ( $post ['name'] as $key => $opt ) {
            if (empty ( $opt ))
                continue;
            	
            $opt_data ['name'] = $opt;
            $opt_data ['img'] = $post ['image'] [$key];
            $opt_data ['sort'] = intval ( $post ['order'] [$key] );
            if ($key > 0) {
                // 更新选项
                $optIds [] = $map ['id'] = $key;
                $this->where ( $map )->save ( $opt_data );
            } else {
                // 增加新选项
                $opt_data['token']=get_token();
                $optIds [] = $this->add ( $opt_data );
            }
            // dump(M()->getLastSql());
        }
        // 删除旧选项
        if ($optIds){
            $map2 ['id'] = array (
            		'not in',
            		$optIds
            );
            $map2 ['msgwall_id'] = $opt_data ['msgwall_id'];
            $delsave ['is_del'] =1;
            $this->where ( $map2 )->save ($delsave);
        }
    
        $this->clear ( $msgwall_id );
    }
    
    // 通用的清缓存的方法
	function clear($msgwall_ids, $type = '', $uid = '') {
		is_array ( $msgwall_ids ) || $msgwall_ids = explode ( ',', $msgwall_ids );
		
		foreach ( $msgwall_ids as $msgwall_id ) {
			$this->getList ( $msgwall_id, true );
		}
	}
	
	// 获取信息
	function getList($msgwall_id, $update = false, $list = array()) {
	    $key = 'MiniSponsor_getList_' . $msgwall_id;
	    $info = S ( $key );
	    if ($info === false || $update) {
	        if (empty ( $list )) {
	            $map ['msgwall_id'] = $msgwall_id;
	            $map ['token'] =get_token();
	            $map ['is_del']=0;
	            $info = $this->where ( $map )->order ( '`sort` asc' )->select ();
	        } else {
	            $info = $list;
	        }
	        S ( $key, $info );
	    }
	
	    return $info;
	}
}
