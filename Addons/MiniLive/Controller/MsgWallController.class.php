<?php

namespace Addons\MiniLive\Controller;
use Home\Controller\AddonsController;

class MsgWallController extends AddonsController{
    function lists() {
        $model = $this->getModel ( 'mini_msgwall' );
        $list_data = $this->_get_model_list ( $model, 0, 'id desc', true );
        $this->assign($list_data);
        $this->display();
    }
    function add() {
        $model = $this->getModel ( 'mini_msgwall' );
        $this->assign('post_url',U('add',$this->get_param));
        if (IS_POST) {
            $_POST['gallery_pic']=implode(',', $_POST['gallery_pic']);
            $Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
            // 获取模型的字段信息
            $Model = $this->checkAttr ( $Model, $model ['id'] );
            if ($Model->create () && $id = $Model->add ()) {
                // 增加赞助商
                D ( 'Addons://MiniLive/MiniSponsor' )->set ( $id, I ( 'post.' ) );
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
        $model = $this->getModel ( 'mini_msgwall' );
        if (IS_POST) {
            $_POST['gallery_pic']=implode(',', $_POST['gallery_pic']);
            $Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
            // 获取模型的字段信息
            $Model = $this->checkAttr ( $Model, $model ['id'] );
            $res = false;
            $Model->create () && $res = $Model->save ();
            if ($res !== false) {
               D ( 'Addons://MiniLive/MiniSponsor' )->set ( $id, I ( 'post.' ) );
               // 清空缓存
               method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'save' );
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
            $data['gallery_pic']=explode(',', $data['gallery_pic']);
            $this->assign ( 'data', $data );
            $fields = get_model_attribute ( $model ['id'] );
            $this->assign ( 'fields', $fields );
            $sponsors = D ( 'Addons://MiniLive/MiniSponsor' )->getList ( $id );
            $this->assign ( 'sponsor_list', $sponsors );
            
            $this->display ();
        }
    }
    
    
    
}
