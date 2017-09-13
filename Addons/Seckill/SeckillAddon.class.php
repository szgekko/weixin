<?php

namespace Addons\Seckill;
use Common\Controller\Addon;

/**
 * 秒杀插件
 * @author jacy
 */

    class SeckillAddon extends Addon{

        public $info = array(
            'name'=>'Seckill',
            'title'=>'秒杀',
            'description'=>'设置商品秒杀活动',
            'status'=>1,
            'author'=>'jacy',
            'version'=>'0.1',
            'has_adminlist'=>1
        );

	public function install() {
		$install_sql = './Addons/Seckill/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Seckill/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }