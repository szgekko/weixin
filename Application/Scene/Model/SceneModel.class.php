<?php
namespace Scene\Model;
use Think\Model;
class SceneModel extends Model {

    public function addscene() {
		checkAllow_nums();
		$m_scene=M('Scene');
		$m_scenepage=M('scenepage');
		$datas = $_POST;

		$datainfo['scenecode_varchar'] = 'U'.(date('y',time())-9).date('m',time()).randorderno(6,-1);
		$datainfo['scenename_varchar'] = $datas['name'];
		$datainfo['movietype_int'] = $datas['pageMode'];
		$datainfo['scenetype_int'] = intval($datas['type']);
		$datainfo['ip_varchar'] = get_client_ip();
		$datainfo['thumbnail_varchar'] = "default_thum.jpg";
		$datainfo['userid_int'] = get_mid();
		$datainfo['createtime_time'] = date('y-m-d H:i:s',time());
		$datainfo['is_public'] = 0;
		$result1 = $m_scene->add($datainfo);
		//var_dump($result1);exit;
		if($result1){
			$datainfo2['scenecode_varchar'] = $datainfo['scenecode_varchar'];
			$datainfo2['sceneid_bigint'] = $result1;
			$datainfo2['content_text'] = "[]";
			$datainfo2['properties_text'] = 'null';
			$datainfo2['userid_int'] = get_mid();
			$result2 = $m_scenepage->add($datainfo2);
			echo json_encode(array("success" => true,
									"code"=> 200,
									"msg" => "success",
									"obj"=> $result1,
									"map"=> null,
									"list"=> null
								   )
							);
		}else{
			exit;
		}
    }
  

    public function addscenebysys() {
		checkAllow_nums(); 
		
		$m_scene=M('Scene');
		$m_scenepage=M('scenepage');
		$datas = $_POST;
		

		//$wheresysscene['userid_int']  = 0;
		$wheresysscene['sceneid_bigint']  = I('post.id',0);  
		
		$_scene_sysinfo=$m_scene->where($wheresysscene)->select();
		if(C('IS_USER_ROLE_SCENE')){
			checkRole($_scene_sysinfo[0]['scenetype_int'] );
		}

		$datainfo['scenecode_varchar'] = 'U'.(date('y',time())-9).date('m',time()).date('d',time()).randorderno(6,-1);
		$datainfo['scenename_varchar'] = $datas['name'];
		$datainfo['movietype_int'] = $_scene_sysinfo[0]['movietype_int'];
		$datainfo['scenetype_int'] = intval($datas['type']);
		$datainfo['ip_varchar'] = get_client_ip();
		$datainfo['thumbnail_varchar'] = $_scene_sysinfo[0]['thumbnail_varchar'];
		$datainfo['musicurl_varchar'] = $_scene_sysinfo[0]['musicurl_varchar'];
		$datainfo['musictype_int'] = $_scene_sysinfo[0]['musictype_int'];
		$datainfo['fromsceneid_bigint'] = $wheresysscene['sceneid_bigint'];
		$datainfo['userid_int'] = get_mid();
		$datainfo['createtime_time'] = date('y-m-d H:i:s',time());
		
		$datainfo['shenhe'] =C('IS_USER_ANLI_SHENGHE')? 0:1 ;
		
		$datainfo['is_public'] = 0;
		$result1 = $m_scene->add($datainfo);
	 
		$m_scenedatasys=M('scenedatasys');
		$m_scenedata=M('scenedata');

		if($result1){
			$m_scene->where($wheresysscene)->setInc('usecount_int');
			
			//$wheresyspage['userid_int']  = 0;
			$wheresyspage['sceneid_bigint']  = I('post.id',0);
			$_scene_syspageinfo=$m_scenepage->where($wheresyspage)->select();
			foreach($_scene_syspageinfo as $vo){
				$datainfo2['scenecode_varchar'] = $datainfo['scenecode_varchar'];
				$datainfo2['sceneid_bigint'] = $result1;
				$datainfo2['content_text'] = $vo['content_text'];
				$datainfo2['properties_text'] = 'null';
				$datainfo2['pagecurrentnum_int'] = $vo['pagecurrentnum_int'];
				$datainfo2['userid_int'] = get_mid();
				$datainfo2['createtime_time'] = date('y-m-d H:i:s',time());
				$result2 = $m_scenepage->add($datainfo2);
				
				$wheredata['userid_int'] = get_mid();
				$wheredata['sceneid_bigint'] = $vo['sceneid_bigint'];
				$wheredata['pageid_bigint'] = $vo['pageid_bigint'];
				$_scenedatasys_list = $m_scenedatasys->where($wheredata)->select();

				foreach($_scenedatasys_list as $vo2){
					$dataList[] = array('sceneid_bigint'=>$result1,
						'pageid_bigint'=>$result2,
						'elementid_int'=>$vo2['elementid_int'],
						'elementtitle_varchar'=>$vo2['elementtitle_varchar'],
						'elementtype_int'=>$vo2['elementtype_int'],
						'userid_int'=>get_mid()
					);
				}
			}
			if(count($dataList)>0){
				$m_scenedata->addAll($dataList);
			}
			 echo json_encode(array("success" => true,
									"code"=> 200,
									"msg" => "success",
									"obj"=> $result1,
									"map"=> null,
									"list"=> null
								   )
							); 
							
			/*echo json_encode(array("success" => false,
				"code"=> 100,
				"msg" => "只允许创建7个",
				"obj"=> $result1,
				"map"=> null,
				"list"=> null
				)
					);*/
		}else{
			exit;
		}
    }


    public function addscenebycopy() {
		checkAllow_nums();
		$m_scene=M('Scene');
		$m_scenepage=M('scenepage');
		$m_scenedata=M('scenedata');
		

		$wheresysscene['userid_int']  = get_mid();
		$wheresysscene['sceneid_bigint']  = I('get.id',0);
		$_scene_sysinfo=$m_scene->where($wheresysscene)->select();


		$datainfo['scenecode_varchar'] = 'U'.(date('y',time())-9).date('m',time()).date('d',time()).randorderno(10,-1);
		$datainfo['scenename_varchar'] = '副本-'.$_scene_sysinfo[0]['scenename_varchar'];
		$datainfo['movietype_int'] = $_scene_sysinfo[0]['movietype_int'];
		$datainfo['scenetype_int'] = $_scene_sysinfo[0]['scenetype_int'];
		$datainfo['ip_varchar'] = get_client_ip();
		$datainfo['thumbnail_varchar'] = $_scene_sysinfo[0]['thumbnail_varchar'];
		$datainfo['musicurl_varchar'] = $_scene_sysinfo[0]['musicurl_varchar'];
		$datainfo['musictype_int'] = $_scene_sysinfo[0]['musictype_int'];
		$datainfo['fromsceneid_bigint'] = $wheresysscene['sceneid_bigint'];
		$datainfo['userid_int'] = get_mid();
		$datainfo['createtime_time'] = date('y-m-d H:i:s',time());
		$datainfo['is_public'] = 0;
		$result1 = $m_scene->add($datainfo);
		if($result1){
			$m_scene->where($wheresysscene)->setInc('usecount_int');
			
			//$wheresyspage['userid_int']  = get_mid();
			$wheresyspage['sceneid_bigint']  = I('get.id',0);
			$_scene_syspageinfo=$m_scenepage->where($wheresyspage)->select();
			foreach($_scene_syspageinfo as $vo){
				$datainfo2['scenecode_varchar'] = $datainfo['scenecode_varchar'];
				$datainfo2['sceneid_bigint'] = $result1;
				$datainfo2['content_text'] = $vo['content_text'];
				$datainfo2['properties_text'] = 'null';
				$datainfo2['pagecurrentnum_int'] = $vo['pagecurrentnum_int'];
				$datainfo2['userid_int'] = get_mid();
				$datainfo2['createtime_time'] = date('y-m-d H:i:s',time());
				$result2 = $m_scenepage->add($datainfo2);


				$wheredata['userid_int'] = get_mid();
				$wheredata['sceneid_bigint'] = $vo['sceneid_bigint'];
				$wheredata['pageid_bigint'] = $vo['pageid_bigint'];
				$_scenedatasys_list = $m_scenedata->where($wheredata)->select();

				foreach($_scenedatasys_list as $vo2){
					$dataList[] = array('sceneid_bigint'=>$result1,
						'pageid_bigint'=>$result2,
						'elementid_int'=>$vo2['elementid_int'],
						'elementtitle_varchar'=>$vo2['elementtitle_varchar'],
						'elementtype_int'=>$vo2['elementtype_int'],
						'userid_int'=>get_mid()
					);
				}

			}
			if(count($dataList)>0){
				$m_scenedata->addAll($dataList);
			}
			echo json_encode(array("success" => true,
									"code"=> 200,
									"msg" => "success",
									"obj"=> $result1,
									"map"=> null,
									"list"=> null
								   )
							);
		}else{
			exit;
		}
    }

    public function savepage() {
		$m_scene=M('scene');
		$m_scenepage=M('scenepage');
		$datas = json_decode(file_get_contents("php://input"),true);

		$where['pageid_bigint'] = $datas['id'];
		$where['sceneid_bigint'] = $datas['sceneId'];
		$datainfo['pagecurrentnum_int'] = intval($datas['num']);
		$datainfo['properties_text'] = json_encode($datas['properties']);
		$where['userid_int'] = get_mid();
		
		$wheredata['userid_int'] = get_mid();
		$wheredata['pageid_bigint'] = $where['pageid_bigint'];
		$wheredata['sceneid_bigint'] = $where['sceneid_bigint'];
		$m_scenedata=M('scenedata');
		$m_scenedata->where($wheredata)->delete();
		foreach ($datas['elements'] as $key => $val ) 
		{	
			$isinput=$val['type']==5 || $val['type']==501 || $val['type']==502 || $val['type']==503 || $val['isInput']==1;
			/*if(C('JS_VISION')=='3.4'){
				$isinput=$val['isInput'];
			}*/
			
			if( $isinput){  // 501姓名、502手机 、503邮箱、5 文本
				$dataList[] = array('sceneid_bigint'=>$where['sceneid_bigint'],
					'pageid_bigint'=>$where['pageid_bigint'],
					'elementid_int'=>$val['id'],
					'elementtitle_varchar'=>$val['title'],
					'elementtype_int'=>$val['type'],
					'userid_int'=>get_mid(),
					'other_info'=>isset($val['choices']) ? $val['choices']:''
					);
					
				//echo var_export($dataList,true);
				$datas['elements'][$key]['content']=strpos($val['content'],'eqs/link?id=')!==false ? str_replace('eqs/link?id=','index.php?s=/Scene/Scene/link&id=',$val['content']):	$val['content'];			
		 
			}else{
				if(C('IS_CTRL_LIUYUAN')){
					if($val['type']=="r"){
						$dataList[] = array('sceneid_bigint'=>$where['sceneid_bigint'],
							'pageid_bigint'=>$where['pageid_bigint'],
							'elementid_int'=>788,
							'elementtitle_varchar'=>'姓名',
							'elementtype_int'=>'501',
							'userid_int'=>get_mid()
							);
						$dataList[] = array('sceneid_bigint'=>$where['sceneid_bigint'],
							'pageid_bigint'=>$where['pageid_bigint'],
							'elementid_int'=>1111,
							'elementtitle_varchar'=>'手机',
							'elementtype_int'=>'502',
							'userid_int'=>get_mid()
							);
						$dataList[] = array('sceneid_bigint'=>$where['sceneid_bigint'],
							'pageid_bigint'=>$where['pageid_bigint'],
							'elementid_int'=>140,
							'elementtitle_varchar'=>'留言内容',
							'elementtype_int'=>'5',
							'userid_int'=>get_mid()
							);
					}
				}
			}
		}
		//\Think\Log::write("插入sceneData表 \n ".var_export($dataList,true)); 
		
		$datainfo['content_text'] = json_encode($datas['elements']);
		$m_scenepage->data($datainfo)->where($where)->save();

		if(count($dataList)>0){
			$aaaa = $m_scenedata->addAll($dataList);
 		}
		
		if(C('JS_VISION')>='3.4'){
			$str=str_replace('\\"','"',$datas['scene']['bgAudio']);	
			
			 
			$datas['scene']['bgAudio']=json_decode($str,true);
			
		 	
			$bgdatainfo['musicurl_varchar'] = $datas['scene']['bgAudio']['url']? $datas['scene']['bgAudio']['url']:'';			 
			$bgdatainfo['musictype_int'] = $datas['scene']['bgAudio']['type']? $datas['scene']['bgAudio']['type']:0;
			
		}else{

			if($datas['scene']['image']['bgAudio']['url']!="")
			{
				$bgdatainfo['musicurl_varchar'] = $datas['scene']['image']['bgAudio']['url'];
				//var_dump($bgdatainfo['musicurl_varchar']);exit;
				$bgdatainfo['musictype_int'] = $datas['scene']['image']['bgAudio']['type'];
			}else{
				$bgdatainfo['musicurl_varchar'] = '';
			}
		}
		$bgwhere['sceneid_bigint'] = $datas['sceneId'];
		$bgwhere['userid_int'] = get_mid();
		$bgdatainfo['is_tpl'] = $datas['scene']['isTpl']; 
		 
		
		$m_scene->data($bgdatainfo)->where($where)->save();
		
		\Think\Log::write("插入page表 \n ".var_export($bgdatainfo,true)); 
		
		//var_dump($m_scene);exit;
		echo json_encode(array("success" => true,
								"code"=> 200,
								"msg" => "success",
								"obj"=> $result1,
								"map"=> null,
								"list"=> null
							   )
						);
    }

