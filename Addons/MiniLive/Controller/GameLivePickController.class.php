<?php

namespace Addons\MiniLive\Controller;
use Home\Controller\AddonsController;

class GameLivePickController extends AddonsController{
    function lists() {
        $model = $this->getModel ( 'mini_game_live_pick' );
        $list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
        $this->assign($list_data);
        $this->display();
    }
    function add() {
        $model = $this->getModel ( 'mini_game_live_pick' );
        $this->assign('post_url',U('add',$this->get_param));
        if (IS_POST) {
            $Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
            // 获取模型的字段信息
            $Model = $this->checkAttr ( $Model, $model ['id'] );
            if ($Model->create () && $id = $Model->add ()) {
                // 清空缓存
                method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'add' );
                $this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'], $this->get_param ) );
            } else {
                $this->error ( $Model->getError () );
            }
        } else {
            $fields = get_model_attribute ( $model ['id'] );
            $this->assign ( 'fields', $fields );
            $this->display ( 'edit' );
        }
    }
    function edit() {
        $id = I ( 'id' );
        $model = $this->getModel ( 'mini_game_live_pick' );
        if (IS_POST) {
            $Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
            // 获取模型的字段信息
            $Model = $this->checkAttr ( $Model, $model ['id'] );
            $res = false;
            $Model->create () && $res=$Model->save ();
            if ($res !== false) {
                $this->success('保存' . $model['title'] . '成功！', U('lists?model=' . $model['name'], $this->get_param));
            } else {
                $this->error ( $Model->getError () );
            }
        } else {
            // 获取数据
            $data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
            $data || $this->error ( '数据不存在！' );
            $token = get_token ();
            if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
                $this->error ( '非法访问！' );
            }
            $this->assign ( 'data', $data );
            $fields = get_model_attribute ( $model ['id'] );
            $this->assign ( 'fields', $fields );
            $this->display ();
        }
    }
}
