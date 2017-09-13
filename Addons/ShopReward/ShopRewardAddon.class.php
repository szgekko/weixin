<?php

namespace Addons\ShopReward;
use Common\Controller\Addon;

/**
 * 促销活动插件
 * @author 凡星
 */

    class ShopRewardAddon extends Addon{

        public $info = array(
            'name'=>'ShopReward',
            'title'=>'促销活动',
            'description'=>'支持的促销活动有：
全场免邮费
满额免邮费
满额赠礼品
买就赠（订单）
限时折扣
打折促销
买1赠1
买就赠（单品）',
            'status'=>1,
            'author'=>'凡星',
            'version'=>'0.1',
            'has_adminlist'=>1
        );

	public function install() {
		$install_sql = './Addons/ShopReward/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/ShopReward/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }