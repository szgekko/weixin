<?php

namespace Addons\Wuguai;
use Common\Controller\Addon;

/**
 * 天下无拐插件
 * @author 凡星
 */

    class WuguaiAddon extends Addon{

        public $info = array(
            'name'=>'Wuguai',
            'title'=>'天下无拐',
            'description'=>'家长上传丢失孩子照片时系统立即通过脸部识别技术匹配近期志愿者上传的可疑的孩子的照片，并当场给出匹配结果
志愿者发现可疑小孩时通过拍照上传照片，系统自动匹配丢失的孩子家长上传的孩子图库，如匹配自动通知志愿者和家长
为鼓励和招募更多志愿者参与打拐，平台通过家长悬赏和爱心捐赠两个方式来凑集资金奖励志愿者',
            'status'=>1,
            'author'=>'凡星',
            'version'=>'0.1',
            'has_adminlist'=>1
        );

	public function install() {
		$install_sql = './Addons/Wuguai/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Wuguai/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }