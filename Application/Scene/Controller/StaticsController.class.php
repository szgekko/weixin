<?php
namespace Scene\Controller;
use Think\Controller;
class StaticsController extends Controller {

    public function typelist(){
		header("Content-type: text/html; charset=utf-8"); 
		header('Content-type: text/json');
		header('HTTP/1.1 200 ok');
		
		 
		
		$jsonstr = '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":null,"list":[';
		$jsonstrtemp = ''; 
		$list=M('cate')->where("type='scene_type'")->order('sort asc,id asc')->select();
	 	
		foreach($list as $i=> $vo){
			$sort=$i+1;
			$jsonstrtemp = $jsonstrtemp .'{"id":'.$vo["id"].',"name":"'.$vo["title"].'","value":"'.$vo["value"].'","type":"'.$vo["type"].'","sort":'.$sort.',"status":1,"remark":null},';
		}
		$jsonstr = $jsonstr.rtrim($jsonstrtemp,',').']}';
		echo $jsonstr;  
		
		//echo '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":null,"list":[{"id":111,"name":"行业","value":"101","type":"scene_type","sort":1,"status":1,"remark":null},{"id":16634,"name":"企业","value":"103","type":"scene_type","sort":2,"status":1,"remark":null},{"id":16635,"name":"个人","value":"102","type":"scene_type","sort":3,"status":1,"remark":null},{"id":16636,"name":"节假","value":"104","type":"scene_type","sort":4,"status":1,"remark":null},{"id":16637,"name":"风格","value":"105","type":"scene_type","sort":5,"status":1,"remark":null}]}';
	}
	public function msgList(){
		//
		//echo '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":{"count":0,"pageNo":1,"pageSize":4},"list":null}';	
		
		//echo '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":{"count":2,"pageNo":1,"pageSize":4},"list":[{"id":15855188,"type":2,"bizType":1,"toUser":"00000000000000000000000000000000","toEmail":null,"fromUser":"4a2d8af948fd5bc40148fdbfc6640018","sendTime":1432875761000,"title":"产品更新","content":"新增点评、自动翻页等多项酷炫功能<a href=\'http://eqxiu.com/s/91gNZFjD\' target=\'_blank\'>查看</a>","status":1,"ext":null,"roleIdList":null},{"id":15839405,"type":2,"bizType":1,"toUser":"00000000000000000000000000000000","toEmail":null,"fromUser":"2422b6f4d1b646dcbf4fbe1d89da90fd","sendTime":1431669589000,"title":"产品重大更新","content":"新增触发等功能|10万秀点奖励:<a href=\'http://eqxiu.com/s/i5MTW4TR\' target=\'_blank\'>详情</a>","status":1,"ext":null,"roleIdList":null}]}';	
	}
	
	public function getExposeTypes(){
		echo '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":null,"list":[{"id":180,"name":"内容涉及违规","value":"1","type":"expose_types","sort":1,"status":1,"remark":null},{"id":181,"name":"诱导浏览者分享","value":"2","type":"expose_types","sort":2,"status":1,"remark":null},{"id":182,"name":"场景内容侵权","value":"3","type":"expose_types","sort":3,"status":1,"remark":null},{"id":183,"name":"内容夸大宣传","value":"4","type":"expose_types","sort":4,"status":1,"remark":null},{"id":184,"name":"违背易企秀用户协议","value":"5","type":"expose_types","sort":5,"status":1,"remark":null},{"id":185,"name":"其它原因","value":"6","type":"expose_types","sort":6,"status":1,"remark":null}]}';	
	}
	public function getPageTplType(){
		header('Content-type: text/json');
		header('HTTP/1.1 200 ok');
		echo '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":null,"list":[{"id":16630,"name":"版式","value":"1101","type":"tpl_page","sort":1,"status":1,"remark":null},{"id":16632,"name":"风格","value":"1103","type":"tpl_page","sort":2,"status":1,"remark":null},{"id":16631,"name":"互动","value":"1102","type":"tpl_page","sort":3,"status":1,"remark":null}]}';	
	}
    public function all(){
		header('Content-type: text/json');
		header('HTTP/1.1 200 ok');
		echo '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":[{"id":16633,"name":"行业","value":"101","type":"scene_type","sort":1,"status":1,"remark":null}],"list":null}';
	}
	
	
	public function getCate(){
		header('Content-type: text/json');
		header('HTTP/1.1 200 ok');
		$jsonstr = '{"success":true,"code":200,"msg":"操作成功","obj":null,"map":null,"list":[';
		$jsonstrtemp = '';
		
		if(I('get.filetype')){
			$type=intval(I('get.filetype',0));
			$type_js='musType';
		}else{
			$type=intval(I('get.type',0));
			$type_js=$type==1? 'tpType':'bgType';
		}
		
		$list=M('cate')->where("type='".$type_js."'")->select();
	 
		foreach($list as $i=> $vo){
			$sort=$i+1;
			$jsonstrtemp = $jsonstrtemp .'{"id":'.$vo["id"].',"name":"'.$vo["title"].'","value":'.$vo["value"].',"type":"'.$type_js.'","sort":'.$sort.',"status":1,"remark":null},';
		}
		$jsonstr = $jsonstr.rtrim($jsonstrtemp,',').']}';
		echo $jsonstr;  
	}
}