    public function openscene($status) {
		$m_scene=M('Scene');
		$datas = json_decode(file_get_contents("php://input"),true);

		$where['sceneid_bigint'] = I('get.id',0);
		$datainfo['showstatus_int'] = $status;
		$where['userid_int'] = get_mid();
		$m_scene->data($datainfo)->where($where)->save();
		
		echo json_encode(array("success" => true,
								"code"=> 200,
								"msg" => "success",
								"obj"=> $result1,
								"map"=> null,
								"list"=> null
							   )
						);
    }


    public function usepage() {
		$m_scene=M('scenepagesys');
		$where['pageid_bigint'] = I('get.id',0);
		$m_scene->where($where)->setInc('usecount_int');
		
    }

    public function addpv() {
		$m_scene=M('Scene');
		$where['sceneid_bigint'] = I('get.id',0);
		$m_scene->where($where)->setInc('hitcount_int');
		if(C('SYS_LINK')){
		$m_scene->where($where)->setInc('vi_current_times');
		
		}
    }

    public function savesetting() {
		$m_scene=M('Scene');
		$datas = json_decode(file_get_contents("php://input"),true);
		 

		$hideEqAd=false;
		if(C('JS_VISION')>=3.4){ // "property": "{\"eqAdType\":0,\"hideEqAd\":true}"
			$datainfo['property'] = $datas['property'];
			
			if($datas['property']){
				$str=str_replace('\\"','"',$datas['property']);									
				$datas['property']=json_decode($str,true);				
				$hideEqAd=$datas['property']['hideEqAd']?true:false;
				
			}
		
			 
			
		}else{	
			$hideEqAd=$datas['image']['hideEqAd']?true:false;
			 
		}
		$where['sceneid_bigint'] = $datas['id'];
		//$datainfo=$hideEqAd?deal_xd($datainfo,$datas) :$datainfo;	
		//if($hideEqAd){
		$is_payxd=$m_scene->where($where)->getField('is_payxd');	
			   
		//	$datainfo=$is_payxd?deal_xd($datainfo,$datas) :$datainfo;	
		//}		
		
		if($hideEqAd){
			$qi_ad_xd=M('sys')->order('id asc')->getField('qi_ad_xds');			
			$qi_ad_xd=$qi_ad_xd?intval($qi_ad_xd):90;
			
			$xd=M('users')->where("userid_int=".get_mid())->getField('xd');	
			
			
			if($xd<$qi_ad_xd){
				//$datainfo['hideeqad'] = 0;
				//echo '{"success":false,"code":1010,"msg":"秀点不足","obj":null,"map":null,"list":null}';
				//die;	
			}else if($is_payxd==0){
				
				$update['xd'] =$xd-$qi_ad_xd;
				
				
				M('users')->where("userid_int=".get_mid())->save($update);
				
				$datainfo['hideeqad'] = 1;
				M('Scene')->where($where)->save(array('is_payxd'=>1));
			}
			
		}
		
		$datainfo['scenename_varchar'] = $datas['name'];
		$datainfo['scenetype_int'] = intval($datas['type']);
		$datainfo['movietype_int'] = intval($datas['pageMode']);
		$datainfo['thumbnail_varchar'] = $datas['cover'];//$datas['cover']? $datas['cover']:  $datas['image']['imgSrc'];
		$datainfo['desc_varchar'] = $datas['description'];
		$datainfo['eqcode'] =$datas['eqcode'];
		$datainfo['updateTime'] =time();
		
		$datainfo['lastpageid'] = $datas['image']['lastPageId'];
		
		$where['userid_int'] = get_mid();
		

		$m_scene->data($datainfo)->where($where)->save();
		
		 
		
		echo json_encode(array("success" => true,
								"code"=> 200,
								"msg" => $m_scene."success".$datainfo['scenename_varchar'],
								"obj"=> $result1,
								"map"=> null,
								"list"=> null
							   )
						);
    }


}

?>
