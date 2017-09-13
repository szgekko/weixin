<?php

namespace Addons\Weiba\Widget;

use Home\Controller\AddonsController;

class FeedListWidget extends AddonsController {
	public function lists($param) {
		$list = D ( 'Feed' )->getList ( $param );
		$this->assign ( $list );
		
		$this->display ( 'FeedList/lists' );
	}
}
