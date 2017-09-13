<?php

namespace Common\Model;

use Think\Model;

/**
 * 接口操作
 */
class ServerModel extends Model {
	var $tableName = 'user';
	var $base_url = 'http://sxsoft.shengxunsoft.com/imember.asmx?wsdl';
	private function _WebService($action, $param = array()) {
		$header ['encoding'] = 'UTF-8';
		if (empty($param['secretID'])||empty($param['secretKey'])){
			$token=session ( 'token' );
			$sesID='erp_secretID_'.$token;
			$param['secretID']=session ( $sesID);
			$sesKey='erp_secretKey_'.$token;
			$param['secretKey']=session ( $sesKey);
// 		    $uid=session ( 'manager_id' );
// 		    $userInfo=get_userinfo($uid);
// 		    $param['secretID']=$userInfo['secretID'];
// 		    $param['secretKey']=$userInfo['secretKey'];
		}
		
// 		if ($action == 'getMemberMarksByOpenID'){
// 		    dump($param);die;
// 		}
// 		dump($param);
// 		$param ['secretID'] = 'ZNANZ'; // TODO 待确认是否为系统所有，还是每个微信用户都不同
// 		$param ['secretKey'] = 'server10.shengxunsoft.com';
		$soap = new \SoapClient ( $this->base_url, $header );
		$result = $soap->$action ( $param );
// 		print_r ( $result );
		
		// 把结果转成数组0
		$arr = $this->_object_to_array ( $result );
// 		dump ( $arr [$action . 'Result'] );
		
		$res = json_decode ( $arr [$action . 'Result'], true );
// 		dump ( $res );
		return $res;
	}
	// 将对象转换成数组
	private function _object_to_array($obj) {
		$_arr = is_object ( $obj ) ? get_object_vars ( $obj ) : $obj;
		foreach ( $_arr as $key => $val ) {
			$val = (is_array ( $val ) || is_object ( $val )) ? $this->_object_to_array ( $val ) : $val;
			$arr [$key] = $val;
		}
		return $arr;
	}
	// 使用OPENID添加会员积分, MarksType 为积分来源名称, 如签到积分, 开卡积分, 活动积分, 如空白则统一为微信积分
	function AddMemberMarksByOpenID($OpenID, $MarksType, $AddMarks, $Remark) {
		// TODO 待确认$MarksType, $AddMarks数据格式
		$param ['OpenID'] = $OpenID;
		$param ['MarksType'] = $MarksType; // 签到积分
		$param ['AddMarks'] = $AddMarks; // TODO
		$param ['Remark'] = $Remark; // 参与线上活动获得积分
		return $this->_WebService ( 'AddMemberMarksByOpenID', $param );
	} // 新增会员资料, 返回保存成功/保存失败; 并且会自动检查是否有重复OPENID, 重复则不能保存
	function InsertMemberInfo($OpenID, $data) {
		// TODO 待确认ShopCode, MemberID，CustType，Gender，Birthday，MarryDay的数据格式
		$param ['OpenID'] = $OpenID; //必填
		$param ['ShopCode'] = empty($data ['ShopCode'])?"":$data ['ShopCode']; // 898554
		$param ['MemberID'] = empty($data ['MemberID'])?"":$data ['MemberID']; // 100856
		$param ['Mobile'] =  empty($data ['Mobile'])?"":$data ['Mobile']; // 13510455105
		$param ['CustType'] =empty( $data ['CustType'])?"":$data ['CustType']; // 1 //会员级别名
		$param ['CustomerName'] = $data ['CustomerName']; // 韦小宝  必填
		$param ['Gender'] = empty($data ['Gender'])?"女":$data ['Gender']; // 男  女 必填
		$param ['Birthday'] = empty( $data ['Birthday'])?"": $data ['Birthday']; // 2015-10-15
		$param ['MarryDay'] =empty( $data ['MarryDay'])?"":$data ['MarryDay']; // 2015-09-15 结婚日期  可空白
		return $this->_WebService ( 'InsertMemberInfo', $param );
	}
	// 新增会员资料, 返回保存成功/保存失败; 并且会自动检查是否有重复OPENID, 重复则不能保存
	function InsertMemberInfoBySalesID() {
	}
	// 帐户认证, 返回认证成及或认证失败
	function LoginAuthentication($secretID,$secretKey) {
	    $param['secretID']=$secretID;
	    $param['secretKey']=$secretKey;
		return $this->_WebService ( 'LoginAuthentication',$param );
	}
	// 使用RegisteredMobile和userPassword 验证用户密码, 返回验证成功或是验证失败
	function ValidUserPassword() {
	}
	// 使用会员卡号检查OPENID,会员类型和会员编号和OPENID, 返回值状态 乎合的记录数 或 认证失败
	function checkMemberByMemberID() {
	}
	// 使用移动电话号码检查会员的会员卡号,会员类型和会员编号, 返回值状态 乎合的记录数 或 认证失败
	function checkMemberByMobile($Mobile) {
	    $param['Mobile']=$Mobile;
	    return $this->_WebService('checkMemberByMobile',$param);
	}
	// 使用OPENID检查会员卡号, 会员类型和会员编号和会员卡号, 返回值状态 乎合的记录数 或 认证失败
	function checkMemberByOpenID($OpenID) {
	    $param['OpenID']=$OpenID;
	    return $this->_WebService('checkMemberByOpenID',$param);
	}
	// 通过CouponName查询现金券生成方式
	function getCoupon($CouponName) {
		$param ['CouponName'] = $CouponName; // TODO 待确认该值的具体来源
		return $this->_WebService ( 'getCoupon', $param );
	}
	// 使用OPENID查询会员积分明细
	function getMarksUsageDetail($OpenID) {
		$param ['OpenID'] = $OpenID;
		return $this->_WebService ( 'getMarksUsageDetail', $param );
	}
	// 使用OPENID查询会员销售明细
	function getMemberBuyingHistory() {
	}
	// 使用OPENID查询会员资料
	function getMemberInfoByOpenID() {
	}
	// 使用OPENID查询会员积分
	function getMemberMarksByOpenID($OpenID) {
	    $param ['OpenID'] = $OpenID;
	    return $this->_WebService ( 'getMemberMarksByOpenID', $param );
	}
	// 使用RegisteredMobile 已登记的移动号码更新会员资料
	function updateMemberInfoByMobile() {
	}
	// 使用OPENID更新会员资料
	function updateMemberInfoByOpenID($OpenID, $data) {
	    // TODO 待确认ShopCode, MemberID，CustType，Gender，Birthday，MarryDay的数据格式
	    $param ['OpenID'] = $OpenID; //必填
	    $param ['MemberID'] = empty($data ['MemberID'])?"":$data['MemberID']; // 100856
	    $param ['Mobile'] = empty($data ['Mobile'])?"":$data['Mobile']; // 13510455105
	    $param ['CustType'] =empty( $data ['CustType'])?"":$data ['CustType']; // 1 //会员级别名
	    $param ['CustomerName'] = $data ['CustomerName']; // 韦小宝  必填
	    $param ['Gender'] = empty($data ['Gender'])?'女':$data ['Gender']; // 男  女 必填
	    $param ['Birthday'] = empty($data ['Birthday'])?"":$data['Birthday']; // 2015-10-15
	    $param ['MarryDay'] = empty($data ['MarryDay'])?"":$data['MarryDay']; // 2015-09-15 结婚日期  可空白
	    return $this->_WebService ( 'updateMemberInfoByOpenID', $param );
	}
	// 通过手机号同步OPENID
	function updateOpenIDByMobile($Mobile, $OpenID) {
		$param ['OpenID'] = $OpenID;
		$param ['Mobile'] = $Mobile;
		return $this->_WebService ( 'updateOpenIDByMobile', $param );
	}
	// 使用RegisteredMobile 已登记的移动号码更新会员资料
	function updateUserPasswordByMobile() {
	}
	
}
?>
