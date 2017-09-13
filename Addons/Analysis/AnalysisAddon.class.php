<?php

namespace Addons\Analysis;
use Common\Controller\Addon;

/**
 * 统计分析插件
 * @author 凡星
 */

    class AnalysisAddon extends Addon{

        public $info = array(
            'name'=>'Analysis',
            'title'=>'统计分析',
            'description'=>'摇电视人数统计，擂鼓统计，抽奖统计',
            'status'=>1,
            'author'=>'凡星',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Analysis/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Analysis/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }