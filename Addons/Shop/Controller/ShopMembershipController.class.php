<?php
namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class ShopMembershipController extends BaseController
{

    var $model;

    function _initialize()
    {
        $this->model = $this->getModel('shop_membership');
        parent::_initialize();
    }
    // 通用插件的列表模型
    public function lists()
    {
        $map['token'] = get_token();
        $map['uid'] = $this->mid;
        // $map['shop_id'] = $this->shop_id;
        session('common_condition', $map);
        $list_data = $this->_get_model_list($this->model);
        $this->assign($list_data);
        $templateFile = $this->model['template_list'] ? $this->model['template_list'] : '';
        $this->display($templateFile);
    }
    // 通用插件的编辑模型
    public function edit()
    {
        $id = I('id');
        // 获取数据
        $data = M(get_table_name($this->model['id']))->find($id);
        $data || $this->error('数据不存在！');
        if (IS_POST) {
            $this->_checkdata($_POST);
            $Model = D(parse_name(get_table_name($this->model['id']), 1));
            // 获取模型的字段信息
            $Model = $this->checkAttr($Model, $this->model['id']);
            if ($Model->create() && $Model->save()) {
                // 清空缓存
                method_exists($Model, 'clear') && $Model->clear($id, 'edit');
                // $url= '<script language=javascript>history.go(-1);</script>';
                $this->success('保存' . $this->model['title'] . '成功！', U('lists?model=' . $this->model['name'], $this->get_param));
            } else {
                $this->error($Model->getError());
            }
        } else {
            $fields = get_model_attribute($this->model['id']);
            $this->assign('fields', $fields);
            $this->assign('data', $data);
            
            $this->display();
        }
    }
    
    // 通用插件的增加模型
    public function add()
    {
        if (IS_POST) {
            $this->_checkdata($_POST);
            $Model = D(parse_name(get_table_name($this->model['id']), 1));
            // 获取模型的字段信息
            $Model = $this->checkAttr($Model, $this->model['id']);
            if ($Model->create() && $id = $Model->add()) {
                // 清空缓存
                method_exists($Model, 'clear') && $Model->clear($id, 'add');
                
                $this->success('添加' . $this->model['title'] . '成功！', U('lists?model=' . $this->model['name'], $this->get_param));
            } else {
                $this->error($Model->getError());
            }
        } else {
            $fields = get_model_attribute($this->model['id']);
            $this->assign('fields', $fields);
            $this->display();
        }
    }
    
    // 通用插件的删除模型
    public function del()
    {
        parent::common_del($this->model);
    }

    function _checkdata($data)
    {
        if ($data['condition'] < 0) {
            $this->error('会员升级条件不能小于0');
        }
    }
}
