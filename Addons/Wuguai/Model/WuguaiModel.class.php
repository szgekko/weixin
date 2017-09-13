<?php

namespace Addons\Wuguai\Model;

use Think\Model;

/**
 * Wuguai模型
 */
class WuguaiModel extends Model {
	// 识别图片中的人是否在丢失人图库中
	function check_lose($imgs) {
		$this->_check_person ( $imgs );
	}
	// 识别图片中的人是否在可疑人图库中
	function check_suspicious($imgs) {
		$this->_check_person ( $imgs, 'suspicious' );
	}
	// 通用的识别方法
	private function _check_person($imgs, $type = 'lose') {
	}
	// 增加人到系统图库中
	function add_person($person, $type = 'lose') {
	}
	// 从系统图库中删除人
	function add_person($person, $type = 'lose') {
	}
}
