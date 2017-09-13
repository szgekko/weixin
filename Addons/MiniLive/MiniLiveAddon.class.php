<?php

namespace Addons\MiniLive;
use Common\Controller\Addon;

/**
 * 微现场插件
 * @author mandx
 */

    class MiniLiveAddon extends Addon{

        public $info = array(
            'name'=>'MiniLive',
            'title'=>'微现场',
            'description'=>'微现场中有微上墙、摇一摇游戏、微现场抽奖',
            'status'=>1,
            'author'=>'mandx',
            'version'=>'0.1',
            'has_adminlist'=>1
        );

	public function install() {
		$install_sql = './Addons/MiniLive/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/MiniLive/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }