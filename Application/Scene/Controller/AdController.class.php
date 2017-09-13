<?php
/**
 * Date: 2015-4
 *  
 */
namespace Scene\Controller;
use Think\Controller;
class AdController extends Controller{
 
	public function friendlinks(){
		echo '{"success":true,"code":200,"msg":"操作成功","list":[{"name":"腾讯","url":"http://eqxiu.com/s/DRrVwR4r","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_KAdFjbAAASblUbW10076.png"},{"name":"阿里巴巴","url":"http://eqxiu.com/s/kqKZ00","logo":"http://res.eqxiu.com/group1/M00/7A/1E/yq0KA1UmX_KAHrbYAAAT8y97Ldk570.png"},{"name":"汉庭","url":"http://eqxiu.com/s/fFF0NP","logo":"http://res.eqxiu.com/group1/M00/7A/1E/yq0KA1UmX_KAXJiDAAAS9RAywx8380.png"},{"name":"智联招聘","url":"http://eqxiu.com/s/6LaROx","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_OAHgWaAAAdrgswaPE755.png"},{"name":"携程","url":"http://eqxiu.com/s/5opIzb","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_OAZppjAAAT1aeMT-E250.png"},{"name":"红星美凯龙","url":"http://eqxiu.com/s/zkbsc6","logo":"http://res.eqxiu.com/group1/M00/7A/2A/yq0KA1UmYL6AV6b1AAAV6E9y6y4819.png"},{"name":"壹基金","url":"http://eqxiu.com/s/IrUv4x","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_OACDX3AAAZ99M4pLc791.png"},{"name":"光明网","url":"http://eqxiu.com/s/xLCe6c","logo":"http://res.eqxiu.com/group1/M00/7A/1E/yq0KA1UmX_KAdCWCAAAWBKk0n0Q923.png"},{"name":"中国平安","url":"http://eqxiu.com/s/R9ykb6","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_OAMiJwAAAUJ2KE59c428.png"},{"name":"顺丰","url":"http://eqxiu.com/s/ZfE6erwq","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_KAah9EAAAZw2j_TDA008.png"},{"name":"华为","url":"http://eqxiu.com/s/Gx9GVn","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_KADPwQAAAPg667Oto017.png"},{"name":"网易","url":"http://eqxiu.com/s/s9W386","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_KAYKmtAAAV2AqvrTw033.png"},{"name":"爱奇艺","url":"http://eqxiu.com/s/lFSa2dFU","logo":"http://res.eqxiu.com/group1/M00/7A/2A/yq0KA1UmYL6ANG4KAAAWLvl2ZHo209.png"},{"name":"京东","url":"http://eqxiu.com/s/Z6iBtm","logo":"http://res.eqxiu.com/group1/M00/7A/1F/yq0KA1UmX_KAATvoAAAQ0FVZjjI032.png"},{"name":"三联生活周刊","url":"http://eqxiu.com/s/lWNKJP","logo":"http://res.eqxiu.com/group1/M';
	}
	 
	public function banner(){
		 echo 'assets/images/slide_03.png,assets/images/slide2_03.png,assets/images/slide3_03.png';
	}
	 
	 
	public function logo(){
		 echo 'assets/images/logo.png';
 		 
	}
	public function preview(){
		echo SITE_URL.'/Public/scene/css/images/previewbg_spring.jpg';	
	}
	
 
}