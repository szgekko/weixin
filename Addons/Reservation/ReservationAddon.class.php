<?php

namespace Addons\Reservation;
use Common\Controller\Addon;

/**
 * 预约挂号插件
 * @author jacy
 */

    class ReservationAddon extends Addon{

        public $info = array(
            'name'=>'Reservation',
            'title'=>'预约挂号',
            'description'=>'提供医院或者诊所的放号管理和病人预约挂号',
            'status'=>1,
            'author'=>'jacy',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Reservation/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Reservation/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }