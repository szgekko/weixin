<?php

namespace Addons\ShopCoupon;
use Common\Controller\Addon;

/**
 * 代金券插件
 * @author 凡星
 */

    class ShopCouponAddon extends Addon{

        public $info = array(
            'name'=>'ShopCoupon',
            'title'=>'代金券',
            'description'=>'商城版',
            'status'=>1,
            'author'=>'凡星',
            'version'=>'0.1',
            'has_adminlist'=>1
        );

	public function install() {
		$install_sql = './Addons/ShopCoupon/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/ShopCoupon/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }