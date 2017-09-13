<?php

namespace Addons\Shop\Controller;

use Addons\Shop\Controller\BaseController;

class GoodsController extends BaseController {
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop_goods' );
		parent::_initialize ();
		$type = I ( 'type', 0, 'intval' );
		$param ['mdm'] = $_GET ['mdm'];
		$param ['type'] = 0;
		$res ['title'] = '出售中的商品';
		$res ['url'] = addons_url ( 'Shop://Goods/lists', $param );
		$res ['class'] = _ACTION == 'lists' && $type == 0 ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 4;
		$res ['title'] = '待上架的商品';
		$res ['url'] = addons_url ( 'Shop://Goods/lists', $param );
		$res ['class'] = _ACTION == 'lists' && $type == 4 ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 1;
		$res ['title'] = '已售罄的商品';
		$res ['url'] = addons_url ( 'Shop://Goods/lists', $param );
		$res ['class'] = _ACTION == 'lists' && $type == 1 ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 2;
		$res ['title'] = '下架的商品';
		$res ['url'] = addons_url ( 'Shop://Goods/lists', $param );
		$res ['class'] = _ACTION == 'lists' && $type == 2 ? 'current' : '';
		$nav [] = $res;
		
		$param ['type'] = 3;
		$res ['title'] = '商品回收站';
		$res ['url'] = addons_url ( 'Shop://Goods/lists', $param );
		$res ['class'] = _ACTION == 'lists' && $type == 3 ? 'current' : '';
		$nav [] = $res;
		
		$isUser = get_userinfo ( $this->mid, 'manager_id' );
		if (! $isUser) {
			
			if (_ACTION == 'edit') {
				$res ['title'] = '编辑商品';
				$res ['url'] = '#';
				$res ['class'] = 'current';
				$nav [] = $res;
			} else if (_ACTION == 'add') {
				$map ['mdm'] = $_GET ['mdm'];
				$res ['title'] = '发布商品';
				$res ['url'] = addons_url ( 'Shop://Goods/add', $map );
				$res ['class'] = _ACTION == 'add' ? 'current' : '';
				$nav [] = $res;
			}
		}
		$this->assign ( 'nav', $nav );
	}
	//将有规格的商品库存，锁定数量加到商品表
	function set_sku_num(){
// 	    $map['token']=get_token();
// 	    $map['is_delete']=array('neq',2);
// 	    $ids = M('shop_goods')->where($map)->getFields('id');
// 	    if (!empty($ids)){
// 	        $smap['goods_id']=array('in'=>$ids);
// 	    }
	    $dao = D('Addons://Shop/Goods');
	    $skuData = M('shop_goods_sku_data')->field('goods_id,sum(lock_num) as lockNum,sum(stock_num) as stockNum')->group('goods_id')->select();
	    foreach ($skuData as $v){
	        $save['lock_num']=$v['lockNum'];
	        $save['stock_num']=$v['stockNum'];
	        $dao->updateById($v['goods_id'],$save);
	        unset($save);
	    }
	}
	
	// 通用插件的列表模型
	public function lists() {
		$this->set_sku_num();
		$config = get_addon_config ( 'Shop' );
		$isAjax = I ( 'isAjax' );
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$isUser = get_userinfo ( $this->mid, 'manager_id' );
		$type = I ( 'type', 0, 'intval' );
		
		$is_seckill = I ( 'is_seckill' );
		$this->assign ( 'is_seckill', $is_seckill );
		$res ['title'] = '新增商品';
		$res ['is_buttion'] = 0;
		$res ['url'] = addons_url ( 'Shop://Goods/add', array (
				'mdm' => $_GET ['mdm'] 
		) );
		$res ['class'] = 'btn';
		$top_more_button [] = $res;
		
		if (! $isUser) {
			if ($type == 0 || $type == 1) {
				$res ['title'] = '批量下架';
				$res ['is_buttion'] = 1;
				$res ['url'] = addons_url ( 'Shop://Goods/set_down?val=0', $this->get_param );
				$res ['class'] = 'btn ajax-post confirm';
				$top_more_button [] = $res;
			} elseif ($type == 2) {
				$res ['title'] = '批量上架';
				$res ['is_buttion'] = 1;
				$res ['url'] = addons_url ( 'Shop://Goods/set_down?val=1', $this->get_param );
				$res ['class'] = 'btn ajax-post confirm';
				$top_more_button [] = $res;
				
				$res ['title'] = '批量删除';
				$res ['is_buttion'] = 1;
				$res ['url'] = addons_url ( 'Shop://Goods/del?val=0', $this->get_param );
				$res ['class'] = 'btn ajax-post confirm';
				$top_more_button [] = $res;
			} elseif ($type == 3) {
				$res ['title'] = '批量下架';
				$res ['is_buttion'] = 1;
				$res ['url'] = addons_url ( 'Shop://Goods/set_down?val=2', $this->get_param );
				$res ['class'] = 'btn ajax-post confirm';
				$top_more_button [] = $res;
				
				$res ['title'] = '彻底删除';
				$res ['is_buttion'] = 1;
				$res ['url'] = addons_url ( 'Shop://Goods/del?val=1&type=3', $this->get_param );
				$res ['class'] = 'btn ajax-post confirm';
				$top_more_button [] = $res;
			}elseif ($type == 4){
			    $res ['title'] = '批量上架';
			    $res ['is_buttion'] = 1;
			    $res ['url'] = addons_url ( 'Shop://Goods/set_down?val=1', $this->get_param );
			    $res ['class'] = 'btn ajax-post confirm';
			    $top_more_button [] = $res;
			    
			    $res ['title'] = '批量删除';
			    $res ['is_buttion'] = 1;
			    $res ['url'] = addons_url ( 'Shop://Goods/del?val=0', $this->get_param );
			    $res ['class'] = 'btn ajax-post confirm';
			    $top_more_button [] = $res;
			}
		}
		$this->assign ( 'top_more_button', $top_more_button );
		$dif='';
		$map ['is_delete'] = 0;
		if ($type == 1) {
		    //售完
//     		$map ['stock_num'] = 0;
    		$map ['is_show'] = 1;
    		$dif = 'dif <= 0';
		} else if ($type == 2) {
		    //下架
		   $map ['is_show'] = 0;
		} else if ($type == 0) {
		    //出售
    		$map ['is_show'] = 1;
    		$dif='dif > 0';
//     		$map ['stock_num'] = array('neq',0);
		} else if ($type == 3) {
		    //回收站
		    $map ['is_delete'] = 1;
		}else if($type == 4){
		    $map['is_show']=2;
		}
		$map2 ['token'] = $map1 ['token'] = $map ['token'] = get_token ();
		$isUser = getUserInfo ( $this->mid, 'manager_id' );
		
		$goods_category = I ( 'goods_category' );
		// $goods_category && $map ['category_id'] = $goods_category;
		
		if ($goods_category) {
		    $map3 ['token'] = get_token ();
		    $map3 ['shop_id'] = $this->shop_id;
		    // 		$map ['is_show']=1;
		    // 		$map ['is_delete']=0;
		    $map3['category_second|category_first']=array('eq',$goods_category);
		    $goodsIdArr = M('goods_category_link')->where($map3)->getFields('goods_id');
		    $goodsDao = D ( 'Addons://Shop/Goods' );
		    if ($goodsIdArr){
		        $map['id']=array('in',$goodsIdArr);
		    }else{
		        $map['id']=0;
		    }
		}
		
		if ($is_seckill) {
			$skuGoodsIds = M ( 'shop_goods_sku_config' )->field ( 'goods_id' )->group ( 'goods_id' )->select ();
			foreach ( $skuGoodsIds as $key => $value ) {
				if (empty ( $goodsIdArr )) {
					$skuGIds [$value ['goods_id']] = $value ['goods_id'];
				} else {
					foreach ( $goodsIdArr as $k => $v ) {
						if ($v == $value ['goods_id']) {
							unset ( $goodsIdArr [$k] );
						}
					}
				}
			}
			if (empty ( $goodsIdArr ) && ! empty ( $skuGIds )) {
				// code...
				$map ['id'] = array (
						'not in',
						$skuGIds 
				);
			} else if (! empty($goodsIdArr)) {
				$map ['id'] = array (
						'in',
						$goodsIdArr 
				);
			}
		}
		
		session ( 'common_condition', $map );
		//$list_data = $this->_get_model_list ( $this->model );
		$model = $this->model;
		if (empty ( $model ))
		    return false;
		
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		 
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		$fields = $list_data ['fields'];
		
		// 搜索条件
		$map = $this->_search_map ( $model, $fields );
		
		$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];
		
		// 读取模型数据列表
		
		empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		if ($dif){
		    $data = M($name)
		    ->field('(`stock_num`-`lock_num`) as dif,id')
		    ->where($map)
		    ->group('id')
		    ->having($dif)
		    ->order('id desc')
		    ->page($page, $row)
		    ->select();
		    // 		$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( 'id desc' )->page ( $page, $row )->select ();
		    /* 查询记录总数 */
		    // 		$count = M ( $name )->where ( $map )->order('id desc')->count ();
		    $allArr=  M($name)
		    ->field('(`stock_num`-`lock_num`) as dif,id')
		    ->where($map)
		    ->group('id')
		    ->having($dif)
		    ->order('id desc')
		    ->select();
		    $count=count($allArr);
		}else{
		    $data = M($name)
		    ->field('(`stock_num`-`lock_num`) as dif,id')
		    ->where($map)
		    ->group('id')
		    ->order('id desc')
		    ->page($page, $row)
		    ->select();
		    // 		$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( 'id desc' )->page ( $page, $row )->select ();
		    /* 查询记录总数 */
		    // 		$count = M ( $name )->where ( $map )->order('id desc')->count ();
		    $allArr=  M($name)
		    ->field('(`stock_num`-`lock_num`) as dif,id')
		    ->where($map)
		    ->group('id')
		    ->order('id desc')
		    ->select();
		    $count=count($allArr);
		}
       
// 		$lastId=I('get.glastid',0,'intval');
// 		if ($lastId) {
// 		    $map['id']=array('lt',$lastId);
// 		}
// 		$data = M ( $name )->where ( $map )->order('id desc')->select ();
		
		
		$goodsDao = D ( "Addons://Shop/Goods" );
// 		foreach ($alldd as $d){
// 		    $gdata = $goodsDao->getInfo ( $d ['id'] );
// 		    if ($type == 1 && $gdata ['stock_total_num'] == 0 && $gdata ['is_show'] == 1) {
// 		        $count++;
// 		    } else if ($type == 0 && $gdata ['is_show'] == 1 && $gdata ['stock_total_num'] != 0) {
// 		        $count++;
// 		    } else if ($type == 2 && $gdata ['is_show'] == 0) {
// 		        $count++;
// 		    } else if ($type == 3 && $gdata ['is_delete'] == 1) {
// 		        $count++;
// 		    }
// 		}
		// 分类数据
		$map2 ['is_show'] = 1;
		$list = M ( 'shop_goods_category' )->where ( $map2 )->field ( 'id,title' )->select ();
		$cate [0] = '';
		foreach ( $list as $vo ) {
			$cate [$vo ['id']] = $vo ['title'];
		}
		
		$saleCount = D ( 'Addons://Shop/Order' )->getGoodsSaleCount ( $this->shop_id );
		foreach ( $data as $vo ) {
			$cateArr = wp_explode ( $vo ['category_id'] );
			// $vo ['category_id'] = intval ( $vo ['category_id'] );
			$cateStr = '';
			foreach ( $cateArr as $ca ) {
				$cateStr .= $cate [$ca] . '/';
			}
			$gdata = $goodsDao->getInfo ( $vo ['id'] );
			$gdata ['category_id'] = $cateStr;
			$gdata ['sale_count'] = intval ( $saleCount [$vo ['id']] );
			$gdata ['stock_num'] = $gdata ['stock_total_num']<=0?0:$gdata ['stock_total_num'];
			$allData [] = $gdata;
// 			if ($type == 1 && $gdata ['stock_total_num'] == 0 && $gdata ['is_show'] == 1) {
// 				$allData [] = $gdata; // 售完
// 			} else if ($type == 0 && $gdata ['is_show'] == 1 && $gdata ['stock_total_num'] != 0) {
// 				$allData [] = $gdata; // 上架
// 			} else if ($type == 2 && $gdata ['is_show'] == 0) {
// 				$allData [] = $gdata; // 下架
// 			} else if ($type == 3 && $gdata ['is_delete'] == 1) {
// 				$allData [] = $gdata; // 回收站
// 			}
// 			$allGoodsIds [$vo ['id']] = $vo ['id'];
			// $downShelfGoods ? $vo ['is_show'] = in_array ( $vo ['id'], $downShelfGoods ) ? 0 : 1 : '';
		}
		$list_data ['list_data'] = $allData;
		
		// dump($list_data['list_data']);
		if ($isUser) {
			$this->assign ( 'add_button', false );
			$this->assign ( 'del_button', false );
			$this->assign ( 'check_all', false );
			unset ( $list_data ['list_grids'] ['ids'] );
			// $list_data ['list_grids'] ['ids'] ['href'] = 'set_show?id=[id]&is_show=[is_show]|改变分销商品状态';
		}
		$this->assign ( 'goods_category', $list );
		// 分页
		if ($count > $row) {
		    $page = new \Think\Page ( $count, $row );
		    $page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
		    $list_data ['_page'] = $page->show ();
		}
		if ($isAjax) {
			foreach ( $list_data ['list_data'] as &$dd ) {
				if (isset ( $dd ['sku_data'] )) {
					foreach ( $dd ['sku_data'] as $ss ) {
						if (! empty ( $ss ['sale_price'] )) {
							$ss ['market_price'] = $ss ['sale_price'];
						}
					}
				} else {
					if (! empty ( $dd ['sale_price'] )) {
						$dd ['market_price'] = $dd ['sale_price'];
					}
				}
			}
			// unset ( $list_data ['list_grids'] ['market_price'] );
			unset ( $list_data ['list_grids'] ['sale_count'] );
			unset ( $list_data ['list_grids'] ['is_show|get_name_by_status'] );
			unset ( $list_data ['list_grids'] ['ids'] );
			
			$this->assign ( $list_data );
			$this->display ( 'lists_data' );
		} else {
			$list_data ['list_grids'] ['ids'] ['href'] = $list_data ['list_grids'] ['ids'] ['href'] . ',detail?shop_id' . $this->shop_id . '&id=[id]&_controller=Wap|复制链接';
			if ($type == 0){
			    $list_data ['list_grids'] ['ids'] ['href']=str_replace('改变上架状态', '改变为下架状态', $list_data ['list_grids'] ['ids'] ['href'] );
			}
			$this->assign ( $list_data );
			$this->display ();
		}
	}
	function isUrl($url){
	    $regex = "((http|ftp|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\&%_\./-~-]*)?";
	    $res =preg_match($regex,$url);
	    if($res){
	        return true;
	    }else {
	        return false;
	    }
	    
	}
	function _check_post_data($data){
	   
	    if (empty($data['cate_first'])){
	        $this->error('请填写添加商品分类','',true);
	        exit();
	    }
	    if ($data['type']==1){
	        $_POST['auto_send']=1;
	        if (empty($data['file_url'])){
	            $this->error('请填写可下载附件url','',true);
	            exit();
	        }
	        if ($this->isUrl($data['file_url'])){
	            $this->error('无效的附件url链接','',true);
	        }
	    }else if($data['type']==2){
	        $_POST['auto_send']=1;
	        $codeArr = wp_explode($data['card_code'], chr(10));
// 	        if (count($codeArr) <= 0) {
// 	            $this->error('点卡序列号不能为空');
// 	        }
            foreach ($codeArr as $cc){
                $cc = trim($cc);
                $news[$cc]=$cc;
            }
	       $data['stock_num']= $_POST['stock_num']=count($news);
	    }
	    //判断有无规格
	    if ($data['is_spec'] != 1){
	        //无规格、删除所配置的规格信息
	        unset($_POST['spec']);
	        unset($_POST['market_price_arr']);
	    }
	    
	    if ($data['is_show'] == 1 && $data['stock_num'] <= 0){
	        $this->error('直接上架，库存必须大于0','',true);
	    }
	    if (!empty($data['market_price_arr']) && $data['type']==0 && $data['is_spec']==1){

	        //有规格
	        $maxMP = max($data['market_price_arr']);
	        $minMP = min($data['market_price_arr']);
	        if (floatval($minMP) <= 0){
	            $this->error('市场价格必须大于0元','',true);
	            exit();
	        }
	        foreach ($data['market_price_arr'] as $key=> $vo){
	            $mp=floatval($vo);//市场价
	            $sp=floatval($data['sale_price_arr'][$key]);//促销价
	            if ($sp >= $mp){
	                $this->error('促销价格应小于市场价格','',true);
	                exit();
	            }
	        }
	        if (floatval($data['distribution_price']) > floatval($maxMP)){
	            $this->error('分销返佣金额 不能大于市场价格','',true);
	            exit();
	        }
           
	    }else{
	        // 没有规格
	        $markPrice = floatval($data['market_price']); // 市场价格
	        $disPrice = floatval($data['distribution_price']); // 分销返佣金额
	        $salePrice = floatval($data['sale_price']); // 促销价格
	        if ($markPrice <= 0) {
	            $this->error('市场价格必须大于0元','',true);
	            exit();
	        }
	        if ($salePrice >= $markPrice) {
	            $this->error('促销价格应小于市场价格','',true);
	            exit();
	        }
	        if ($disPrice > $markPrice) {
	            $this->error('分销返佣金额 不能大于市场价格','',true);
	            exit();
	        }
	        
	    }
	    if (empty($data['title'])){
	        $this->error('请填写商品名称','',true);
	        exit();
	    }
	    if ($data ['imgs'] && count ( $data ['imgs'] ) > 0) {
	        $_POST ['cover'] = $data ['imgs'] [0];
	        $_POST ['imgs'] = implode ( ',', $data ['imgs'] );
	    }else {
	        $this->error('请上传商品图片','',true);
	        exit();
	    }
	    
	}
	// 通用插件的编辑模型
	public function edit() {
		$model = $this->model;
		$id = I ( 'id' );
		$shop_id = $this->shop_id;
		if ($_POST ['auto_send']) {
			$virtualArr = wp_explode ( $_POST ['virtual_textarea'] );
			$_POST ['inventory'] = count ( $virtualArr );
		}
		if (IS_POST) {
			$this->_check_post_data($_POST);
			// 处理扩展信息
			$_POST = $this->_deal_extra_data ( $_POST );
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			// 获取模型的字段信息
			$res = false;
			$Model->create () && $res=$Model->save ();
			if ($res !== false) {
				// D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				// 添加虚拟商品信息
				if ($_POST ['auto_send']) {
					$this->_addVirtualInfo ( $id, $_POST ['virtual_textarea'] );
				}
				// 保存商品分类信息
				$this->set_category ( $id, $shop_id, $_POST );
				// 保存商品参数
				$this->set_param ( $id, $_POST );
				// 保存商品规格配置
				$this->setSpecConfig ( $id, $_POST );
				// 保存商品所在门店
				$this->set_store ( $id, $shop_id, $_POST );
				// 库存处理
				$this->setSpecData ( $id, $_POST );
				//设置点卡编码
				if ($_POST['type'] ==2){
				    $this->set_card_code($id, $_POST['card_code']);
				}
				// 进入详情编辑
				$goodsInfo = D ( 'Goods' )->getInfo ( $id, true );
				$diy_id = $goodsInfo ['diy_id'];
				if ($diy_id) {
					$nextUrl = addons_url ( 'Shop://DiyPage/edit', array (
							'id' => $diy_id,
							'goods_id' => $id,
							'use' => 'goodsDetail',
							'mdm' => I ( 'get.mdm' ) ,
				            'is_show'=>$_POST['is_show']
					) );
				} else {
					$nextUrl = addons_url ( 'Shop://DiyPage/add', array (
							'id' => $diy_id,
							'goods_id' => $id,
							'use' => 'goodsDetail',
							'mdm' => I ( 'get.mdm' ),
				            'is_show'=>$_POST['is_show']
					) );
				}
				
				$this->success ( '保存' . $model ['title'] . '成功！,进入编辑商品详情', $nextUrl,true );
				// U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $shop_id )
			} else {
				$this->error ( $Model->getError (),'',true );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ();
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'category_id') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			// 获取数据
			$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
			
			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}
			// 获取规格配置
			$save ['goods_id'] = $id;
			$spec_config = M ( 'shop_goods_sku_config' )->where ( $save )->group ( 'spec_id' )->field ( 'spec_id' )->order ( 'id asc' )->select ();
			$this->assign ( 'spec_config', $spec_config );
			
			// 获取库存数据
			$goods_sku_data = M ( 'shop_goods_sku_data' )->where ( $save )->select ();
			foreach ( $goods_sku_data as $d ) {
				$sku_data [$d ['spec_option_ids']] = $d;
			}
			$this->assign ( 'goods_sku_data', json_encode ( $sku_data ) );
			
			$data ['imgs'] = explode ( ',', $data ['imgs'] );
			$this->assign ( 'fields', $fields );
			//获取点卡商品序列码
			if ($data['type'] == 2){
			    $smap['token']=$token;
			    $smap['goods_id']=$id;
			    $smap['is_use']=0;
			    $codes = M('shop_virtual')->where($smap)->getFields('card_codes');
			    $str_code='';
			    foreach ($codes as $cc){
			        $str_code.=$cc.chr(10);
			    }
			    $data['card_code']=$str_code;
			}
			$this->assign ( 'data', $data );
			// 商品分类
			$catelists = $this->getCateDatalists ();
			$this->assign ( 'cate_data', $catelists );
			
			$dao = M ( 'goods_category_link' );
			$gmap ['goods_id'] = $id;
			$gmap ['token'] = get_token ();
			$list = $dao->where ( $gmap )->select ();
			$this->assign ( 'cate_list', $list );
			
			// 获取商品参数
			$param_lists = M ( 'goods_param_link' )->where ( array (
					'goods_id' => $id,
					'token' => get_token () 
			) )->order ( 'id asc' )->select ();
			$this->assign ( 'param_lists', $param_lists );
			$this->getSpecList ();
			
			// //获取所有商品门店
			$storeDatas = $this->get_coupon_shop ();
			$this->assign ( 'store_data', $storeDatas );
			
			$storeMap ['goods_id'] = $id;
			$storeMap ['shop_id'] = $shop_id;
			$storeLists = M ( 'goods_store_link' )->where ( $storeMap )->getFields('store_id,goods_id,store_num');
			$this->assign ( 'store_lists', $storeLists );
			
			
			
			$this->display ();
		}
	}
	// 获取所有门店
	function get_coupon_shop() {
		$map ['token'] = get_token ();
		$map ['manager_id'] = $this->mid;
		$data = M ( 'coupon_shop' )->where ( $map )->getFields ( 'id,name' );
		return $data;
	}
	// 通用插件的增加模型
	public function add() {
		$model = $this->model;
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		$shop_id = $_POST ['shop_id'] = $this->shop_id;
		if ($_POST ['auto_send']) {
			$virtualArr = wp_explode ( $_POST ['virtual_textarea'] );
			$_POST ['inventory'] = count ( $virtualArr );
		}
		// dump($_POST);die;
		if (IS_POST) {
			// if (! $_POST ['category_id']) {
			// $this->error ( '请选择商品一级分类' );
			// } else {
			// $cateIdArr = wp_explode ( $_POST ['category_id'], "," );
			// $lev = array (
			// '二',
			// '三'
			// );
			// $ind = count ( $cateIdArr ) - 1;
			// $map ['pid'] = $cateIdArr [$ind];
			// $pcate = D ( 'Addons://Shop/Category' )->where ( $map )->getFields ( 'id' );
			// if ($pcate) {
			// $this->error ( '请选择商品' . $lev [$ind] . '级分类' );
			// }
			// }
			$this->_check_post_data($_POST);
			// 处理扩展信息
			$_POST = $this->_deal_extra_data ( $_POST );
			
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				// D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				
				// 添加虚拟商品信息
				if ($_POST ['auto_send']) {
					$this->_addVirtualInfo ( $id, $_POST ['virtual_textarea'] );
				}
				// 保存商品分类信息
				$this->set_category ( $id, $shop_id, $_POST );
				// 保存商品参数
				$this->set_param ( $id, $_POST );
				
				// 保存商品规格配置
				$this->setSpecConfig ( $id, $_POST );
				
				// 库存处理
				$this->setSpecData ( $id, $_POST );
				// 保存商品所在门店
				$this->set_store ( $id, $shop_id, $_POST );
				//设置点卡编码
				if ($_POST['type'] ==2){
				    $this->set_card_code($id, $_POST['card_code']);
				}
				// 进入详情编辑
				$nextUrl = addons_url ( 'Shop://DiyPage/add', array (
						'id' => 0,
						'goods_id' => $id,
						'use' => 'goodsDetail',
						'mdm' => I ( 'get.mdm' ) ,
				        'is_show'=>$_POST['is_show']
				) );
				$this->success ( '保存' . $model ['title'] . '成功！,进入编辑商品详情', $nextUrl,true );
				
				// $this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] . '&shop_id=' . $shop_id ) );
			} else {
				$this->error ( $Model->getError () ,'',true);
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ();
			
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'category_id') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			$catelists = $this->getCateDatalists ();
			$this->assign ( 'cate_data', $catelists );
			
			$this->assign ( 'fields', $fields );
			$this->assign ( 'post_url', U ( 'add',array('mdm'=>$_GET['mdm']) ) );
			
			$this->getSpecList ();
			
			// 商品门店
			$storeDatas = $this->get_coupon_shop ();
			$this->assign ( 'store_data', $storeDatas );
			$this->display ( 'edit' );
		}
	}
	
	// 通用插件的删除模型
	public function del() {
		$id = I ( 'id' );
		$ids = I ( 'ids' );
		$type = I ( 'get.type' );
		if (! empty ( $id )) {
			$key = 'Goods_getInfo_' . $id;
			$map ['id'] = $id;
			S ( $key, null );
		} else {
			foreach ( $ids as $i ) {
				$key = 'Goods_getInfo_' . $i;
				S ( $key, null );
			}
			$map ['id'] = array (
					'in',
					$ids 
			);
		}
		if ($type == 3) {
			$save ['is_delete'] = 2;
			$save ['is_show'] = 0;
		} else {
			$save ['is_delete'] = 1;
			$save ['is_show'] = 0;
		}
		
		$res = D ( 'Addons://Shop/Goods' )->where ( $map )->save ( $save );
		if ($res && $type == 3) {
			$this->success ( '删除成功' );
		} else if ($res) {
			$this->success ( '商品已加入回收站' );
		}
		
		// parent::common_del ( $this->model );
	}
	// /////////////商品参数配置///////////////////////
	// 保存商品分类
	function set_category($goods_id, $shop_id, $data) {
		$dao = M ( 'goods_category_link' );
		$gmap ['goods_id'] = $goods_id;
		$list = $dao->where ( $gmap )->select ();
		foreach ( $list as $v ) {
			$arr [$v ['sort']] = $v ['id'];
		}
		foreach ( $data ['cate_first'] as $key => $val ) {
			if (empty ( $val )) {
				continue;
			}
			$save ['goods_id'] = $goods_id;
			$save ['token'] = get_token ();
			$save ['shop_id'] = $shop_id;
			$save ['sort'] = $key;
			$save ['category_first'] = intval ( $val );
			$save ['category_second'] = intval ( $data ['select_cate_second'] [$key] );
			if (! empty ( $arr [$key] )) {
				$ids [] = $map ['id'] = $arr [$key];
				$dao->where ( $map )->save ( $save );
			} else {
				$ids [] = $dao->add ( $save );
			}
			unset ( $save );
		}
		$diff = array_diff ( $arr, $ids );
		if (! empty ( $diff )) {
			$map2 ['id'] = array (
					'in',
					$diff 
			);
			$dao->where ( $map2 )->delete ();
		}
	}
	// 保存商品参数
	function set_param($goods_id, $post) {
		foreach ( $post ['goods_param_title'] as $key => $opt ) {
			if (empty ( $opt ))
				continue;
			$opt_data ['goods_id'] = $goods_id;
			$opt_data ['token'] = get_token ();
			$opt_data ['title'] = $opt;
			$opt_data ['param_value'] = $post ['goods_param_value'] [$key];
			if ($key > 0) {
				// 更新选项
				$optIds [] = $map ['id'] = $key;
				M ( 'goods_param_link' )->where ( $map )->save ( $opt_data );
			} else {
				// 增加新选项
				$optIds [] = M ( 'goods_param_link' )->add ( $opt_data );
			}
			unset ( $opt_data );
			// dump(M()->getLastSql());
		}
		if (! empty ( $optIds )) {
			// 删除旧选项
			$map2 ['id'] = array (
					'not in',
					$optIds 
			);
			$map2 ['goods_id'] = $goods_id;
			M ( 'goods_param_link' )->where ( $map2 )->delete ();
		}
		if (empty($post['goods_param_title'])){
		    $map['goods_id']=$goods_id;
		    M ( 'goods_param_link' )->where ( $map )->delete ();
		}
	}
	
	// 保存商品参数
	function set_store($goods_id, $shop_id, $post) {
		foreach ( $post ['goods_store_title'] as $key => $opt ) {
			if (empty ( $opt ))
				continue;
			if (intval ( $post ['goods_store_num'] [$key] <= 0)){
			    continue;
			}
			$opt_data ['goods_id'] = $goods_id;
			$opt_data ['token'] = get_token ();
			$opt_data ['shop_id'] = $shop_id;
			$opt_data ['store_id'] = $opt;
			$opt_data ['store_num'] = intval ( $post ['goods_store_num'] [$key] );
			$map ['id'] = $key;
			$sd = M ( 'goods_store_link' )->where ( $map )->select();
			if ($sd){
			    $optIds [] = $key;
			    M ( 'goods_store_link' )->where ( $map )->save ( $opt_data );
			}else{
			    // 增加新选项
			    $optIds [] = M ( 'goods_store_link' )->add ( $opt_data );
			}
// 			if ($key > 0) {
// 				// 更新选项
// 				$optIds [] = $map ['id'] = $key;
// 				M ( 'goods_store_link' )->where ( $map )->save ( $opt_data );
// 			} else {
// 				// 增加新选项
// 				$optIds [] = M ( 'goods_store_link' )->add ( $opt_data );
// 			}
			unset ( $opt_data );
			// dump(M()->getLastSql());
		}
		if (! empty ( $optIds )) {
			// 删除旧选项
			$map2 ['id'] = array (
					'not in',
					$optIds 
			);
			$map2 ['goods_id'] = $goods_id;
			M ( 'goods_store_link' )->where ( $map2 )->delete ();
		}
	}
	
	// 获取所属分类
	function getCateData() {
		$map ['is_show'] = 1;
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$list = M ( 'shop_goods_category' )->where ( $map )->order('sort asc, id asc')->select ();
		foreach ( $list as $v ) {
			$extra .= $v ['id'] . ':' . $v ['title'] . "\r\n";
		}
		return $extra;
	}
	function getCateDatalists() {
		// $map ['is_show'] = 1;
		$map ['token'] = get_token ();
		$map ['shop_id'] = $this->shop_id;
		$list = M ( 'shop_goods_category' )->where ( $map )->order('sort asc, id asc')->select ();
		foreach ( $list as $vo ) {
			if ($vo ['pid'] == 0) {
				$first [] = $vo;
			} else {
				$second [$vo ['pid']] [] = $vo;
			}
		}
		$data ['first'] = $first;
		$data ['second'] = $second;
		return $data;
	}
	function set_show() {
	    $isShow=I ( 'is_show' );
		$save ['is_show'] = 1 - $isShow;
		$map ['id'] = I ( 'id' );
		
		$isUser = getUserInfo ( $this->mid, 'manager_id' );
		if ($isUser) {
			// 添加到用户下架表
			$map1 ['uid'] = $data ['uid'] = $this->mid;
			$map1 ['token'] = $data ['token'] = get_token ();
			$map1 ['goods_id'] = $data ['goods_id'] = $map ['id'];
			$dao = M ( 'shop_goods_downshelf_user' );
			$goods = $dao->where ( $map1 )->find ();
			$data ['down_shelf'] = $save ['is_show'];
			$savedata ['down_shelf'] = 1 - $goods ['down_shelf'];
			$goods ['id'] ? $dao->where ( array (
					'id' => $goods ['id'] 
			) )->save ( $savedata ) : $dao->add ( $data );
		} else {
			$map ['shop_id'] = $this->shop_id;
			$type = I ( 'type' );
			if ($type == 3||$type == 4) {
				$save ['is_show'] = 1;
				$save ['is_delete'] = 0;
			}
			$res = M ( 'shop_goods' )->where ( $map )->save ( $save );
		}
		
		$this->success ( '操作成功' );
	}
	function set_down() {
		$val = I ( 'get.val' );
		$ids = I ( 'ids' );
		// dump($ids);
		if ($val == 0 || $val == 2) {
			$save ['is_show'] = 0;
		} else if ($val == 1) {
			$save ['is_show'] = 1;
		}
		if (! empty ( $ids )) {
			$map ['id'] = array (
					'in',
					$ids 
			);
			$res = D ( 'Addons://Shop/Goods' )->where ( $map )->save ( $save );
		}
		if ($res) {
			$this->success ( '操作成功' );
		}
	}
	
	// 添加虚拟信息
	function _addVirtualInfo($goods_id, $textareaStr) {
		if (! empty ( $textareaStr )) {
			$model = M ( 'shop_virtual' );
			$arr = wp_explode ( $textareaStr );
			foreach ( $arr as $v ) {
				$accountArr = explode ( '|', $v );
				$map ['goods_id'] = $goods_id;
				$data ['account'] = $map ['account'] = $accountArr [0];
				$data ['password'] = $accountArr [1];
				$data ['is_use'] = 0;
				$data ['goods_id'] = $goods_id;
				$res = $model->where ( $map )->select ();
				if ($res) {
					$model->where ( $map )->save ( $data );
				} else {
					$model->where ( $map )->add ( $data );
				}
			}
		}
	}
	// 获取规格列表
	function getSpecList() {
		$map ['uid'] = $this->mid; // TODO 后续可优化为按token来获取
		$map ['token'] =get_token();
		$list = M ( 'shop_spec' )->where ( $map )->order ( 'sort asc, id desc' )->select ();
		$this->assign ( 'spec_list', $list );
		return $list;
	}
	// 获取规格属性
	function getSpecInfo() {
		$id = $map ['spec_id'] = I ( 'id', 0, intval );
		$data = array ();
		if ($id) {
			$data = M ( 'shop_spec_option' )->where ( $map )->order ( 'sort asc, id desc' )->select ();
			foreach ( $data as $k => $v ) {
				$data [$k] ['checked'] = '';
				$data [$k] ['img'] = C ( 'TMPL_PARSE_STRING.__IMG__' ) . '/spec_img_add.jpg';
			}
			
			// 编辑时的初始化默认值
			$map ['goods_id'] = I ( 'goods_id', 0, 'intval' );
			if (! empty ( $map ['goods_id'] )) {
				$arr = M ( 'shop_goods_sku_config' )->where ( $map )->getFields ( 'option_id,img' );
				foreach ( $data as &$vo ) {
					if (isset ( $arr [$vo ['id']] )) {
						$vo ['checked'] = 'checked';
						empty ( $arr [$vo ['id']] ) || $vo ['img'] = get_cover_url ( $arr [$vo ['id']] );
					}
				}
			}
		}
		$this->ajaxReturn ( $data, 'JSON' );
	}
	// 获取分类下的属性表单
	function getExtraField() {
		$cids = I ( 'cids' );
		$cids = wp_explode ( $cids );
		if (empty ( $cids )) {
			echo '';
			exit ();
		}
		
		$map ['cate_id'] = array (
				'in',
				$cids 
		);
		$fields = M ( 'shop_attribute' )->where ( $map )->order ( 'sort asc, id asc' )->select ();
		
		$id = I ( 'goods_id', 0, 'intval' );
		if (! empty ( $id )) {
			$data = M ( 'shop_goods' )->find ( $id );
			foreach ( $data as &$v ) {
				$val = json_decode ( $v );
				if (is_array ( $val ))
					$v = $val;
			}
			$this->assign ( 'data', $data );
		}
		
		foreach ( $fields as $f ) {
			$field_arr [$f ['type']] [] = $f;
		}
		
		$this->assign ( 'fields', $field_arr );
		
		$this->display ();
	}
	function _deal_extra_data($data) {
		foreach ( $data as $f => $v ) {
			if (is_array ( $v ) && strpos ( $f, 'extra_' ) !== false) {
				$data [$f] = implode ( ',', $v );
			}
		}
		return $data;
	}
	function setSpecConfig($goods_id, $data) {
		$dao = M ( 'shop_goods_sku_config' );
		$save ['goods_id'] = $goods_id;
		
		$list = $dao->where ( $save )->select ();
		foreach ( $list as $v ) {
			$arr [$v ['spec_id'] . '_' . $v ['option_id']] = $v ['id'];
		}
		
		foreach ( $data ['spec'] as $spec_id => $options ) {
			$save ['spec_id'] = $spec_id;
			foreach ( $options as $option_id ) {
				$save ['option_id'] = $option_id;
				$save ['img'] = $data ['specImg'] [$spec_id] [$option_id];
				if (! empty ( $arr [$spec_id . '_' . $option_id] )) {
					$ids [] = $map ['id'] = $arr [$spec_id . '_' . $option_id];
					$dao->where ( $map )->save ( $save );
				} else {
					$ids [] = $dao->add ( $save );
				}
			}
		}
		$diff = array_diff ( $arr, $ids );
		if (empty ( $data ['spec'] )) {
			$diff = $arr;
		}
		if (! empty ( $diff )) {
			$map2 ['id'] = array (
					'in',
					$diff 
			);
			$dao->where ( $map2 )->delete ();
		}
	}
	function setSpecData($goods_id, $data) {
		// if (empty ( $data ['cost_price_arr'] ))
		// return false;
		$dao = M ( 'shop_goods_sku_data' );
		$save ['goods_id'] = $goods_id;
		$goodsDao = D ( 'Addons://Shop/Goods' );
		$list = $dao->where ( $save )->select ();
		foreach ( $list as $v ) {
			$arr [$v ['spec_option_ids']] = $v ['id'];
		}
		foreach ( $data ['market_price_arr'] as $n => $vo ) {
// 			$save ['cost_price'] = $vo;
			$save ['market_price'] = $vo;
			$save ['sale_price'] = $data ['sale_price_arr'] [$n];
			$save ['stock_num'] = $data ['stock_num_arr'] [$n];
			$save ['sn_code'] = $data ['sn_code_arr'] [$n];
			$nrr = explode ( '_', $n );
			sort ( $nrr, SORT_NUMERIC );
			$save ['spec_option_ids'] = $n = implode ( '_', $nrr );
			
			if (isset ( $arr [$n] )) {
				$ids [] = $map ['id'] = $arr [$n];
				$dao->where ( $map )->save ( $save );
			} else {
				$ids [] = $dao->add ( $save );
			}
			$goodsDao->getInfo ( $goods_id . ':' . $save ['spec_option_ids'], true );
		}
		$diff = array_diff ( $arr, $ids );
		
		if (empty ( $data ['market_price_arr'] )) {
			$diff = $arr;
		}
		
		if (! empty ( $diff )) {
			$map2 ['id'] = array (
					'in',
					$diff 
			);
			$dao->where ( $map2 )->delete ();
		}
	}
	function getConfigGoods() {
		$goodsId = I ( 'goods_id', 0, 'intval' );
		$info = D ( 'Addons://Shop/Goods' )->find ( $goodsId );
		$info ['img'] = get_cover_url ( $info ['cover'] );
		$this->ajaxReturn ( $info );
	}
	function goodsCommentLists() {
		$this->assign ( 'add_button', false );
		$this->assign ( 'del_button', false );
		$this->assign ( 'check_all', false );
		$search = $_REQUEST ['title'];
		if ($search) {
			$this->assign ( 'search', $search );
			
			$map1 ['nickname'] = array (
					'like',
					'%' . htmlspecialchars ( $search ) . '%' 
			);
			$truename_follow_ids = D ( 'Common/User' )->where ( $map1 )->getFields ( 'uid' );
			// $truename_follow_ids = implode ( ',', $truename_follow_ids );
			if (! empty ( $truename_follow_ids )) {
				$map ['uid'] = array (
						'in',
						$truename_follow_ids 
				);
			} else {
				$map ['id'] = 0;
			}
			
			unset ( $_REQUEST ['title'] );
		}
		
		$map ['goods_id'] = $goodsId = I ( 'goods_id', 0, 'intval' );
		$model = $this->getModel ( 'shop_goods_comment' );
		session ( 'common_condition', $map );
		$list_data = $this->_get_model_list ( $model, 0, 'id desc' );
		$this->assign ( $list_data );
		$this->assign ( 'search_url', addons_url ( 'Shop://Goods/goodsCommentLists', array (
				'mdm' => $_GET ['mdm'],
				'goods_id' => $goodsId 
		) ) );
		$this->assign ( 'placeholder', '请输入用户昵称' );
		$this->display ();
	}
	function changeShow() {
		$id = I ( 'id' );
		$show = I ( 'is_show', 0, 'intval' );
		$goodsId = I ( 'goods_id' );
		$save ['is_show'] = 1 - $show;
		$res = M ( 'shop_goods_comment' )->where ( array (
				'id' => $id 
		) )->save ( $save );
		if ($res) {
			D ( 'Addons://Shop/GoodsComment' )->getShopComment ( $goodsId, true );
			$this->success ( '设置成功！' );
		} else {
			$this->error ( '设置失败！' );
		}
	}
	//导入点卡编码
	function import() {
	    $model = $this->getModel ( 'import' );
	    $goodsid=I('get.goods_id',0,'intval');
	    if (IS_POST) {
	        $column = array (
	            'A' => 'code',
	            
	        );
	        $attach_id = I ( 'attach', 0 );
	        $res = importFormExcel ( $attach_id, $column );
	        if ($res ['status'] == 0) {
	            $retdata['msg']=$res ['data'];
	            $retdata['codes']='';
	            $retdata['num']=-1;
	            $this->ajaxReturn($retdata,'JSON');
	            exit();
	        }
	        $total = count ( $res ['data'] );
	        $strcode=null;
	        foreach ( $res ['data'] as $vo ) {
	            if (empty ( $vo ['code'] )) {
	               continue;
	            }
	            $strcode[]=$vo['code'];
	        }
	        $this->set_card_code($goodsid,$strcode,1);
// 	        $save['card_code']=$strcode;
// 	        D('Addons://Shop/Goods')->updateById($goodsid,$save);
	        $msg = "共导入" . $total . "条记录";
	        $smap['token']=get_token();
	        $smap['goods_id']=$goodsid;
	        $smap['is_use']=0;
	        $codes = M('shop_virtual')->where($smap)->getFields('card_codes');
	        $str_code='';
	        foreach ($codes as $cc){
	            $str_code.=$cc.chr(10);
	        }
	        
	        $retdata['msg']=$msg;
	        $retdata['codes']=$str_code;
	        $retdata['num']=count($codes);
	        $this->ajaxReturn($retdata,'JSON');
	        exit();
// 	        $this->success ( $msg, U ( 'edit' ).'&id='.$goodsid.'&mdm='.I('get.mdm') );
	    } else {
	        $fields = get_model_attribute ( $model ['id'] );
	        $this->assign ( 'fields', $fields );
	        	
	        $this->assign ( 'post_url', U ( 'import' ).'&goods_id='.$goodsid.'&mdm='.I('mdm')  );
	        $this->assign ( 'import_template', 'goods_card.xls' );
	        	
	        $this->display (  );
	    }
	}
	//设置点卡编码
	function set_card_code($id,$data,$is_import=0){
	    $map['token'] = get_token();
        $map['goods_id'] = $id;
	    $allData=M('shop_virtual')->where($map)->select();
	    foreach ($allData as $vo){
	        $old[$vo['card_codes']]=$vo['id'];
	    }
	    if ($is_import==0){
	        $codeArr = wp_explode($data, chr(10));
	    }else{
	        $codeArr=$data;
	    }
	    foreach ($codeArr as $ca){
	        $ca=trim($ca);
	        if ($ca){
	            $new[$ca]=$ca;
	        }
	    }
	    //删除
	    foreach ($new as $cc){
	        if ($cc && isset($old[$cc])){
	            $has[] = $old[$cc];//已添加的
                continue;
	        }else{
	            $doadd=null;
	            $doadd['goods_id']=$id;
	            $doadd['is_use']=0;
	            $doadd['token']=$map['token'];
	            $doadd['card_codes']=$cc;
	            $datas[]=$doadd;
	        }
	        
	    }
	    if ($is_import == 0){
	        $nmap['is_use']=0;
	        //删除掉不存在的
	        if (empty($new)){
	            $nmap['token']=$map['token'];
	            M('shop_virtual')->where($nmap)->delete();
	        }
	        if (!empty($has)){
	            $nmap['id']=array('not in',$has);
	            $nmap['token']=$map['token'];
	            M('shop_virtual')->where($nmap)->delete();
	        }
	    }
	    //新增数据
	    if(!empty($datas)){
	        M('shop_virtual')->addAll($datas);
	    }
	}
	function ajax_get_code(){
	    $map['goods_id']=$goodsId= I('goods_id',0,'intval');
	    $map['token']=get_token();
	    $map['is_use']=0;
	    $codes=M('shop_virtual')->where($map)->getFields('card_codes');
	    $strCodes='';
	    foreach ($codes as $cc){
	        $strCodes.=$cc.chr(10);
	    }
	    $data['str_code']=$strCodes;
	    $data['num']=count($codes);
	    $this->ajaxReturn($data,'JSON');
	}
}