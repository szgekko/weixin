CREATE TABLE IF NOT EXISTS `wp_user` (
`come_from`  tinyint(1) NULL  DEFAULT 0 COMMENT '来源',
`nickname`  text NULL  COMMENT '用户名',
`password`  varchar(100) NULL  COMMENT '登录密码',
`truename`  varchar(30) NULL  COMMENT '真实姓名',
`mobile`  varchar(30) NULL  COMMENT '联系电话',
`email`  varchar(100) NULL  COMMENT '邮箱地址',
`sex`  tinyint(2) NULL  COMMENT '性别',
`headimgurl`  varchar(255) NULL  COMMENT '头像地址',
`city`  varchar(30) NULL  COMMENT '城市',
`province`  varchar(30) NULL  COMMENT '省份',
`country`  varchar(30) NULL  COMMENT '国家',
`language`  varchar(20) NULL  DEFAULT 'zh-cn' COMMENT '语言',
`score`  int(10) NULL  DEFAULT 0 COMMENT '金币值',
`experience`  int(10) NULL  DEFAULT 0 COMMENT '经验值',
`unionid`  varchar(50) NULL  COMMENT '微信第三方ID',
`login_count`  int(10) NULL  DEFAULT 0 COMMENT '登录次数',
`reg_ip`  varchar(30) NULL  COMMENT '注册IP',
`reg_time`  int(10) NULL  COMMENT '注册时间',
`last_login_ip`  varchar(30) NULL  COMMENT '最近登录IP',
`last_login_time`  int(10) NULL  COMMENT '最近登录时间',
`status`  tinyint(2) NULL  DEFAULT 1 COMMENT '状态',
`is_init`  tinyint(2) NULL  DEFAULT 0 COMMENT '初始化状态',
`is_audit`  tinyint(2) NULL  DEFAULT 0 COMMENT '审核状态',
`subscribe_time`  int(10) NULL  COMMENT '用户关注公众号时间',
`remark`  varchar(100) NULL  COMMENT '微信用户备注',
`groupid`  int(10) NULL  COMMENT '微信端的分组ID',
`login_name`  varchar(100) NULL  COMMENT '登录账号',
`login_password`  varchar(255) NULL  COMMENT '登录密码',
`manager_id`  int(10) NULL  DEFAULT 0 COMMENT '公众号管理员ID',
`level`  tinyint(2) NULL  DEFAULT 0 COMMENT '管理等级',
`membership`  char(50) NULL  DEFAULT 0 COMMENT '会员等级',

) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('user','用户信息表','0','','0','["come_from","nickname","password","truename","mobile","email","sex","headimgurl","city","province","country","language","score","experience","unionid","login_count","reg_ip","reg_time","last_login_ip","last_login_time","status","is_init","is_audit"]','1:基础','','','','','headimgurl|url_img_html:头像\r\nlogin_name:登录账号\r\nlogin_password:登录密码\r\nnickname|deal_emoji:用户昵称\r\nsex|get_name_by_status:性别\r\ngroup:分组\r\nscore:金币值\r\nexperience:经历值\r\nids:操作:set_login?uid=[uid]|设置登录账号,detail?uid=[uid]|详细资料,[EDIT]|编辑','20','','','1436929111','1441187405','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('come_from','来源','tinyint(1) NULL','select','0','','0','0:PC注册用户\r\n1:微信同步用户\r\n2:手机注册用户','0','0','1','1438331477','1438331357','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('nickname','用户名','text NULL','string','','','0','','0','1','1','1440498987','1436929161','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('password','登录密码','varchar(100) NULL','string','','','0','','0','0','1','1436929210','1436929210','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('truename','真实姓名','varchar(30) NULL','string','','','0','','0','0','1','1436929252','1436929252','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mobile','联系电话','varchar(30) NULL','string','','','0','','0','0','1','1436929280','1436929280','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('email','邮箱地址','varchar(100) NULL','string','','','0','','0','0','1','1436929305','1436929305','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sex','性别','tinyint(2) NULL','radio','','','0','0:保密\r\n1:男\r\n2:女','0','0','1','1436929397','1436929397','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('headimgurl','头像地址','varchar(255) NULL','string','','','0','','0','0','1','1436929482','1436929482','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('city','城市','varchar(30) NULL','string','','','0','','0','0','1','1436929506','1436929506','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('province','省份','varchar(30) NULL','string','','','0','','0','0','1','1436929524','1436929524','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('country','国家','varchar(30) NULL','string','','','0','','0','0','1','1436929541','1436929541','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('language','语言','varchar(20) NULL','string','zh-cn','','0','','0','0','1','1436929571','1436929571','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','金币值','int(10) NULL','num','0','','0','','0','0','1','1436929631','1436929597','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('experience','经验值','int(10) NULL','num','0','','0','','0','0','1','1436929619','1436929619','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('unionid','微信第三方ID','varchar(50) NULL','string','','','0','','0','0','1','1436929681','1436929681','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('login_count','登录次数','int(10) NULL','num','0','','0','','0','0','1','1436930011','1436930011','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reg_ip','注册IP','varchar(30) NULL','string','','','0','','0','0','1','1436930035','1436930035','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reg_time','注册时间','int(10) NULL','datetime','','','0','','0','0','1','1436930051','1436930051','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('last_login_ip','最近登录IP','varchar(30) NULL','string','','','0','','0','0','1','1436930072','1436930072','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('last_login_time','最近登录时间','int(10) NULL','datetime','','','0','','0','0','1','1441188034','1436930087','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','tinyint(2) NULL','bool','1','','0','0:禁用\r\n1:启用','0','0','1','1441188025','1436930138','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_init','初始化状态','tinyint(2) NULL','bool','0','','0','0:未初始化\r\n1:已初始化','0','0','1','1441188016','1436930184','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_audit','审核状态','tinyint(2) NULL','bool','0','','0','0:未审核\r\n1:已审核','0','0','1','1441188004','1436930216','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('subscribe_time','用户关注公众号时间','int(10) NULL','datetime','','','0','','0','0','1','1437720655','1437720655','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','微信用户备注','varchar(100) NULL','string','','','0','','0','0','1','1437720686','1437720686','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('groupid','微信端的分组ID','int(10) NULL','num','','','0','','0','0','1','1437720714','1437720714','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('login_name','登录账号','varchar(100) NULL','string','','','1','','0','0','1','1441187922','1439978705','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('login_password','登录密码','varchar(255) NULL','string','','','1','','0','0','1','1441187439','1441187439','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','公众号管理员ID','int(10) NULL','num','0','','0','','0','0','1','1441512815','1441512815','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('level','管理等级','tinyint(2) NULL','num','0','','0','','0','0','1','1441522953','1441522953','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('membership','会员等级','char(50) NULL','select','0','请在会员等级 添加会员级别名称','1','','0','0','1','1442806543','1441795509','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_manager` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户ID',
`has_public`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否配置公众号',
`headface_url`  int(10) UNSIGNED NULL  COMMENT '管理员头像',
`GammaAppId`  varchar(30) NULL  COMMENT '摇电视的AppId',
`GammaSecret`  varchar(100) NULL  COMMENT '摇电视的Secret',
`copy_right`  varchar(255) NULL  COMMENT '授权信息',
`tongji_code`  text NULL  COMMENT '统计代码',
`website_logo`  int(10) UNSIGNED NULL  COMMENT '网站LOGO',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('manager','公众号管理员配置','0','','1','','1:基础','','','','','','20','','','1436932532','1436942362','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','1','','0','1','1','1436932588','1436932588','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('has_public','是否配置公众号','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1436933464','1436933464','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('headface_url','管理员头像','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1436933503','1436933503','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('GammaAppId','摇电视的AppId','varchar(30) NULL','string','','','1','','0','0','1','1436933562','1436933562','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('GammaSecret','摇电视的Secret','varchar(100) NULL','string','','','1','','0','0','1','1436933602','1436933602','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('copy_right','授权信息','varchar(255) NULL','string','','','1','','0','0','1','1436933690','1436933690','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tongji_code','统计代码','text NULL','textarea','','','1','','0','0','1','1436933778','1436933778','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('website_logo','网站LOGO','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1436934006','1436934006','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_manager_menu` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`menu_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '菜单类型',
`pid`  varchar(50) NULL  DEFAULT 0 COMMENT '上级菜单',
`title`  varchar(50) NULL  COMMENT '菜单名',
`url_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '链接类型',
`addon_name`  varchar(30) NULL  COMMENT '插件名',
`url`  varchar(255) NULL  COMMENT '外链',
`target`  char(50) NULL  DEFAULT '_self' COMMENT '打开方式',
`is_hide`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否隐藏',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序号',
`uid`  int(10) NULL  COMMENT '管理员ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('manager_menu','公众号管理员菜单','0','','1','["menu_type","pid","title","url_type","addon_name","url","target","is_hide","sort"]','1:基础','','','','','title:菜单名\r\nmenu_type|get_name_by_status:菜单类型\r\naddon_name:插件名\r\nurl:外链\r\ntarget|get_name_by_status:打开方式\r\nis_hide|get_name_by_status:隐藏\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','','','1435215960','1437623073','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('menu_type','菜单类型','tinyint(2) NULL','bool','0','','1','0:顶级菜单|pid@hide\r\n1:侧栏菜单|pid@show','0','0','1','1435218508','1435216049','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','上级菜单','varchar(50) NULL','cascade','0','','1','type=db&table=manager_menu&menu_type=0&uid=[manager_id]','0','0','1','1438858450','1435216147','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','菜单名','varchar(50) NULL','string','','','1','','0','1','1','1435216185','1435216185','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url_type','链接类型','tinyint(2) NULL','bool','0','','1','0:插件|addon_name@show,url@hide\r\n1:外链|addon_name@hide,url@show','0','0','1','1435218596','1435216291','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_name','插件名','varchar(30) NULL','dynamic_select','','','1','table=addons&type=0&value_field=name&title_field=title&order=id asc','0','0','1','1439433250','1435216373','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','外链','varchar(255) NULL','string','','','1','','0','0','1','1435216436','1435216436','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('target','打开方式','char(50) NULL','select','_self','','1','_self:当前窗口打开\r\n_blank:在新窗口打开','0','0','1','1435216626','1435216626','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_hide','是否隐藏','tinyint(2) NULL','radio','0','','1','0:否\r\n1:是','0','0','1','1435216697','1435216697','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL','num','0','值越小越靠前','1','','0','0','1','1435217270','1435217270','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','管理员ID','int(10) NULL','num','','','4','','0','0','1','1435224916','1435223957','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_keyword` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL   COMMENT '关键词',
`addon`  varchar(255) NOT NULL  COMMENT '关键词所属插件',
`aim_id`  int(10) unsigned NOT NULL   COMMENT '插件表里的ID值',
`cTime`  int(10) NULL  COMMENT '创建时间',
`token`  varchar(100) NULL   COMMENT 'Token',
`keyword_length`  int(10) unsigned NULL   DEFAULT 0 COMMENT '关键词长度',
`keyword_type`  tinyint(2) NULL   DEFAULT 0 COMMENT '匹配类型',
`extra_text`  text NULL   COMMENT '文本扩展',
`extra_int`  int(10) NULL   COMMENT '数字扩展',
`request_count`  int(10) NULL  DEFAULT 0 COMMENT '请求数',
PRIMARY KEY (`id`),
KEY `keyword_token` (`keyword`,token)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('keyword','关键词表','0','','1','["keyword","keyword_type","addon","aim_id","keyword_length","cTime","extra_text","extra_int"]','1:基础','','','','','id:编号\r\nkeyword:关键词\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','keyword','','1388815871','1407251192','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL ','string','','','1','','0','1','1','1388815953','1388815953','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon','关键词所属插件','varchar(255) NOT NULL','string','','','1','','0','1','1','1388816207','1388816207','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','插件表里的ID值','int(10) unsigned NOT NULL ','num','','','1','','0','1','1','1388816287','1388816287','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1407251221','1388816392','','1','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL ','string','','','0','','0','0','1','1408945788','1391399528','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_length','关键词长度','int(10) unsigned NULL ','num','0','','1','','0','0','1','1407251147','1393918566','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','匹配类型','tinyint(2) NULL ','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','0','1','1417745067','1393919686','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_text','文本扩展','text NULL ','textarea','','','0','','0','0','1','1407251248','1393919736','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int','数字扩展','int(10) NULL ','num','','','0','','0','0','1','1407251240','1393919798','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('request_count','请求数','int(10) NULL','num','0','用户回复的次数','0','','0','0','1','1401938983','1401938983','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_qr_code` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`qr_code`  varchar(255) NOT NULL  COMMENT '二维码',
`addon`  varchar(255) NOT NULL  COMMENT '二维码所属插件',
`aim_id`  int(10) unsigned NOT NULL   COMMENT '插件表里的ID值',
`cTime`  int(10) NULL  COMMENT '创建时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`action_name`  char(30) NULL  DEFAULT 'QR_SCENE' COMMENT '二维码类型',
`extra_text`  text NULL   COMMENT '文本扩展',
`extra_int`  int(10) NULL   COMMENT '数字扩展',
`request_count`  int(10) NULL  DEFAULT 0 COMMENT '请求数',
`scene_id`  int(10) NULL  DEFAULT 0 COMMENT '场景ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('qr_code','二维码表','0','','1','["qr_code","addon","aim_id","cTime","extra_text","extra_int","scene_id","action_name"]','1:基础','','','','','scene_id:事件KEY值\r\nqr_code|get_code_img:二维码\r\naction_name|get_name_by_status: 	二维码类型\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','qr_code','','1388815871','1406130247','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('qr_code','二维码','varchar(255) NOT NULL','string','','','1','','0','1','1','1406127577','1388815953','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon','二维码所属插件','varchar(255) NOT NULL','string','','','1','','0','1','1','1406127594','1388816207','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','插件表里的ID值','int(10) unsigned NOT NULL ','num','','','1','','0','1','1','1388816287','1388816287','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','1','','0','0','1','1388816392','1388816392','','1','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1391399528','1391399528','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('action_name','二维码类型','char(30) NULL','select','QR_SCENE','QR_SCENE为临时,QR_LIMIT_SCENE为永久 ','1','QR_SCENE:临时二维码\r\nQR_LIMIT_SCENE:永久二维码','0','0','1','1406130162','1393919686','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_text','文本扩展','text NULL ','textarea','','','1','','0','0','1','1393919736','1393919736','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int','数字扩展','int(10) NULL ','num','','','1','','0','0','1','1393919798','1393919798','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('request_count','请求数','int(10) NULL','num','0','用户回复的次数','0','','0','0','1','1402547625','1401938983','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('scene_id','场景ID','int(10) NULL','num','0','','1','','0','0','1','1406127542','1406127542','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_public` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`is_use`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否为当前公众号',
`token`  varchar(100) NULL  COMMENT 'Token',
`uid`  int(10) NULL   COMMENT '用户ID',
`public_name`  varchar(50) NOT NULL  COMMENT '公众号名称',
`public_id`  varchar(100) NOT NULL  COMMENT '公众号原始id',
`wechat`  varchar(100) NOT NULL  COMMENT '微信号',
`interface_url`  varchar(255) NULL  COMMENT '接口地址',
`headface_url`  varchar(255) NULL  COMMENT '公众号头像',
`area`  varchar(50) NULL  COMMENT '地区',
`addon_config`  text NULL  COMMENT '插件配置',
`addon_status`  text NULL  COMMENT '插件状态',
`type`  char(10) NULL  DEFAULT 0 COMMENT '公众号类型',
`appid`  varchar(255) NULL  COMMENT 'AppID',
`secret`  varchar(255) NULL  COMMENT 'AppSecret',
`group_id`  int(10) unsigned NULL   DEFAULT 0 COMMENT '等级',
`is_audit`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否审核',
`is_init`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否初始化',
`encodingaeskey`  varchar(255) NULL  COMMENT 'EncodingAESKey',
`tips_url`  varchar(255) NULL  COMMENT '提示关注公众号的文章地址',
`GammaAppId`  varchar(255) NULL  COMMENT 'GammaAppId',
`GammaSecret`  varchar(255) NULL  COMMENT 'GammaSecret',
`public_copy_right`  varchar(255) NULL  COMMENT '版权信息',
`domain`  varchar(30) NULL  COMMENT '自定义域名',
`is_bind`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否为微信开放平台绑定账号',
PRIMARY KEY (`id`),
KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('public','公众号管理','0','','1','["public_name","public_id","wechat","headface_url","type","appid","secret"]','1:基础','','','','','id:公众号ID\r\npublic_name:公众号名称\r\ngroup_id|get_public_group_name:等级\r\nheadface_url:公众号头像\r\ntoken:Token\r\nuid:管理员\r\nis_use|get_name_by_status:当前公众号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,changPublic&id=[id]|切换为当前公众号','20','public_name','','1391575109','1418960233','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','是否为当前公众号','tinyint(2) NULL','bool','0','','0','0:否\r\n1:是','0','0','1','1391682184','1391682184','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1402453598','1391597344','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL ','num','','','0','','0','1','1','1391575873','1391575210','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('public_name','公众号名称','varchar(50) NOT NULL','string','','','1','','0','1','1','1391576452','1391575955','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('public_id','公众号原始id','varchar(100) NOT NULL','string','','请正确填写，保存后不能再修改，且无法接收到微信的信息','1','','0','1','1','1402453976','1391576015','','1','公众号原始ID已经存在，请不要重复增加','unique','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat','微信号','varchar(100) NOT NULL','string','','','1','','0','1','1','1391576484','1391576144','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('interface_url','接口地址','varchar(255) NULL','string','','','0','','0','0','1','1392946881','1391576234','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('headface_url','公众号头像','varchar(255) NULL','picture','','','1','','0','0','1','1429847363','1391576300','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('area','地区','varchar(50) NULL','string','','','0','','0','0','1','1392946934','1391576435','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_config','插件配置','text NULL','textarea','','','0','','0','0','1','1391576537','1391576537','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_status','插件状态','text NULL','textarea','','','0','111:帐号配置\r\n83:你问我答客服系统\r\n93:互动游戏\r\n18:欢迎语\r\n19:微信用户中心\r\n56:自定义菜单\r\n101:微信卡券\r\n117:一键绑定公众号\r\n39:微官网\r\n42:微信宣传页\r\n48:自定义回复\r\n50:微调研\r\n139:促销活动\r\n91:微邀约\r\n97:微抢答\r\n100:通用表单\r\n106:微信红包\r\n107:竞猜\r\n108:微贺卡\r\n110:实物奖励\r\n124:预约挂号\r\n126:开发者工具箱\r\n128:微名片\r\n130:自动回复\r\n133:支付通\r\n134:投票\r\n135:自媒体中心\r\n138:现金优惠券\r\n137:评论互动\r\n140:没回答的回复\r\n141:工作授权\r\n142:优惠券\r\n143:帮拆礼包\r\n144:会员卡\r\n145:签到\r\n146:微预约\r\n147:天下无拐\r\n150:融合第三方\r\n149:秒杀\r\n151:短信服务\r\n152:微现场\r\n118:商城\r\n','0','0','1','1391576571','1391576571','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','公众号类型','char(10) NULL','radio','0','','1','0:普通订阅号\r\n1:认证订阅号/普通服务号\r\n2:认证服务号','0','0','1','1416904702','1393718575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('appid','AppID','varchar(255) NULL','string','','应用ID','1','','0','0','1','1416904750','1393718735','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('secret','AppSecret','varchar(255) NULL','string','','应用密钥','1','','0','0','1','1416904771','1393718806','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_id','等级','int(10) unsigned NULL ','select','0','','0','','0','0','1','1393753499','1393724468','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_audit','是否审核','tinyint(2) NULL','bool','0','','0','0:否\r\n1:是','0','1','1','1430879018','1430879007','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_init','是否初始化','tinyint(2) NULL','bool','0','','0','0:否\r\n1:是','0','1','1','1430888244','1430878899','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('encodingaeskey','EncodingAESKey','varchar(255) NULL','string','','安全模式下必填','1','','0','0','1','1419775850','1419775850','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tips_url','提示关注公众号的文章地址','varchar(255) NULL','string','','','1','','0','0','1','1420789769','1420789769','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('GammaAppId','GammaAppId','varchar(255) NULL','string','','','1','','0','0','1','1424529968','1424529968','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('GammaSecret','GammaSecret','varchar(255) NULL','string','','','1','','0','0','1','1424529990','1424529990','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('public_copy_right','版权信息','varchar(255) NULL','string','','','1','','0','0','1','1431141576','1431141576','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('domain','自定义域名','varchar(30) NULL','string','','','0','','0','0','1','1439698931','1439698931','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_bind','是否为微信开放平台绑定账号','tinyint(2) NULL','bool','0','','0','0:否\r\n1:是','0','0','1','1440746890','1440746890','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_public_group` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(50) NULL  COMMENT '等级名',
`addon_status`  text NULL  COMMENT '插件权限',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('public_group','公众号等级','0','','1','["title","addon_status"]','1:基础','','','','','id:等级ID\r\ntitle:等级名\r\naddon_status:授权的插件\r\npublic_count:公众号数\r\nids:操作:editPublicGroup&id=[id]|编辑,delPublicGroup&id=[id]|删除','20','title','','1393724788','1393730663','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','等级名','varchar(50) NULL','string','','','1','','0','0','1','1393724854','1393724854','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_status','插件权限','text NULL','checkbox','','','1','111:帐号配置\r\n83:你问我答客服系统\r\n93:互动游戏\r\n18:欢迎语\r\n19:微信用户中心\r\n56:自定义菜单\r\n101:微信卡券\r\n117:一键绑定公众号\r\n39:微官网\r\n42:微信宣传页\r\n48:自定义回复\r\n50:微调研\r\n139:促销活动\r\n91:微邀约\r\n97:微抢答\r\n100:通用表单\r\n106:微信红包\r\n107:竞猜\r\n108:微贺卡\r\n110:实物奖励\r\n124:预约挂号\r\n126:开发者工具箱\r\n128:微名片\r\n130:自动回复\r\n133:支付通\r\n134:投票\r\n135:自媒体中心\r\n138:现金优惠券\r\n137:评论互动\r\n140:没回答的回复\r\n141:工作授权\r\n142:优惠券\r\n143:帮拆礼包\r\n144:会员卡\r\n145:签到\r\n146:微预约\r\n147:天下无拐\r\n150:融合第三方\r\n149:秒杀\r\n151:短信服务\r\n152:微现场\r\n118:商城\r\n','0','0','1','1393731903','1393725072','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_public_link` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL   COMMENT '管理员UID',
`mp_id`  int(10) unsigned NOT NULL   COMMENT '公众号ID',
`is_creator`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否为创建者',
`addon_status`  text NULL  COMMENT '插件权限',
`is_use`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否为当前管理的公众号',
PRIMARY KEY (`id`),
UNIQUE KEY `um` (`uid`,mp_id)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('public_link','公众号与管理员的关联关系','0','','1','["uid","addon_status"]','1:基础','','','','','uid|get_nickname|deal_emoji:管理员\r\naddon_status:授权的插件\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','','','1398933192','1398947067','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','管理员UID','int(10) NULL ','num','','可以在用户>用户信息页面的列表第一找到管理员的UID','1','','0','1','1','1398944756','1398933236','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mp_id','公众号ID','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1398933300','1398933300','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_creator','是否为创建者','tinyint(2) NULL','bool','0','','0','0:不是\r\n1:是','0','0','1','1398933380','1398933380','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_status','插件权限','text NULL','checkbox','','','1','111:帐号配置\r\n83:你问我答客服系统\r\n93:互动游戏\r\n18:欢迎语\r\n19:微信用户中心\r\n56:自定义菜单\r\n101:微信卡券\r\n117:一键绑定公众号\r\n39:微官网\r\n42:微信宣传页\r\n48:自定义回复\r\n50:微调研\r\n139:促销活动\r\n91:微邀约\r\n97:微抢答\r\n100:通用表单\r\n106:微信红包\r\n107:竞猜\r\n108:微贺卡\r\n110:实物奖励\r\n124:预约挂号\r\n126:开发者工具箱\r\n128:微名片\r\n130:自动回复\r\n133:支付通\r\n134:投票\r\n135:自媒体中心\r\n138:现金优惠券\r\n137:评论互动\r\n140:没回答的回复\r\n141:工作授权\r\n142:优惠券\r\n143:帮拆礼包\r\n144:会员卡\r\n145:签到\r\n146:微预约\r\n147:天下无拐\r\n150:融合第三方\r\n149:秒杀\r\n151:短信服务\r\n152:微现场\r\n118:商城\r\n','0','0','1','1398933475','1398933475','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','是否为当前管理的公众号','tinyint(2) NULL','bool','0','','0','0:不是\r\n1:是','0','0','1','1398996982','1398996975','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_import` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`attach`  int(10) unsigned NOT NULL   COMMENT '上传文件',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('import','导入数据','0','','1','','1:基础','','','','','','20','','','1407554076','1407554076','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attach','上传文件','int(10) unsigned NOT NULL ','file','','支持xls,xlsx两种格式','1','','0','1','1','1407554177','1407554177','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_addon_category` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`icon`  int(10) unsigned NULL   COMMENT '分类图标',
`title`  varchar(255) NULL  COMMENT '分类名',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('addon_category','插件分类','0','','1','["icon","title","sort"]','1:基础','','','','','icon|get_img_html:分类图标\r\ntitle:分类名\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1400047655','1437451028','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon','分类图标','int(10) unsigned NULL ','picture','','','1','','0','0','1','1400047745','1400047745','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','分类名','varchar(255) NULL','string','','','1','','0','0','1','1400047764','1400047764','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL','num','0','值越小越靠前','1','','0','0','1','1400050453','1400047786','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_auto_reply` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(255) NULL  COMMENT '关键词',
`msg_type`  char(50) NULL  DEFAULT 'text' COMMENT '消息类型',
`content`  text NULL  COMMENT '文本内容',
`group_id`  int(10) NULL  COMMENT '图文',
`image_id`  int(10) UNSIGNED NULL  COMMENT '上传图片',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(50) NULL  COMMENT 'Token',
`image_material`  int(10) NULL  COMMENT '素材图片id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('auto_reply','自动回复','0','','1','["keyword","content","group_id","image_id"]','1:基础','','','','','keyword:关键词\r\ncontent:文件内容\r\ngroup_id:图文\r\nimage_id:图片\r\nids:操作:[EDIT]&type=[msg_type]|编辑,[DELETE]|删除','10','keyword:请输入关键词','','1439194522','1439258843','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(255) NULL','string','','多个关键词可以用空格分开，如“高富帅 白富美”','1','','0','1','1','1439194858','1439194849','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msg_type','消息类型','char(50) NULL','select','text','','0','text:文本|content@show,group_id@hide,image_id@hide\r\nnews:图文|content@hide,group_id@show,image_id@hide\r\nimage:图片|content@hide,group_id@hide,image_id@show','0','1','1','1439204529','1439194979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','文本内容','text NULL','textarea','','','1','','0','0','1','1439195826','1439195091','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_id','图文','int(10) NULL','news','','','1','','0','0','1','1439204192','1439195901','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('image_id','上传图片','int(10) UNSIGNED NULL','picture','','图片大小不超过1M','1','','0','0','1','1447041380','1439195945','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1439203621','1439203575','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','0','1','1439203612','1439203612','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('image_material','素材图片id','int(10) NULL','num','','','0','','0','0','1','1447900425','1447900425','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_common_category` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`name`  varchar(255) NULL  COMMENT '分类标识',
`title`  varchar(255) NOT NULL  COMMENT '分类标题',
`icon`  int(10) unsigned NULL   COMMENT '分类图标',
`pid`  int(10) unsigned NULL   DEFAULT 0 COMMENT '上一级分类',
`path`  varchar(255) NULL  COMMENT '分类路径',
`module`  varchar(255) NULL  COMMENT '分类所属功能',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否显示',
`intro`  varchar(255) NULL  COMMENT '分类描述',
`token`  varchar(255) NULL  COMMENT 'Token',
`code`  varchar(255) NULL  COMMENT '分类扩展编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('common_category','通用分类','0','','1','["pid","title","icon","intro","sort","is_show"]','1:基础','','','','','code:编号\r\ntitle:标题\r\nicon|get_img_html:图标\r\nsort:排序号\r\nis_show|get_name_by_status:显示\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1397529095','1404182789','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','分类标识','varchar(255) NULL','string','','只能使用英文','0','','0','0','1','1403711345','1397529355','','3','只能输入由数字、26个英文字母或者下划线组成的标识名','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','分类标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1397529407','1397529407','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon','分类图标','int(10) unsigned NULL ','picture','','','1','','0','0','1','1397529461','1397529461','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','上一级分类','int(10) unsigned NULL ','select','0','如果你要增加一级分类，这里选择“无”即可','1','0:无','0','0','1','1398266132','1397529555','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('path','分类路径','varchar(255) NULL','string','','','0','','0','0','1','1397529604','1397529604','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('module','分类所属功能','varchar(255) NULL','string','','','0','','0','0','1','1397529671','1397529671','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','数值越小越靠前','1','','0','0','1','1397529705','1397529705','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','tinyint(2) NULL','bool','1','','1','0:不显示\r\n1:显示','0','0','1','1397532496','1397529809','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','分类描述','varchar(255) NULL','string','','','1','','0','0','1','1398414247','1398414247','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1398593086','1398523502','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('code','分类扩展编号','varchar(255) NULL','string','','原分类或者导入分类的扩展编号','0','','0','0','1','1404182741','1404182630','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_common_category_group` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cTime`  int(10) UNSIGNED NULL  COMMENT '发布时间',
`name`  varchar(100) NOT NULL  COMMENT '分组标识',
`title`  varchar(255) NOT NULL  COMMENT '分组标题',
`level`  tinyint(1) unsigned NULL  DEFAULT 3 COMMENT '最多级数',
`token`  varchar(100) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('common_category_group','通用分类分组','0','','1','["name","title"]','1:基础','','','','','name:分组标识\r\ntitle:分组标题\r\nids:操作:cascade?target=_blank&module=[name]|数据管理,[EDIT]|编辑,[DELETE]|删除','20','title','','1396061373','1403664378','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) UNSIGNED NULL','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','分组标识','varchar(100) NOT NULL','string','','英文字母或者下划线，长度不超过30','1','','0','1','1','1403624543','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','分组标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1403624556','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('level','最多级数','tinyint(1) unsigned NULL','select','3','','1','1:1级\r\n2:2级\r\n3:3级\r\n4:4级\r\n5:5级\r\n6:6级\r\n7:7级','0','0','1','1404193097','1404192897','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','1','1','1408947244','1396602859','','3','','regex','get_token','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_credit_config` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '积分描述',
`name`  varchar(50) NULL  COMMENT '积分标识',
`mTime`  int(10) NULL  COMMENT '修改时间',
`experience`  varchar(30) NULL  DEFAULT 0 COMMENT '经验值',
`score`  varchar(30) NULL  DEFAULT 0 COMMENT '金币值',
`token`  varchar(255) NULL  DEFAULT 0 COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('credit_config','积分配置','0','','1','["name","title","score","experience"]','1:基础','','','','','title:积分描述\r\nname:积分标识\r\nexperience:经验值\r\nscore:金币值\r\nids:操作:[EDIT]|配置','20','title','','1396061373','1438591151','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','积分描述','varchar(255) NOT NULL','string','','','1','','0','1','1','1438589622','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','积分标识','varchar(50) NULL','string','','','1','','0','0','1','1438589601','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('experience','经验值','varchar(30) NULL','string','0','可以是正数，也可以是负数，如 -10 表示减10个经验值','1','','0','0','1','1442658604','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','金币值','varchar(30) NULL','string','0','可以是正数，也可以是负数，如 -10 表示减10个金币值','1','','0','0','1','1442658585','1396062146','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','0','','0','','0','0','1','1398564146','1396602859','','3','','regex','','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_credit_data` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`credit_name`  varchar(50) NULL  COMMENT '积分标识',
`uid`  int(10) NULL  DEFAULT 0 COMMENT '用户ID',
`experience`  int(10) NULL  DEFAULT 0 COMMENT '经验值',
`score`  int(10) NULL  DEFAULT 0 COMMENT '金币值',
`cTime`  int(10) NULL  COMMENT '记录时间',
`admin_uid`  int(10) NULL  DEFAULT 0 COMMENT '操作者UID',
`token`  varchar(255) NULL  COMMENT 'Token',
`credit_title`  varchar(50) NULL  COMMENT '积分标题',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('credit_data','用户积分记录','0','','1','["credit_name","uid","experience","score"]','1:基础','','','','','uid:用户\r\ncredit_name:积分标识\r\nexperience:经验值\r\nscore:金币值\r\ncTime|time_format:记录时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','uid','','1398564291','1400117739','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_name','积分标识','varchar(50) NULL','string','','','1','','0','0','1','1398564405','1398564405','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','0','','1','','0','0','1','1398564351','1398564351','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('experience','经验值','int(10) NULL','num','0','','1','','0','0','1','1398564448','1398564448','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','金币值','int(10) NULL','num','0','','1','','0','0','1','1398564486','1398564486','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','记录时间','int(10) NULL','datetime','','','0','','0','0','1','1398564567','1398564567','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('admin_uid','操作者UID','int(10) NULL','num','0','','0','','0','0','1','1398564629','1398564629','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1400603451','1400603451','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_title','积分标题','varchar(50) NULL','string','','','0','','0','0','1','1444731976','1444731976','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_material_image` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cover_id`  int(10) NULL  COMMENT '图片在本地的ID',
`cover_url`  varchar(255) NULL  COMMENT '本地URL',
`media_id`  varchar(100) NULL  DEFAULT 0 COMMENT '微信端图文消息素材的media_id',
`wechat_url`  varchar(255) NULL  COMMENT '微信端的图片地址',
`cTime`  int(10) NULL  COMMENT '创建时间',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(100) NULL  COMMENT 'Token',
`is_use`  int(10) NULL  DEFAULT 1 COMMENT '可否使用',
`aim_id`  int(10) NULL  COMMENT '添加来源标识id',
`aim_table`  varchar(255) NULL  COMMENT '来源表名',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('material_image','图片素材','0','','1','','1:基础','','','','','','10','','','1438684613','1438684613','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover_id','图片在本地的ID','int(10) NULL','num','','','0','','0','0','1','1438684652','1438684652','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover_url','本地URL','varchar(255) NULL','string','','','0','','0','0','1','1438684692','1438684692','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','微信端图文消息素材的media_id','varchar(100) NULL','string','0','','0','','0','0','1','1438744962','1438684776','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat_url','微信端的图片地址','varchar(255) NULL','string','','','0','','0','0','1','1439973558','1438684807','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1438684829','1438684829','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1438684847','1438684847','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1438684865','1438684865','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','可否使用','int(10) NULL','num','1','','0','0:不可用\r\n1:可用','0','0','1','1447901147','1447901147','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','添加来源标识id','int(10) NULL','num','','','0','','0','0','1','1447901197','1447901197','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_table','来源表名','varchar(255) NULL','string','','','0','','0','0','1','1447901240','1447901240','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_material_news` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(100) NULL  COMMENT '标题',
`author`  varchar(30) NULL  COMMENT '作者',
`cover_id`  int(10) UNSIGNED NULL  COMMENT '封面',
`intro`  varchar(255) NULL  COMMENT '摘要',
`content`  longtext  NULL  COMMENT '内容',
`link`  varchar(255) NULL  COMMENT '外链',
`group_id`  int(10) NULL  DEFAULT 0 COMMENT '多图文组的ID',
`thumb_media_id`  varchar(100) NULL  COMMENT '图文消息的封面图片素材id（必须是永久mediaID）',
`media_id`  varchar(100) NULL  DEFAULT 0 COMMENT '微信端图文消息素材的media_id',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(100) NULL  COMMENT 'Token',
`cTime`  int(10) NULL  COMMENT '发布时间',
`url`  varchar(255) NULL  COMMENT '图文页url',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('material_news','图文素材','0','','1','','1:基础','','','','','','10','','','1438670890','1438670890','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(100) NULL','string','','','1','','0','1','1','1438670933','1438670933','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('author','作者','varchar(30) NULL','string','','','1','','0','0','1','1438670961','1438670961','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover_id','封面','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1438674438','1438670980','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','摘要','varchar(255) NULL','textarea','','','1','','0','0','1','1438671024','1438671024','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','longtext  NULL','editor','','','1','','0','0','1','1440473839','1438671049','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('link','外链','varchar(255) NULL','string','','','1','','0','0','1','1438671066','1438671066','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_id','多图文组的ID','int(10) NULL','num','0','0 表示单图文，多于0 表示多图文中的第一个图文的ID值','0','','0','0','1','1438671163','1438671163','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('thumb_media_id','图文消息的封面图片素材id（必须是永久mediaID）','varchar(100) NULL','string','','','0','','0','0','1','1438671302','1438671285','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','微信端图文消息素材的media_id','varchar(100) NULL','string','0','','1','','0','0','1','1438744941','1438671373','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1438683172','1438683172','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1438683194','1438683194','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) NULL','datetime','','','0','','0','0','1','1438683499','1438683499','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','图文页url','varchar(255) NULL','string','','','0','','0','0','1','1441077355','1441077355','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_message` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`bind_keyword`  varchar(50) NULL  COMMENT '关联关键词',
`preview_openids`  text NULL  COMMENT '预览人OPENID',
`group_id`  int(10) NULL  DEFAULT 0 COMMENT '群发对象',
`type`  tinyint(2) NULL  DEFAULT 0 COMMENT '素材来源',
`media_id`  varchar(100) NULL  COMMENT '微信素材ID',
`send_type`  tinyint(1) NULL  DEFAULT 0 COMMENT '发送方式',
`send_openids`  text NULL  COMMENT '要发送的OpenID',
`msg_id`  varchar(255) NULL  COMMENT 'msg_id',
`content`  text NULL  COMMENT '文本消息内容',
`msgtype`  varchar(255) NULL  COMMENT '消息类型',
`token`  varchar(255) NULL  COMMENT 'token',
`appmsg_id`  int(10) NULL  COMMENT '图文id',
`voice_id`  int(10) NULL  COMMENT '语音id',
`video_id`  int(10) NULL  COMMENT '视频id',
`cTime`  int(10) NULL  COMMENT '群发时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('message','群发消息','0','','1','["type","bind_keyword","media_id","openid","send_type","group_id","send_openids"]','1:基础','','','','','','20','','','1437984111','1438049406','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bind_keyword','关联关键词','varchar(50) NULL','string','','先在自定义回复里增加图文，多图文或者文本内容，再把它的关键词填写到这里','1','','0','0','1','1437984209','1437984184','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('preview_openids','预览人OPENID','text NULL','textarea','','选填，多个可用逗号或者换行分开，OpenID值可在微信用户的列表中找到','1','','0','0','1','1438049470','1437985038','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_id','群发对象','int(10) NULL','dynamic_select','0','全部用户或者某分组用户','1','table=auth_group&manager_id=[manager_id]&token=[token]&value_field=id&title_field=title&first_option=全部用户','0','0','1','1438049058','1437985498','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','素材来源','tinyint(2) NULL','bool','0','','1','0:站内关键词|bind_keyword@show,media_id@hide\r\n1:微信永久素材ID|bind_keyword@hide,media_id@show','0','0','1','1437988869','1437988869','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','微信素材ID','varchar(100) NULL','string','','微信后台的素材管理里永久素材的media_id值','1','','0','0','1','1437988973','1437988973','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_type','发送方式','tinyint(1) NULL','bool','0','','1','0:按用户组发送|group_id@show,send_openids@hide\r\n1:指定OpenID发送|group_id@hide,send_openids@show','0','0','1','1438049241','1438049241','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_openids','要发送的OpenID','text NULL','textarea','','多个可用逗号或者换行分开，OpenID值可在微信用户的列表中找到','1','','0','0','1','1438049362','1438049362','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msg_id','msg_id','varchar(255) NULL','string','','','0','','0','0','1','1439980539','1438054616','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','文本消息内容','text NULL','textarea','','','0','','0','0','1','1439980070','1439980070','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgtype','消息类型','varchar(255) NULL','string','','','1','','0','0','1','1445833955','1445833955','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1445834006','1445834006','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('appmsg_id','图文id','int(10) NULL','num','','','1','','0','0','1','1445840292','1445834101','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('voice_id','语音id','int(10) NULL','num','','','1','','0','0','1','1445834144','1445834144','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('video_id','视频id','int(10) NULL','num','','','1','','0','0','1','1445834174','1445834174','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','群发时间','int(10) NULL','datetime','','','1','','0','0','1','1445856491','1445856442','','3','','regex','time','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_visit_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`publicid`  int(10) NULL  DEFAULT 0 COMMENT '公众号ID',
`module_name`  varchar(30) NULL  COMMENT '类型名',
`controller_name`  varchar(30) NULL  COMMENT '控制器名',
`action_name`  varchar(30) NULL  COMMENT '方法名',
`uid`  varchar(255) NULL  DEFAULT 0 COMMENT '访问者ID',
`ip`  varchar(30) NULL  COMMENT 'ip地址',
`brower`  varchar(30) NULL  COMMENT '浏览器',
`param`  text NULL  COMMENT '其它GET参数',
`referer`  varchar(255) NULL  COMMENT '访问的URL',
`cTime`  int(10) NULL  COMMENT '时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('visit_log','网站访问日志','0','','1','','1:基础','','','','','','10','','','1439448351','1439448351','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('publicid','公众号ID','int(10) NULL','num','0','','0','','0','0','1','1439448400','1439448400','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('module_name','类型名','varchar(30) NULL','string','','','0','','0','0','1','1439448516','1439448516','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('controller_name','控制器名','varchar(30) NULL','string','','','0','','0','0','1','1439448567','1439448567','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('action_name','方法名','varchar(30) NULL','string','','','0','','0','0','1','1439448616','1439448616','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','访问者ID','varchar(255) NULL','string','0','','0','','0','0','1','1439448654','1439448654','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ip','ip地址','varchar(30) NULL','string','','','0','','0','0','1','1439448742','1439448742','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('brower','浏览器','varchar(30) NULL','string','','','0','','0','0','1','1439448792','1439448792','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('param','其它GET参数','text NULL','textarea','','','0','','0','0','1','1439448834','1439448834','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('referer','访问的URL','varchar(255) NULL','string','','','0','','0','0','1','1439448886','1439448874','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','时间','int(10) NULL','datetime','','','0','','0','0','1','1439450668','1439450668','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_auth_group` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`wechat_group_name`  varchar(100) NULL  COMMENT '微信端的分组名',
`wechat_group_id`  int(10) NULL  DEFAULT -1 COMMENT '微信端的分组ID',
`qr_code`  varchar(255) NULL  COMMENT '微信二维码',
`is_default`  tinyint(1) NULL  DEFAULT 0 COMMENT '是否默认自动加入',
`token`  varchar(100) NULL  COMMENT 'Token',
`manager_id`  int(10) NULL  DEFAULT 0 COMMENT '管理员ID',
`rules`  text NULL  COMMENT '权限',
`type`  tinyint(2) NULL  DEFAULT 1 COMMENT '类型',
`status`  tinyint(2) NULL  DEFAULT 1 COMMENT '状态',
`description`  text NULL  COMMENT '描述信息',
`icon`  int(10) UNSIGNED NULL  COMMENT '图标',
`title`  varchar(30) NULL  COMMENT '分组名称',
`wechat_group_count`  int(10) NULL  COMMENT '微信端用户数',
`is_del`  tinyint(1) NULL  DEFAULT 0 COMMENT '是否已删除',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('auth_group','用户组','0','','1','["title","description"]','1:基础','','','','','title:分组名称\r\ndescription:描述\r\nqr_code:二维码\r\ncount:人数\r\nids:操作:export?id=[id]|导出用户,[EDIT]|编辑,[DELETE]|删除','20','title','','1437633503','1448267976','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat_group_name','微信端的分组名','varchar(100) NULL','string','','','0','','0','0','1','1437635205','1437635205','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat_group_id','微信端的分组ID','int(10) NULL','num','-1','','0','','0','0','1','1447900785','1437635149','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('qr_code','微信二维码','varchar(255) NULL','string','','','0','','0','0','1','1437635117','1437635117','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_default','是否默认自动加入','tinyint(1) NULL','radio','0','只有设置一个默认组，设置当前为默认组后之前的默认组将取消','0','0:否\r\n1:是','0','0','1','1437642358','1437635042','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1437634089','1437634089','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','0','为0时表示系统用户组','0','','0','0','1','1437634309','1437634062','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('rules','权限','text NULL','textarea','','','0','','0','0','1','1437634022','1437634022','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','类型','tinyint(2) NULL','bool','1','','0','0:普通用户组\r\n1:微信用户组\r\n2:等级用户组\r\n3:认证用户组','0','0','1','1437633981','1437633981','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','tinyint(2) NULL','bool','1','','0','1:正常\r\n0:禁用\r\n-1:删除','0','0','1','1437633826','1437633826','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('description','描述信息','text NULL','textarea','','','1','','0','0','1','1437633751','1437633751','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon','图标','int(10) UNSIGNED NULL','picture','','','0','','0','0','1','1437633711','1437633711','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','分组名称','varchar(30) NULL','string','','','1','','0','1','1','1437641907','1437633598','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat_group_count','微信端用户数','int(10) NULL','num','','','0','','0','0','1','1437644061','1437644061','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否已删除','tinyint(1) NULL','bool','0','','0','0:否\r\n1:是','0','0','1','1437650054','1437650044','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_analysis` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`sports_id`  int(10) NULL  COMMENT 'sports_id',
`type`  varchar(30) NULL  COMMENT 'type',
`time`  varchar(50) NULL  COMMENT 'time',
`total_count`  int(10) NULL  DEFAULT 0 COMMENT 'total_count',
`follow_count`  int(10) NULL  DEFAULT 0 COMMENT 'follow_count',
`aver_count`  int(10) NULL  DEFAULT 0 COMMENT 'aver_count',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('analysis','统计分析','0','','1','','1:基础','','','','','','20','','','1432806941','1432806941','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sports_id','sports_id','int(10) NULL','num','','','0','','0','0','1','1432806979','1432806979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','type','varchar(30) NULL','string','','','0','','0','0','1','1432807001','1432807001','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('time','time','varchar(50) NULL','string','','','0','','0','0','1','1432807028','1432807028','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('total_count','total_count','int(10) NULL','num','0','','0','','0','0','1','1432807049','1432807049','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_count','follow_count','int(10) NULL','num','0','','0','','0','0','1','1432807063','1432807063','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aver_count','aver_count','int(10) NULL','num','0','','0','','0','0','1','1432807079','1432807079','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_article_style` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`group_id`  int(10) NULL  DEFAULT 0 COMMENT '分组样式',
`style`  text NULL  COMMENT '样式内容',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('article_style','图文样式','0','','1','','1:基础','','','','','','20','','','1436845488','1436845488','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_id','分组样式','int(10) NULL','num','0','','1','','0','0','1','1436845570','1436845570','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('style','样式内容','text NULL','textarea','','请填写html','1','','0','1','1','1436846111','1436846111','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_article_style_group` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`group_name`  varchar(255) NULL  COMMENT '分组名称',
`desc`  text NULL  COMMENT '说明',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('article_style_group','图文样式分组','0','','1','','1:基础','','','','','','20','','','1436845186','1436845186','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_name','分组名称','varchar(255) NULL','string','','','1','','0','1','1','1436845332','1436845332','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('desc','说明','text NULL','textarea','','','1','','0','0','1','1436845361','1436845361','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_ask` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '关键词类型',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '封面简介',
`mTime`  int(10) NULL  COMMENT '修改时间',
`cover`  int(10) unsigned NULL   COMMENT '封面图片',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`finish_tip`  text NULL  COMMENT '结束语',
`content`  text NULL  COMMENT '活动介绍',
`shop_address`  text NULL  COMMENT '商家地址',
`appids`  text NULL  COMMENT '提示关注的公众号',
`finish_button`  text NULL  COMMENT '成功抢答完后显示的按钮',
`card_id`  varchar(255) NULL  COMMENT '卡券ID',
`appsecre`  varchar(255) NULL  COMMENT '卡券对应的appsecre',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('ask','抢答问卷','0','','1','["keyword","keyword_type","title","cover","intro","finish_tip","shop_address","appids","finish_button","content","card_id","appsecre","template"]','1:基础','','','','','id:微抢答ID\r\nkeyword:关键词\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,ask_question&id=[id]|问题管理,ask_answer&id=[id]|数据管理,preview&id=[id]&target=_blank|预览','20','title','','1396061373','1437449751','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396624337','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NOT NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','1','1','1396624426','1396061765','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NULL','textarea','','','1','','0','1','1','1439367292','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) unsigned NULL ','picture','','','1','','0','0','1','1396624534','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('finish_tip','结束语','text NULL','textarea','','为空默认为：抢答完成，谢谢参与','1','','0','1','1','1439367319','1396953940','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','活动介绍','text NULL','editor','','显示在用户进入的开始界面','1','','0','0','1','1420791982','1420791908','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_address','商家地址','text NULL','textarea','','显示在马上开始的下面，多个地址用英文逗号或者换行分割','1','','0','0','1','1420798853','1420794534','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('appids','提示关注的公众号','text NULL','textarea','','格式：广东南方卫视|wx2d7ce60bbfc928ef 多个公众号用换行分割','1','','0','0','1','1420798902','1420796356','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('finish_button','成功抢答完后显示的按钮','text NULL','textarea','','格式：按钮名|跳转链接，如：百度|www.baidu.com 多个时换行分割','1','','0','0','1','1420857847','1420857847','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('card_id','卡券ID','varchar(255) NULL','string','','可为空','1','','0','0','1','1421406387','1421406387','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('appsecre','卡券对应的appsecre','varchar(255) NULL','string','','','1','','0','0','1','1421406470','1421406470','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430210161','1430210161','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_ask_answer` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`answer`  text NULL  COMMENT '回答内容',
`openid`  varchar(255) NULL  COMMENT 'OpenId',
`uid`  int(10) NULL   COMMENT '用户UID',
`question_id`  int(10) unsigned NOT NULL   COMMENT 'question_id',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`ask_id`  int(10) unsigned NOT NULL   COMMENT 'ask_id',
`is_correct`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否回答正确',
`times`  int(4) NULL  DEFAULT 0 COMMENT '次数',
PRIMARY KEY (`id`),
KEY `ask_id_uid` (`ask_id`,uid),
KEY `question_uid` (`uid`,question_id,times)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('ask_answer','抢答回答','0','','1','','1:基础','','','','','uid:用户ID\r\nnickname|deal_emoji:昵称\r\nquestion_id:问题\r\nanswer:回答\r\nis_correct:是否正确\r\ntrue_answer:正确答案\r\ntimes:第几轮\r\ncTime|time_format:回答时间','20','uid:请输入用户ID','','1396061373','1430290975','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('answer','回答内容','text NULL','textarea','','','0','','0','0','1','1396955766','1396955766','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenId','varchar(255) NULL','string','','','0','','0','0','1','1430286439','1396955581','','3','','regex','get_openid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户UID','int(10) NULL ','num','','','0','','0','0','1','1396955530','1396955530','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('question_id','question_id','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1396955412','1396955392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ask_id','ask_id','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1396955403','1396955369','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_correct','是否回答正确','tinyint(2) NULL','bool','1','','0','0:不正确\r\n1:正确','0','0','1','1420685956','1420685956','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('times','次数','int(4) NULL','num','0','','0','','0','0','1','1420965038','1420965038','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_ask_question` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '问题描述',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`is_must`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否必填',
`extra`  text NOT NULL  COMMENT '参数',
`type`  char(50) NOT NULL  DEFAULT 'radio' COMMENT '问题类型',
`ask_id`  int(10) unsigned NOT NULL   COMMENT 'ask_id',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`answer`  varchar(255) NOT NULL  COMMENT '正确答案',
`is_last`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否最后一题',
`wait_time`  int(10) NULL  DEFAULT 0 COMMENT '等待时间',
`percent`  int(10) NULL  DEFAULT 100 COMMENT '抢中概率',
`answer_time`  int(10) NULL  COMMENT '答题时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('ask_question','抢答问题','0','','1','["title","type","extra","answer","wait_time","sort","percent","intro"]','1:基础','','','','','title:标题\r\ntype|get_name_by_status:问题类型\r\nwait_time:时间间隔\r\npercent:抢中概率\r\nanswer:正确答案\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1396061373','1421749210','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','问题描述','text NULL','textarea','','','1','','0','0','1','1396954176','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_must','是否必填','tinyint(2) NULL','bool','1','','0','0:否\r\n1:是','0','0','1','1420686586','1396954649','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra','参数','text NOT NULL','textarea','','类型为单选、多选时的定义数据，格式见上面的提示','1','','0','1','1','1421749164','1396954558','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','问题类型','char(50) NOT NULL','radio','radio','','1','radio:单选题\r\ncheckbox:多选题','0','1','1','1420689062','1396954463','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ask_id','ask_id','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1396954240','1396954240','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','值越小越靠前','1','','0','0','1','1420689390','1396955010','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('answer','正确答案','varchar(255) NOT NULL','string','','多个答案用空格分开，如： A B C','1','','0','1','1','1421749143','1420685041','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_last','是否最后一题','tinyint(2) NULL','bool','0','如设置为最后一题，用户回答后进入完成页面，否则进入等待下一题提示页面','0','0:否\r\n1:是','0','0','1','1421749096','1420686448','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wait_time','等待时间','int(10) NULL','num','0','单位为秒，表示答题后进入下一题的间隔时间','1','','0','0','1','1420688805','1420688703','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('percent','抢中概率','int(10) NULL','num','100','抢到题目的百分比，请填写0~100之间的整数，如填写50表示概率为50%','1','','0','0','1','1420855970','1420855970','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('answer_time','答题时间','int(10) NULL','num','','不填则为无答题时间限制','1','','0','0','1','1427541360','1427541360','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_business_card` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`permission`  char(50) NULL  DEFAULT 1 COMMENT '权限设置',
`intro`  text NULL  COMMENT '个人介绍',
`wishing`  varchar(100) NULL  COMMENT '希望结交',
`wechat`  varchar(50) NULL  COMMENT '微信号',
`Email`  varchar(100) NULL  COMMENT '邮箱',
`telephone`  varchar(30) NULL  COMMENT '座机',
`address`  varchar(255) NULL  COMMENT '地址',
`company_url`  varchar(255) NULL  COMMENT '公司网址',
`department`  varchar(50) NULL  COMMENT '所属部门',
`company`  varchar(100) NULL  COMMENT '公司名称',
`mobile`  varchar(30) NULL  COMMENT '手机',
`position`  varchar(50) NULL  COMMENT '职位头衔',
`headface`  int(10) UNSIGNED NULL  COMMENT '头像',
`personal_url`  varchar(255) NULL  COMMENT '个人主页',
`interest`  varchar(255) NULL  COMMENT '兴趣',
`tag`  varchar(255) NULL  COMMENT '人物标签',
`weibo`  varchar(255) NULL  COMMENT '微博',
`qq`  varchar(30) NULL  COMMENT 'QQ号',
`service`  text NULL  COMMENT '产品服务',
`truename`  varchar(50) NULL  COMMENT '真实姓名',
`uid`  int(10) NULL  COMMENT '用户ID',
`template`  varchar(50) NULL  COMMENT '选择的模板',
`token`  varchar(100) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('business_card','微名片','0','','1','["truename","mobile","company","service","position","department","company_url","address","telephone","Email","wechat","qq","weibo","tag","wishing","interest","personal_url","intro","permission"]','1:基础','','','','','uid:用户ID\r\ntruename:名称\r\nposition:职位\r\naddress:地址\r\nmobile:电话\r\ncompany:公司\r\nqq:QQ号\r\nwechat:微信号\r\nemail:邮箱\r\nqrcode:二维码\r\nids:操作:[EDIT]|编辑,lists?business_card_id=[id]&_controller=BusinessCardColunm&target=_blank|栏目管理','10','truename:请输入名称搜索','','1438931238','1441782521','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('permission','权限设置','char(50) NULL','select','1','','1','1:完全公开(公众人物)\r\n2:群友可见(商务交往)\r\n3:交换名片可见(私人来往)\r\n4:仅自己可见(绝密保存)','0','0','1','1438945015','1438945015','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','个人介绍','text NULL','textarea','','','1','','0','0','1','1438944828','1438944828','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wishing','希望结交','varchar(100) NULL','string','','','1','','0','0','1','1438942908','1438942908','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat','微信号','varchar(50) NULL','string','','','1','','0','0','1','1438942392','1438942392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Email','邮箱','varchar(100) NULL','string','','','1','','0','0','1','1438942359','1438942359','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('telephone','座机','varchar(30) NULL','string','','','1','','0','0','1','1438942330','1438942330','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','地址','varchar(255) NULL','string','','','1','','0','0','1','1438933681','1438933681','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('company_url','公司网址','varchar(255) NULL','string','','','1','','0','0','1','1438933650','1438933650','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('department','所属部门','varchar(50) NULL','string','','','1','','0','0','1','1438933471','1438933471','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('company','公司名称','varchar(100) NULL','string','','','1','','0','1','1','1438933418','1438933418','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mobile','手机','varchar(30) NULL','string','','','1','','0','1','1','1438933381','1438933381','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('position','职位头衔','varchar(50) NULL','string','','','1','如：XX创始人、xx级教师、xx投资顾问、XX爸爸、XX达人','0','0','1','1438933330','1438933330','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('headface','头像','int(10) UNSIGNED NULL','picture','','','0','','0','0','1','1439175454','1438944864','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('personal_url','个人主页','varchar(255) NULL','string','','','1','','0','0','1','1438944804','1438944804','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('interest','兴趣','varchar(255) NULL','string','','','1','','0','0','1','1438942945','1438942945','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tag','人物标签','varchar(255) NULL','string','','多个用逗号分开','1','','0','0','1','1438942491','1438942491','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('weibo','微博','varchar(255) NULL','string','','','1','','0','0','1','1438942443','1438942443','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('qq','QQ号','varchar(30) NULL','string','','','1','','0','0','1','1438942418','1438942418','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('service','产品服务','text NULL','textarea','','','1','','0','1','1','1438933623','1438933623','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('truename','真实姓名','varchar(50) NULL','string','','','1','','0','1','1','1438931443','1438931443','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1438931293','1438931293','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','选择的模板','varchar(50) NULL','string','','','0','','0','0','1','1438947089','1438947089','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1439869080','1439290478','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_business_card_collect` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`from_uid`  int(10) NULL  COMMENT '收藏人ID',
`to_uid`  int(10) NULL  COMMENT '被收藏人的ID',
`cTime`  int(10) NULL  COMMENT '收藏时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('business_card_collect','名片收藏','0','','1','','1:基础','','','','','','10','','','1439188441','1439188441','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('from_uid','收藏人ID','int(10) NULL','num','','','0','','0','0','1','1439188549','1439188462','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('to_uid','被收藏人的ID','int(10) NULL','num','','','0','','0','0','1','1439188512','1439188512','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','收藏时间','int(10) NULL','datetime','','','0','','0','0','1','1439188537','1439188537','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_vouchers` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT 'uid',
`cover`  int(10) UNSIGNED NULL  COMMENT '素材封面',
`balance`  varchar(30) NULL  COMMENT '红包余额',
`card_id`  varchar(100) NOT NULL  COMMENT '卡券ID',
`openid`  text NULL  COMMENT 'OpenID',
`appsecre`  varchar(255) NOT NULL  COMMENT '开通卡券的商家公众号密钥',
`code`  text NULL  COMMENT '卡券code码',
`content`  text NULL  COMMENT '活动介绍',
`background`  int(10) UNSIGNED NULL  COMMENT '背景图',
`token`  varchar(50) NULL  COMMENT 'token',
`title`  varchar(255) NULL  DEFAULT '卡券' COMMENT '卡券标题',
`button_color`  varchar(255) NULL  DEFAULT '#0dbd02' COMMENT '领取按钮颜色',
`head_bg_color`  varchar(255) NULL  DEFAULT '#35a2dd' COMMENT '头部背景颜色',
`shop_name`  varchar(255) NULL  COMMENT '商家名称',
`shop_logo`  int(10) UNSIGNED NULL  COMMENT '商家LOGO',
`more_button`  text NULL  COMMENT '添加更多按钮',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_vouchers','微信卡券','0','','1','["appsecre","code","content","background","title","button_color","head_bg_color","shop_name","uid","token","shop_logo","more_button","template"]','1:基础','','','','','title:卡券名称\r\ncard_id:卡券ID\r\nappsecre:商家公众号密钥\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,preview?id=[id]&target=_blank|预览','20','card_id','','1421980317','1437451096','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','1','','0','0','1','1430998977','1430998977','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','素材封面','int(10) UNSIGNED NULL','picture','','','0','','0','0','1','1427435373','1422000629','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('balance','红包余额','varchar(30) NULL','string','','红包余额，以分为单位。红包类型必填 （LUCKY_MONEY），其他卡券类型不填','0','','0','0','1','1427435295','1421982394','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('card_id','卡券ID','varchar(100) NOT NULL','string','','','0','','0','1','1','1427435272','1421980436','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenID','text NULL','textarea','','指定领取者的openid，只有该用户能领取。bind_openid字段为true的卡券必须填写，非自定义openid 不必填写','0','','0','0','1','1427435344','1421980851','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('appsecre','开通卡券的商家公众号密钥','varchar(255) NOT NULL','string','','','1','','0','1','1','1421980516','1421980516','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('code','卡券code码','text NULL','textarea','','指定的卡券code 码，只能被领一次。use_custom_code 字段为true 的卡券必须填写，非自定义code 不必填写','1','','0','0','1','1421980773','1421980773','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','活动介绍','text NULL','editor','','','1','','0','0','1','1421981078','1421981078','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('background','背景图','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1422000931','1422000931','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(50) NULL','string','','','1','','0','0','1','1430999013','1430999013','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','卡券标题','varchar(255) NULL','string','卡券','','1','','0','0','1','1427435445','1427435445','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('button_color','领取按钮颜色','varchar(255) NULL','string','#0dbd02','','1','','0','0','1','1427435492','1427435492','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('head_bg_color','头部背景颜色','varchar(255) NULL','string','#35a2dd','','1','','0','0','1','1427435535','1427435535','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_name','商家名称','varchar(255) NULL','string','','','1','','0','0','1','1427438002','1427438002','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_logo','商家LOGO','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1427437781','1427437781','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('more_button','添加更多按钮','text NULL','textarea','','','1','','0','0','1','1427512791','1427512791','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430129779','1430129779','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_custom_menu` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`sort`  tinyint(4) NULL   DEFAULT 0 COMMENT '排序号',
`pid`  int(10) NULL  DEFAULT 0 COMMENT '一级菜单',
`title`  varchar(50) NOT NULL  COMMENT '菜单名',
`keyword`  varchar(100) NULL  COMMENT '关联关键词',
`url`  varchar(255) NULL   COMMENT '关联URL',
`token`  varchar(255) NULL  COMMENT 'Token',
`type`  varchar(30) NULL  DEFAULT 'click' COMMENT '类型',
`from_type`  char(50) NULL  DEFAULT 9 COMMENT '配置动作',
`addon`  char(30) NULL  DEFAULT 0 COMMENT '选择插件',
`target_id`  int(10) NULL  COMMENT '选择内容',
`sucai_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '素材类型',
`jump_type`  int(10) NULL  DEFAULT 0 COMMENT '推送类型',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('custom_menu','自定义菜单','0','','1','["pid","title","from_type","type","jump_type","addon","sucai_type","keyword","url","sort"]','1:基础','','','','','title:10%菜单名\r\nkeyword:10%关联关键词\r\nurl:50%关联URL\r\nsort:5%排序号\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1394518309','1446533816','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','tinyint(4) NULL ','num','0','数值越小越靠前','1','','0','0','1','1394523288','1394519175','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','一级菜单','int(10) NULL','select','0','如果是一级菜单，选择“无”即可','1','0:无','0','0','1','1416810279','1394518930','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','菜单名','varchar(50) NOT NULL','string','','可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。','1','','0','1','1','1408951570','1394518988','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关联关键词','varchar(100) NULL','string','','','1','','0','0','1','1416812109','1394519054','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','关联URL','varchar(255) NULL ','string','','','1','','0','0','1','1394519090','1394519090','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1394526820','1394526820','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','类型','varchar(30) NULL','bool','click','','1','click:点击推事件|keyword@show,url@hide\r\nview:跳转URL|keyword@hide,url@show\r\nscancode_push:扫码推事件|keyword@show,url@hide\r\nscancode_waitmsg:扫码带提示|keyword@show,url@hide\r\npic_sysphoto:弹出系统拍照发图|keyword@show,url@hide\r\npic_photo_or_album:弹出拍照或者相册发图|keyword@show,url@hide\r\npic_weixin:弹出微信相册发图器|keyword@show,url@hide\r\nlocation_select:弹出地理位置选择器|keyword@show,url@hide\r\nnone:无事件的一级菜单|keyword@hide,url@hide','0','0','1','1416812039','1416810588','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('from_type','配置动作','char(50) NULL','select','9','','1','0:站内信息|keyword@hide,url@hide,type@hide,sucai_type@hide,addon@show,jump_type@show\r\n1:站内素材|keyword@hide,url@hide,type@hide,sucai_type@show,addon@hide,jump_type@hide\r\n9:自定义|keyword@show,url@hide,type@show,addon@hide,sucai_type@hide,jump_type@hide','0','0','1','1446531819','1445423158','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon','选择插件','char(30) NULL','select','0','','1','0:请选择','0','0','1','1446431345','1446431345','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('target_id','选择内容','int(10) NULL','select','','','4','0:请选择','0','0','1','1446553237','1446431416','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sucai_type','素材类型','tinyint(2) NULL','select','0','','1','0:请选择\r\n1:图文\r\n2:文本\r\n3:图片\r\n4:语音\r\n5:视频','0','0','1','1446460267','1446431557','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('jump_type','推送类型','int(10) NULL','radio','0','','1','1:URL|keyword@hide,url@show\r\n0:关键词|keyword@show,url@hide','0','0','1','1446531989','1446523594','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_custom_reply_mult` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(255) NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '关键词类型',
`mult_ids`  varchar(255) NULL  COMMENT '多图文ID',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('custom_reply_mult','多图文配置','0','','1','','1:基础','','','','','','20','','','1396602475','1396602475','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(255) NULL','string','','','1','','0','0','1','1396602514','1396602514','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','0','1','1396602706','1396602548','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mult_ids','多图文ID','varchar(255) NULL','string','','','0','','0','0','1','1396602601','1396602578','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602821','1396602821','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_custom_reply_news` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NULL  COMMENT '关键词类型',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '简介',
`cate_id`  int(10) unsigned NULL   DEFAULT 0 COMMENT '所属类别',
`cover`  int(10) unsigned NULL   COMMENT '封面图片',
`content`  text NULL  COMMENT '内容',
`cTime`  int(10) NULL  COMMENT '发布时间',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`view_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '浏览数',
`token`  varchar(255) NULL  COMMENT 'Token',
`jump_url`  varchar(255) NULL  COMMENT '外链',
`author`  varchar(50) NULL  COMMENT '作者',
`show_type`  varchar(100) NULL  DEFAULT 0 COMMENT '显示方式',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('custom_reply_news','图文回复','0','','1','["keyword","keyword_type","title","intro","cate_id","cover","content","sort","jump_url","author"]','1:基础','','','','','id:5%ID\r\nkeyword:10%关键词\r\nkeyword_type|get_name_by_status:10%关键词类型\r\ntitle:30%标题\r\ncate_id:10%所属分类\r\nsort:7%排序号\r\nview_count:8%浏览数\r\nids:20%操作:[EDIT]|编辑,[DELETE]|删除,detail&_addons=WeiSite&_controller=WeiSite&id=[id]|复制链接','20','title','','1396061373','1445401730','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396061575','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NULL','select','','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','0','1','1396061814','1396061765','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396061877','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','简介','text NULL','textarea','','','1','','0','0','1','1396061947','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cate_id','所属类别','int(10) unsigned NULL ','select','0','要先在微官网分类里配置好分类才可选择','1','0:请选择分类','0','0','1','1396078914','1396062003','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) unsigned NULL ','picture','','','1','','0','0','1','1396062093','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','text NULL','editor','','','1','','0','0','1','1396062146','1396062146','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) NULL','datetime','','','0','','0','0','1','1396075102','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','数值越小越靠前','1','','0','0','1','1396510508','1396510508','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','浏览数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1396510630','1396510630','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('jump_url','外链','varchar(255) NULL','string','','如需跳转填写网址(记住必须有http://)如果填写了图文详细内容，这里请留空，不要设置！','1','','0','0','1','1402482073','1402482073','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('author','作者','varchar(50) NULL','string','','为空时取当前用户名','1','','0','0','1','1437988055','1437988055','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('show_type','显示方式','varchar(100) NULL','checkbox','0','选中，则指定文章在列表页面中的显示方式【列表或幻灯片】；不选中，则不显示','1','0:列表','0','0','1','1449659717','1449657740','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_custom_reply_text` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(255) NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '关键词类型',
`content`  text NULL  COMMENT '回复内容',
`view_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '浏览数',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('custom_reply_text','文本回复','0','','1','["keyword","keyword_type","content","sort"]','1:基础','','','','','id:ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\nsort:排序号\r\nview_count:浏览数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','keyword','','1396578172','1401017369','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(255) NULL','string','','多个关键词请用空格分开：例如: 高 富 帅','1','','0','0','1','1396578460','1396578212','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','0','1','1396623302','1396578249','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','回复内容','text NULL','textarea','','请不要多于1000字否则无法发送。支持加超链接，但URL必须带http://','1','','0','0','1','1396607362','1396578597','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','浏览数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1396580643','1396580643','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','','1','','0','0','1','1396580674','1396580674','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396603007','1396603007','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_draw_follow_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`follow_id`  int(10) NULL  COMMENT '粉丝id',
`sports_id`  int(10) NULL  COMMENT '场次id',
`count`  int(10) NULL  DEFAULT 0 COMMENT '抽奖次数',
`uid`  int(10) NULL  COMMENT 'uid',
`cTime`  int(10) NULL  COMMENT '支持时间',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`),
KEY `sports_id` (`sports_id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('draw_follow_log','粉丝抽奖记录','0','','1','["follow_id","sports_id","count","cTime"]','1:基础','','','','','','20','','','1432619171','1432719012','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','粉丝id','int(10) NULL','num','','','1','','0','0','1','1432619233','1432619233','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sports_id','场次id','int(10) NULL','num','','','1','','0','0','1','1432690316','1432619261','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('count','抽奖次数','int(10) NULL','num','0','','1','','0','0','1','1432619288','1432619288','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1435313298','1435313298','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','支持时间','int(10) NULL','datetime','','','1','','0','0','1','1432690461','1432690461','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1444986759','1444986759','','3','','regex','get_token','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_forms` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`cTime`  int(10) UNSIGNED NULL  COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`password`  varchar(255) NULL  COMMENT '表单密码',
`keyword_type`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '关键词类型',
`jump_url`  varchar(255) NULL  COMMENT '提交后跳转的地址',
`content`  text NULL  COMMENT '详细介绍',
`finish_tip`  text NULL  COMMENT '用户提交后提示内容',
`can_edit`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否允许编辑',
`intro`  text NULL  COMMENT '封面简介',
`mTime`  int(10) NULL  COMMENT '修改时间',
`cover`  int(10) UNSIGNED NULL  COMMENT '封面图片',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('forms','通用表单','0','','1','["keyword","keyword_type","title","intro","cover","can_edit","finish_tip","jump_url","content","template"]','1:基础','','','','','id:通用表单ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,forms_attribute&id=[id]|字段管理,forms_value&id=[id]|数据管理,preview&id=[id]|预览','20','title','','1396061373','1437450012','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) UNSIGNED NULL','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('password','表单密码','varchar(255) NULL','string','','如要用户输入密码才能进入表单，则填写此项。否则留空，用户可直接进入表单','0','','0','0','1','1396871497','1396672643','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NOT NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配','0','1','1','1396624426','1396061765','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('jump_url','提交后跳转的地址','varchar(255) NULL','string','','要以http://开头的完整地址，为空时不跳转','1','','0','0','1','1402458121','1399800276','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','详细介绍','text NULL','editor','','可不填','1','','0','0','1','1396865295','1396865295','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('finish_tip','用户提交后提示内容','text NULL','textarea','','为空默认为：提交成功，谢谢参与','1','','0','0','1','1396676366','1396673689','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('can_edit','是否允许编辑','tinyint(2) NULL','bool','0','用户提交表单是否可以再编辑','1','0:不允许\r\n1:允许','0','0','1','1396688624','1396688624','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NULL','textarea','','','1','','0','1','1','1439371986','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) UNSIGNED NULL','picture','','','1','','0','1','1','1439372018','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396866048','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','模板','varchar(255) NULL','string','default','','1','','0','0','1','1431661124','1431661124','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_forms_attribute` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否显示',
`forms_id`  int(10) UNSIGNED NULL  COMMENT '表单ID',
`error_info`  varchar(255) NULL  COMMENT '出错提示',
`sort`  int(10) UNSIGNED NULL  DEFAULT 0 COMMENT '排序号',
`validate_rule`  varchar(255) NULL  COMMENT '正则验证',
`is_must`  tinyint(2) NULL  COMMENT '是否必填',
`remark`  varchar(255) NULL  COMMENT '字段备注',
`name`  varchar(100) NOT NULL  COMMENT '字段名',
`token`  varchar(255) NULL  COMMENT 'Token',
`value`  varchar(255) NULL  COMMENT '默认值',
`title`  varchar(255) NOT NULL  COMMENT '字段标题',
`mTime`  int(10) NULL  COMMENT '修改时间',
`extra`  text NULL  COMMENT '参数',
`type`  char(50) NOT NULL  DEFAULT 'string' COMMENT '字段类型',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('forms_attribute','表单字段','0','','1','["name","title","type","extra","value","remark","is_must","validate_rule","error_info","sort"]','1:基础','','','','','title:字段标题\r\nname:字段名\r\ntype|get_name_by_status:字段类型\r\nids:操作:[EDIT]&forms_id=[forms_id]|编辑,[DELETE]|删除','20','title','','1396061373','1396710959','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','tinyint(2) NULL','select','1','是否显示在表单中','1','1:显示\r\n0:不显示','0','0','1','1396848437','1396848437','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('forms_id','表单ID','int(10) UNSIGNED NULL','num','','','4','','0','0','1','1396710040','1396690613','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('error_info','出错提示','varchar(255) NULL','string','','验证不通过时的提示语','1','','0','0','1','1396685920','1396685920','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) UNSIGNED NULL','num','0','值越小越靠前','1','','0','0','1','1396685825','1396685825','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('validate_rule','正则验证','varchar(255) NULL','string','','为空表示不作验证','1','','0','0','1','1396685776','1396685776','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_must','是否必填','tinyint(2) NULL','bool','','用于自动验证','1','0:否\r\n1:是','0','0','1','1396685579','1396685579','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','字段备注','varchar(255) NULL','string','','用于表单中的提示','1','','0','0','1','1396685482','1396685482','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','字段名','varchar(100) NOT NULL','string','','请输入字段名 英文字母开头，长度不超过30','1','','0','1','1','1439372205','1396676792','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('value','默认值','varchar(255) NULL','string','','字段的默认值','1','','0','0','1','1396685291','1396685291','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','字段标题','varchar(255) NOT NULL','string','','请输入字段标题，用于表单显示','1','','0','1','1','1396676830','1396676830','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra','参数','text NULL','textarea','','字段类型为单选、多选、下拉选择和级联选择时的定义数据，其它字段类型为空','1','','0','0','1','1396835020','1396685105','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','字段类型','char(50) NOT NULL','select','string','用于表单中的展示方式','1','string:单行输入\r\ntextarea:多行输入\r\nradio:单选\r\ncheckbox:多选\r\nselect:下拉选择\r\ndatetime:时间\r\npicture:上传图片','0','1','1','1396871262','1396683600','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_forms_value` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`forms_id`  int(10) UNSIGNED NULL  COMMENT '表单ID',
`value`  text NULL  COMMENT '表单值',
`cTime`  int(10) NULL  COMMENT '增加时间',
`openid`  varchar(255) NULL  COMMENT 'OpenId',
`uid`  int(10) NULL  COMMENT '用户ID',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('forms_value','通用表单数据','0','','1','','1:基础','','','','','','20','','','1396687959','1396687959','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('forms_id','表单ID','int(10) UNSIGNED NULL','num','','','4','','0','0','1','1396710064','1396688308','','3','','regex','','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('value','表单值','text NULL','textarea','','','0','','0','0','1','1396688355','1396688355','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','增加时间','int(10) NULL','datetime','','','0','','0','0','1','1396688434','1396688434','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenId','varchar(255) NULL','string','','','0','','0','0','1','1396688187','1396688187','','3','','regex','get_openid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1396688042','1396688042','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396690911','1396690911','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_guess` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '竞猜标题',
`desc`  text NULL  COMMENT '活动说明',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '结束时间',
`create_time`  int(10) NULL  COMMENT '创建时间',
`guess_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '',
`token`  varchar(255) NULL  COMMENT 'Token',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
`cover`  int(10) UNSIGNED NULL  COMMENT '主题图片',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('guess','竞猜','0','','1','["title","desc","start_time","end_time","template","cover"]','1:基础','','','','','title:活动名称\r\nstart_time|time_format:开始时间\r\nend_time|time_format:结束时间\r\nguess_count:参与人数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,guessOption&guess_id=[id]&target=_blank|竞猜选项,guessLog&guess_id=[id]&target=_blank|竞猜记录,preview?id=[id]&target=_blank|预览','20','title:活动名称','','1428654951','1437450636','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','竞猜标题','varchar(255) NULL','string','','','1','','0','1','1','1428655010','1428655010','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('desc','活动说明','text NULL','textarea','','','1','','0','0','1','1428657017','1428657017','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1428657086','1428657086','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','1','1','1428657122','1428657122','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('create_time','创建时间','int(10) NULL','datetime','','','4','','0','0','1','1428664508','1428664122','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('guess_count','','int(10) unsigned NULL ','num','0','','4','','0','0','1','1428718033','1428717991','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1429521291','1429512366','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430115411','1430103969','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','主题图片','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1430384839','1430384839','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_guess_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`user_id`  int(10) unsigned NULL  DEFAULT 0 COMMENT '用户ID',
`guess_id`  int(10) unsigned NULL  DEFAULT 0 COMMENT '竞猜Id',
`token`  varchar(255) NULL  COMMENT '用户token',
`optionIds`  varchar(255) NULL  COMMENT '用户猜的选项IDs',
`cTime`  int(10) NULL  COMMENT '创时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('guess_log','竞猜记录','0','','1','["token"]','1:基础','','','','','optionIds:竞猜选项\r\nuser_id:用户id\r\nuser_name:用户昵称\r\ntoken:用户token\r\ncTime|time_format:竞猜时间\r\n','20','','','1428738271','1430374436','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('user_id','用户ID','int(10) unsigned NULL','num','0','','0','','0','0','1','1428738317','1428738317','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('guess_id','竞猜Id','int(10) unsigned NULL','num','0','','0','','0','0','1','1428738379','1428738379','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','用户token','varchar(255) NULL','string','','','1','','0','0','1','1428738405','1428738405','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('optionIds','用户猜的选项IDs','varchar(255) NULL','string','','','0','','0','0','1','1428738522','1428738522','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创时间','int(10) NULL','date','','','0','','0','0','1','1428738552','1428738552','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_guess_option` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`guess_id`  int(10) NULL  DEFAULT 0 COMMENT '竞猜活动的Id',
`name`  varchar(255) NULL  COMMENT '选项名称',
`image`  int(10) UNSIGNED NULL  COMMENT '选项图片',
`order`  int(10) NULL  DEFAULT 0 COMMENT '选项顺序',
`guess_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '竞猜人数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('guess_option','竞猜项目','0','','1','["name","image","order"]','1:基础','','','','','title:活动名称\r\nname:选项名称\r\nimage|get_img_html:选项图片\r\norder:选项顺序\r\nguess_count:竞猜人数\r\nids:操作:optionLog&guess_id=[guess_id]&option_id=[id]|查看选项竞猜记录','20','','','1428659140','1430374342','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('guess_id','竞猜活动的Id','int(10) NULL','num','0','','4','','0','0','1','1428659228','1428659228','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','选项名称','varchar(255) NULL','string','','','1','','0','1','1','1428659270','1428659270','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('image','选项图片','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1428659313','1428659313','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order','选项顺序','int(10) NULL','num','0','','1','','0','0','1','1428659354','1428659354','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('guess_count','竞猜人数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1430302786','1428659432','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_invite` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '关键词类型',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '封面简介',
`mTime`  int(10) NULL  COMMENT '修改时间',
`cover`  int(10) UNSIGNED NOT NULL  COMMENT '封面图片',
`experience`  int(10) NULL  DEFAULT 0 COMMENT '消耗经验值',
`cTime`  int(10) UNSIGNED NULL  COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`num`  int(10) NULL  DEFAULT 0 COMMENT '邀请人数',
`coupon_id`  int(10) NULL  COMMENT '优惠券编号',
`coupon_num`  int(10) NULL  DEFAULT 0 COMMENT '优惠券数',
`receive_num`  int(10) NULL  DEFAULT 0 COMMENT '已领取优惠券数',
`content`  text NULL  COMMENT '邀约介绍',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '模板名称',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('invite','微邀约','0','','1','["keyword","keyword_type","title","intro","cover","experience","num","coupon_id","content","template"]','1:基础','','','','','keyword:关键词\r\ntitle:标题\r\nexperience:消耗经验值\r\ncoupon_id:优惠券编号\r\ncoupon_name:优惠券标题\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[coupon_id]&target=_blank&_addons=Coupon&_controller=Sn|领取记录,preview?id=[id]&target=_blank|预览','20','title','','1396061373','1437448319','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396624337','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NOT NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配','0','1','1','1396624426','1396061765','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NULL','textarea','','','1','','0','0','1','1396624505','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) UNSIGNED NOT NULL','picture','','','1','','0','1','1','1418266006','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('experience','消耗经验值','int(10) NULL','num','0','','1','','0','0','1','1418180506','1418180506','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) UNSIGNED NULL','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','邀请人数','int(10) NULL','num','0','邀请多少人后才能用优惠券','1','','0','0','1','1418180590','1418180590','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','优惠券编号','int(10) NULL','num','','可以在优惠券列表中找到对应的编号','1','','0','0','1','1418183454','1418180739','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_num','优惠券数','int(10) NULL','num','0','赠送多少张优惠券','0','','0','0','1','1418959022','1418180812','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('receive_num','已领取优惠券数','int(10) NULL','num','0','','0','','0','0','1','1418181528','1418181528','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','邀约介绍','text NULL','editor','','','1','','0','0','1','1418889321','1418265599','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','模板名称','varchar(255) NULL','string','default','','1','','0','0','1','1430122784','1430122766','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_invite_user` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'Token',
`uid`  int(10) NULL  COMMENT '用户ID',
`invite_id`  int(10) NULL  COMMENT '邀约ID',
`invite_num`  int(10) NULL  COMMENT '已邀请人数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('invite_user','微邀约用户记录','0','','1','','1:基础','','','','','','20','','','1418192328','1418192328','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1418192408','1418192408','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1418192629','1418192629','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('invite_id','邀约ID','int(10) NULL','num','','','1','','0','0','1','1418192878','1418192878','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('invite_num','已邀请人数','int(10) NULL','num','','','0','','0','0','1','1418192971','1418192971','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lottery_prize_list` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`sports_id`  int(10) NULL  COMMENT '活动编号',
`award_id`  varchar(255) NULL  COMMENT '奖品编号',
`award_num`  int(10) NULL  COMMENT '奖品数量',
`uid`  int(10) NULL  COMMENT 'uid',
PRIMARY KEY (`id`),
KEY `sports_id` (`sports_id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lottery_prize_list','抽奖奖品列表','0','','1','["sports_id","award_id","award_num"]','1:基础','','','','','sports_id:比赛场次\r\naward_id:奖品名称\r\naward_num:奖品数量\r\nid:编辑:[EDIT]|编辑,[DELETE]|删除,add?sports_id=[sports_id]|添加','20','','','1432613700','1432710817','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sports_id','活动编号','int(10) NULL','num','','','1','','0','0','1','1432690590','1432613794','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_id','奖品编号','varchar(255) NULL','cascade','','','1','','0','0','1','1432710935','1432613820','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_num','奖品数量','int(10) NULL','num','','','1','','0','0','1','1432624743','1432624743','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1435313078','1435313078','','3','','regex','get_mid','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lucky_follow` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT 'uid',
`draw_id`  int(10) NULL  COMMENT '活动编号',
`sport_id`  int(10) NULL  COMMENT '场次编号',
`award_id`  int(10) NULL  COMMENT '奖品编号',
`follow_id`  int(10) NULL  COMMENT '粉丝id',
`address`  varchar(255) NULL  COMMENT '地址',
`num`  int(10) NULL  DEFAULT 0 COMMENT '获奖数',
`state`  tinyint(2) NULL  DEFAULT 0 COMMENT '兑奖状态',
`zjtime`  int(10) NULL  COMMENT '中奖时间',
`djtime`  int(10) NULL  COMMENT '兑奖时间',
`token`  varchar(255) NULL  COMMENT 'token',
`aim_table`  varchar(255) NULL  COMMENT '活动标识',
`remark`  text NULL  COMMENT '备注',
`scan_code`  varchar(255) NULL  COMMENT '核销码',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lucky_follow','中奖者信息','0','','1','["draw_id","award_id","follow_id","address","num","state","zjtime","djtime","remark"]','1:基础','','','','','draw_id:活动\r\naward_id:奖项\r\naward_name:奖品\r\nzjtime|time_format:中奖时间\r\nfollow_id|deal_emoji:8%微信昵称\r\ntruename:姓名\r\nmobile:电话\r\naddress:地址\r\nstate|get_name_by_status:发奖状态\r\nremark:备注\r\nids:8%操作:do_fafang?id=[id]|发放奖品','20','award_id:输入奖品名称','','1432618091','1445062270','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1435313219','1435313219','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('draw_id','活动编号','int(10) NULL','num','','','1','','0','0','1','1432619092','1432618270','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sport_id','场次编号','int(10) NULL','num','','','0','','0','0','1','1444966542','1432618305','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_id','奖品编号','int(10) NULL','num','','','1','','0','0','1','1432618336','1432618336','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','粉丝id','int(10) NULL','num','','','1','','0','0','1','1432618392','1432618392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','地址','varchar(255) NULL','string','','','1','','0','0','1','1432618543','1432618543','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','获奖数','int(10) NULL','num','0','','1','','0','0','1','1432618584','1432618584','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','兑奖状态','tinyint(2) NULL','bool','0','','1','0:未兑奖\r\n1:已兑奖\r\n2:可以兑奖','0','0','1','1446432737','1432618716','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zjtime','中奖时间','int(10) NULL','datetime','','','1','','0','0','1','1432716949','1432618837','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('djtime','兑奖时间','int(10) NULL','datetime','','','1','','0','0','1','1432618922','1432618922','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1444966581','1444966581','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_table','活动标识','varchar(255) NULL','string','','','0','','0','0','1','1444966689','1444966689','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','text NULL','textarea','','','1','','0','0','1','1445056786','1445056786','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('scan_code','核销码','varchar(255) NULL','string','','','1','','0','0','1','1446202559','1446202559','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_activities` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '活动名称',
`remark`  text NULL  COMMENT '活动描述',
`logo_img`  int(10) UNSIGNED NULL  COMMENT '活动LOGO',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '结束时间',
`get_prize_tip`  varchar(255) NULL  COMMENT '中奖提示信息',
`no_prize_tip`  varchar(255) NULL  COMMENT '未中奖提示信息',
`ctime`  int(10) NULL  COMMENT '活动创建时间',
`uid`  int(10) NULL  COMMENT 'uid',
`lottery_number`  int(10) NULL  DEFAULT 1 COMMENT '抽奖次数',
`comment_status`  char(10) NULL  DEFAULT 0 COMMENT '评论是否需要审核',
`get_prize_count`  int(10) NULL  DEFAULT 1 COMMENT '中奖次数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_activities','靓妆活动','0','','1','["title","remark","logo_img","start_time","end_time","get_prize_tip","no_prize_tip","lottery_number","get_prize_count","comment_status"]','1:基础','','','','','title:活动名称\r\nremark:活动描述\r\nlogo_img|get_img_html:活动LOGO\r\nactivitie_time:活动时间\r\nget_prize_tip:中将提示信息\r\nno_prize_tip:未中将提示信息\r\ncomment_list:评论列表\r\nset_vote:设置投票\r\nset_award:设置奖品\r\nget_prize_list:中奖列表\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','','','1435306468','1436181872','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(255) NULL','string','','','1','','0','1','1','1435306559','1435306559','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','活动描述','text NULL','textarea','','','1','','0','1','1','1435307454','1435307126','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('logo_img','活动LOGO','int(10) UNSIGNED NULL','picture','','','1','','0','1','1','1435307446','1435307174','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1435310820','1435307277','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','1','1','1435310830','1435307296','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('get_prize_tip','中奖提示信息','varchar(255) NULL','string','','','1','','0','1','1','1435307421','1435307411','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('no_prize_tip','未中奖提示信息','varchar(255) NULL','string','','','1','','0','1','1','1435307517','1435307517','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','活动创建时间','int(10) NULL','datetime','','','0','','0','0','1','1435307577','1435307577','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1435307671','1435307671','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('lottery_number','抽奖次数','int(10) NULL','num','1','每日允许用户抽奖的机会数，小于0 为无限次','1','','0','0','1','1436233580','1435585561','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('comment_status','评论是否需要审核','char(10) NULL','radio','0','','1','0:不审核\r\n1:审核','0','0','1','1436155693','1435665821','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('get_prize_count','中奖次数','int(10) NULL','num','1','每用户是否允许多次中奖','1','','0','0','1','1436181974','1436181850','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_activities_vote` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`lzwg_id`  int(10) NULL  COMMENT '活动编号',
`lzwg_type`  char(10) NULL  DEFAULT 0 COMMENT '活动类型',
`vote_id`  int(10) NULL  COMMENT '题目编号',
`vote_type`  char(10) NULL  DEFAULT 1 COMMENT '问题类型',
`vote_limit`  int(10) NULL  COMMENT '最多选择几项',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_activities_vote','投票答题活动','0','','1','["lzwg_id","vote_type","vote_limit","lzwg_type","vote_id"]','1:基础','','','','','lzwg_name:活动名称\r\nstart_time|time_format:活动开始时间\r\nend_time|time_format:活动结束时间\r\nlzwg_type|get_name_by_status:活动类型\r\nvote_title:题目\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,tongji&id=[id]|用户参与分析\r\n','20','lzwg_id:活动名称','','1435734819','1435825972','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('lzwg_id','活动编号','int(10) NULL','num','','','1','','0','0','1','1435734910','1435734886','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('lzwg_type','活动类型','char(10) NULL','radio','0','','1','0:投票\r\n1:调查','0','0','1','1435734977','1435734977','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_id','题目编号','int(10) NULL','num','','','1','','0','0','1','1435735047','1435735047','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_type','问题类型','char(10) NULL','radio','1','','1','0:单选\r\n1:多选','0','0','1','1435735092','1435735092','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_limit','最多选择几项','int(10) NULL','num','','','1','','0','0','1','1435735172','1435735172','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_coupon` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`intro`  varchar(255) NULL  COMMENT '优惠券简述',
`condition`  decimal(10,2) NULL  COMMENT '抵押条件',
`name`  varchar(255) NULL  COMMENT '代金券 标题',
`money`  decimal(10,2) NULL  COMMENT '减免金额',
`title`  varchar(100) NULL  COMMENT '名称',
`sn_str`  text NULL  COMMENT '序列号',
`img`  int(10) UNSIGNED NULL  COMMENT '优惠卷图标',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_coupon','优惠券','0','','1','["title","money","name","condition","intro","sn_str","img"]','1:基础','','','','','title:名称\r\nmoney:减免金额\r\nname:代金券标题\r\ncondition:抵押条件\r\nintro:优惠券简述\r\nsn_str:数量\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','','','1435312925','1435909008','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','优惠券简述','varchar(255) NULL','string','','','1','','0','0','1','1435313983','1435313983','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('condition','抵押条件','decimal(10,2) NULL','string','','元，选填，消费满多少元可以用。如不填写则默认：消费满任何金额可用','1','','0','0','1','1435313948','1435313948','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','代金券 标题','varchar(255) NULL','string','','建议填写代金券“减免金额”及自定义内容','1','','0','0','1','1435313827','1435313827','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','减免金额','decimal(10,2) NULL','string','','元，减免金额只能是大于0.01的数字','1','','0','0','1','1435314073','1435313637','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','名称','varchar(100) NULL','string','','','1','','0','0','1','1435312969','1435312969','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn_str','序列号','text NULL','textarea','','一个序列号占一行，请换行添加','1','','0','0','1','1435908243','1435908175','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','优惠卷图标','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1435737657','1435737657','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_coupon_receive` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`follow_id`  int(10) NULL  COMMENT '用户ID',
`coupon_id`  int(10) NULL  COMMENT '优惠券ID',
`sn_id`  varchar(100) NULL  COMMENT '序列号',
`cTime`  int(10) NULL  COMMENT '领取时间',
`aim_id`  int(10) NULL  COMMENT '活动编号',
`aim_table`  varchar(255) NULL  COMMENT '活动表名',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_coupon_receive','优惠券领取','0','','1','["sn_id"]','1:基础','','','','','follow_id|get_nickname|deal_emoji:领取人\r\ncTime|time_format:领取时间\r\ncoupon_title:优惠券名称\r\nsn:序列号\r\nis_use:是否使用','20','','','1435316411','1435925060','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','用户ID','int(10) NULL','num','','','0','','0','0','1','1435316437','1435316437','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','优惠券ID','int(10) NULL','num','','','0','','0','0','1','1435316480','1435316480','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn_id','序列号','varchar(100) NULL','num','','','0','','0','0','1','1435925094','1435316510','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','领取时间','int(10) NULL','datetime','','','0','','0','0','1','1435316533','1435316533','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','活动编号','int(10) NULL','num','','','0','','0','0','1','1435817782','1435817782','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_table','活动表名','varchar(255) NULL','string','','','0','','0','0','1','1435817823','1435817823','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_coupon_sn` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`coupon_id`  int(10) NULL  COMMENT '优惠券Id',
`sn`  varchar(255) NULL  COMMENT '优惠券sn',
`is_use`  int(10) NULL  DEFAULT 0 COMMENT '是否已领取',
`is_get`  int(10) NULL  DEFAULT 0 COMMENT '是否已经被领取',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_coupon_sn','优惠卷序列号','0','','1','','1:基础','','','','','','20','','','1435896982','1435896982','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','优惠券Id','int(10) NULL','num','','','1','','0','0','1','1435907420','1435907420','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn','优惠券sn','varchar(255) NULL','string','','','1','','0','0','1','1435907452','1435907452','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','是否已领取','int(10) NULL','num','0','','1','','0','0','1','1435907820','1435907495','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_get','是否已经被领取','int(10) NULL','num','0','','0','','0','0','1','1435925580','1435925619','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`lzwg_id`  int(10) NULL  COMMENT '活动ID',
`follow_id`  int(10) NULL  COMMENT '用户ID',
`count`  int(10) NULL  DEFAULT 0 COMMENT '参与次数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_log','活动参与记录','0','','1','','1:基础','','','','','','20','','','1435892409','1435892409','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('lzwg_id','活动ID','int(10) NULL','num','','','1','','0','0','1','1435892433','1435892433','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','用户ID','int(10) NULL','num','','','1','','0','0','1','1435892456','1435892456','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('count','参与次数','int(10) NULL','num','0','','1','','0','0','1','1435892489','1435892489','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_vote` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(50) NULL  COMMENT '关键词',
`title`  varchar(100) NULL  COMMENT '投票标题',
`description`  text NULL  COMMENT '投票描述',
`picurl`  int(10) unsigned NULL   COMMENT '封面图片',
`type`  char(10) NULL  DEFAULT 0 COMMENT '选择类型',
`start_date`  int(10) NULL  COMMENT '开始日期',
`end_date`  int(10) NULL  COMMENT '结束日期',
`is_img`  tinyint(2) NULL  DEFAULT 0 COMMENT '文字/图片投票',
`vote_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '投票数',
`cTime`  int(10) NULL  COMMENT '投票创建时间',
`mTime`  int(10) NULL  COMMENT '更新时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
`vote_type`  char(10) NULL  DEFAULT 0 COMMENT '题目类型',
`uid`  int(10) NULL  COMMENT 'uid',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_vote','投票','0','','1','["title","description","picurl","start_date","end_date","template","vote_type"]','1:基础','','','','','id:题目编号\r\ntitle:题目名称\r\nvote_option:题目选项\r\ntype|get_name_by_status:类型\r\nvote_count:投票数\r\nids:操作:[EDIT]&id=[id]|编辑,showLog&id=[id]|投票记录,showCount&id=[id]|选项票数,[DELETE]|删除','20','title','description','1388930292','1435732110','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(50) NULL','string','','用户在微信里回复此关键词将会触发此投票。','0','','0','0','1','1435719841','1388930888','keyword_unique','1','此关键词已经存在，请换成别的关键词再试试','function','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','投票标题','varchar(100) NULL','string','','','1','','0','1','1','1435717684','1388931041','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('description','投票描述','text NULL','textarea','','','1','','0','0','1','1400633517','1388931173','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('picurl','封面图片','int(10) unsigned NULL ','picture','','支持JPG、PNG格式，较好的效果为大图360*200，小图200*200','1','','0','0','1','1388931285','1388931285','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','选择类型','char(10) NULL','radio','0','','0','0:单选\r\n1:多选','0','1','1','1435717665','1388931487','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_date','开始日期','int(10) NULL','datetime','','','1','','0','0','1','1388931734','1388931734','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_date','结束日期','int(10) NULL','datetime','','','1','','0','0','1','1388931769','1388931769','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_img','文字/图片投票','tinyint(2) NULL','radio','0','','0','0:文字投票\r\n1:图片投票','0','1','1','1389081985','1388931941','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_count','投票数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1388932035','1388932035','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','投票创建时间','int(10) NULL','datetime','','','0','','0','1','1','1388932128','1388932128','','1','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','更新时间','int(10) NULL','datetime','','','0','','0','0','1','1430379170','1390634006','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1391397388','1391397388','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430188739','1430188739','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_type','题目类型','char(10) NULL','radio','0','','1','0:投票\r\n1:调查','0','0','1','1435722258','1435722258','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1435714410','1435714410','','3','','regex','get_mid','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_vote_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`vote_id`  int(10) unsigned NULL   COMMENT '投票ID',
`user_id`  int(10) NULL   COMMENT '用户ID',
`token`  varchar(255) NULL  COMMENT '用户TOKEN',
`options`  varchar(255) NULL  COMMENT '选择选项',
`cTime`  int(10) NULL  COMMENT '创建时间',
`activity_id`  int(10) NULL  COMMENT '活动编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_vote_log','投票记录','0','','1','["vote_id","user_id","options"]','1:基础','','','','','vote_id:25%投票标题\r\nuser_id:25%用户\r\noptions:25%投票选项\r\ncTime|time_format:25%创建时间\r\n\r\n\r\n\r\n','20','','','1388934136','1430101786','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_id','投票ID','int(10) unsigned NULL ','num','','','1','','0','1','1','1429846753','1388934189','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('user_id','用户ID','int(10) NULL ','num','','','1','','0','1','1','1429855665','1388934265','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','用户TOKEN','varchar(255) NULL','string','','','0','','0','1','1','1429855713','1388934296','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('options','选择选项','varchar(255) NULL','string','','','1','','0','1','1','1429855086','1388934351','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1429874378','1388934392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('activity_id','活动编号','int(10) NULL','num','','','1','','0','0','1','1435810329','1435810303','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_payment_order` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`from`  varchar(50) NOT NULL  COMMENT '回调地址',
`orderName`  varchar(255) NULL  COMMENT '订单名称',
`single_orderid`  varchar(100) NOT NULL  COMMENT '订单号',
`price`  decimal(10,2) NULL  COMMENT '价格',
`token`  varchar(100) NOT NULL  COMMENT 'Token',
`wecha_id`  varchar(200) NOT NULL  COMMENT 'OpenID',
`paytype`  varchar(30) NOT NULL  COMMENT '支付方式',
`showwxpaytitle`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '是否显示标题',
`status`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '支付状态',
`aim_id`  int(10) NULL  COMMENT 'aim_id',
`uid`  int(10) NULL  COMMENT '用户uid',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('payment_order','订单支付记录','0','','1','["from","orderName","single_orderid","price","token","wecha_id","paytype","showwxpaytitle","status"]','1:基础','','','','','wecha_id:10%用户\r\nsingle_orderid:22%订单号\r\norderName:27%订单名称\r\nprice:10%支付金额\r\nstatus|get_name_by_status:10%支付状态\r\npaytype:20%支付方式','20','single_orderid:输入订单号','','1420596259','1442914990','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('from','回调地址','varchar(50) NOT NULL','string','','','1','','0','0','1','1420596347','1420596347','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('orderName','订单名称','varchar(255) NULL','string','','','1','','0','0','1','1439976366','1420596373','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('single_orderid','订单号','varchar(100) NOT NULL','string','','','1','','0','0','1','1420596415','1420596415','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('price','价格','decimal(10,2) NULL','num','','','1','','0','0','1','1439812508','1420596472','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NOT NULL','string','','','1','','0','0','1','1420596492','1420596492','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wecha_id','OpenID','varchar(200) NOT NULL','string','','','1','','0','0','1','1420596530','1420596530','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('paytype','支付方式','varchar(30) NOT NULL','string','','','1','','0','0','1','1420596929','1420596929','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('showwxpaytitle','是否显示标题','tinyint(2) NOT NULL','bool','0','','1','0:不显示\r\n1:显示','0','0','1','1420596980','1420596980','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','支付状态','tinyint(2) NOT NULL','bool','0','','1','0:未支付\r\n1:已支付\r\n2:支付失败','0','0','1','1420597026','1420597026','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','aim_id','int(10) NULL','num','','','0','','0','0','1','1445253482','1445253482','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户uid','int(10) NULL','num','','','0','','0','0','1','1445255505','1445255505','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_payment_set` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`wxmchid`  varchar(255) NULL  COMMENT '微信支付商户号',
`shop_id`  int(10) NULL  DEFAULT 0 COMMENT '商店ID',
`quick_merid`  varchar(255) NULL  COMMENT '银联在线merid',
`quick_merabbr`  varchar(255) NULL  COMMENT '商户名称',
`wxpartnerid`  varchar(255) NULL  COMMENT '微信partnerid',
`wxpartnerkey`  varchar(255) NULL  COMMENT '微信partnerkey',
`partnerid`  varchar(255) NULL  COMMENT '财付通标识',
`key`  varchar(255) NULL  COMMENT 'KEY',
`ctime`  int(10) NULL  COMMENT '创建时间',
`quick_security_key`  varchar(255) NULL  COMMENT '银联在线Key',
`wappartnerkey`  varchar(255) NULL  COMMENT 'WAP财付通Key',
`wappartnerid`  varchar(255) NULL  COMMENT '财付通标识WAP',
`partnerkey`  varchar(255) NULL  COMMENT '财付通Key',
`pid`  varchar(255) NULL  COMMENT 'PID',
`zfbname`  varchar(255) NULL  COMMENT '帐号',
`wxappsecret`  varchar(255) NULL  COMMENT 'AppSecret',
`wxpaysignkey`  varchar(255) NULL  COMMENT '支付密钥',
`wxappid`  varchar(255) NULL  COMMENT 'AppID',
`token`  varchar(255) NULL  COMMENT 'token',
`wx_cert_pem`  int(10) UNSIGNED NULL  COMMENT '上传证书',
`wx_key_pem`  int(10) UNSIGNED NULL  COMMENT '上传密匙',
`shop_pay_score`  int(10) NULL  DEFAULT 0 COMMENT '支付返积分',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('payment_set','支付配置','0','','1','["wxappid","wxappsecret","wxpaysignkey","zfbname","pid","key","partnerid","partnerkey","wappartnerid","wappartnerkey","quick_security_key","quick_merid","quick_merabbr","wxmchid"]','1:基础','','','','','','10','','','1406958084','1439364636','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wxmchid','微信支付商户号','varchar(255) NULL','string','','','1','','0','1','1','1439364696','1436437067','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','商店ID','int(10) NULL','num','0','','0','','0','0','1','1436437020','1436437003','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('quick_merid','银联在线merid','varchar(255) NULL','string','','','1','','0','0','1','1436436949','1436436949','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('quick_merabbr','商户名称','varchar(255) NULL','string','','','1','','0','0','1','1436436970','1436436970','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wxpartnerid','微信partnerid','varchar(255) NULL','string','','','0','','0','0','1','1436437196','1436436910','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wxpartnerkey','微信partnerkey','varchar(255) NULL','string','','','0','','0','0','1','1436437236','1436436888','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('partnerid','财付通标识','varchar(255) NULL','string','','','1','','0','0','1','1436436798','1436436798','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('key','KEY','varchar(255) NULL','string','','','1','','0','0','1','1436436771','1436436771','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1436436498','1436436498','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('quick_security_key','银联在线Key','varchar(255) NULL','string','','','1','','0','0','1','1436436931','1436436931','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wappartnerkey','WAP财付通Key','varchar(255) NULL','string','','','1','','0','0','1','1436436863','1436436863','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wappartnerid','财付通标识WAP','varchar(255) NULL','string','','','1','','0','0','1','1436436834','1436436834','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('partnerkey','财付通Key','varchar(255) NULL','string','','','1','','0','0','1','1436436816','1436436816','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','PID','varchar(255) NULL','string','','','1','','0','0','1','1436436707','1436436707','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zfbname','帐号','varchar(255) NULL','string','','','1','','0','0','1','1436436653','1436436653','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wxappsecret','AppSecret','varchar(255) NULL','string','','微信支付中的公众号应用密钥','1','','0','1','1','1439364612','1436436618','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wxpaysignkey','支付密钥','varchar(255) NULL','string','','PartnerKey','1','','0','1','1','1439364810','1436436569','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wxappid','AppID','varchar(255) NULL','string','','微信支付中的公众号应用ID','1','','0','1','1','1439364573','1436436534','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1436436415','1436436415','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wx_cert_pem','上传证书','int(10) UNSIGNED NULL','file','','apiclient_cert.pem','1','','0','0','1','1439804529','1439550487','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wx_key_pem','上传密匙','int(10) UNSIGNED NULL','file','','apiclient_key.pem','1','','0','0','1','1439804544','1439804014','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_pay_score','支付返积分','int(10) NULL','num','0','不设置则默认为采用该支付方式不送积分','1','','0','0','1','1443065789','1443064056','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_prize` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`addon`  varchar(255) NULL  DEFAULT 'Scratch' COMMENT '来源插件',
`target_id`  int(10) unsigned NULL   COMMENT '来源ID',
`title`  varchar(255) NULL  COMMENT '奖项标题',
`name`  varchar(255) NULL  COMMENT '奖项',
`num`  int(10) unsigned NULL   COMMENT '名额数量',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`img`  int(10) unsigned NULL   COMMENT '奖品图片',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('prize','奖项设置','0','','1','["title","name","num","img","sort"]','1:基础','','','','','title:奖项标题\r\nname:奖项\r\nnum:名额数量\r\nimg|get_img_html:奖品图片\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1399348610','1399702991','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon','来源插件','varchar(255) NULL','string','Scratch','','0','','0','0','1','1399348676','1399348676','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('target_id','来源ID','int(10) unsigned NULL ','','','','1','','0','0','1','1420980352','1399348699','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','奖项标题','varchar(255) NULL','string','','如特等奖、一等奖。。。','1','','0','1','1','1439370111','1399348734','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','奖项','varchar(255) NULL','string','','如iphone、吹风机等','1','','0','1','1','1439370125','1399348785','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','名额数量','int(10) unsigned NULL ','num','','','1','','0','1','1','1439370137','1399348843','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','值越小越靠前','1','','0','0','1','1399557716','1399557716','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','奖品图片','int(10) unsigned NULL ','picture','','','1','','0','0','1','1399557997','1399557997','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1404525428','1404525428','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_prize_address` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`address`  varchar(255) NULL  COMMENT '奖品收货地址',
`mobile`  varchar(50) NULL  COMMENT '手机',
`turename`  varchar(255) NULL  COMMENT '收货人姓名',
`uid`  int(10) NULL  COMMENT '用户id',
`remark`  varchar(255) NULL  COMMENT '备注',
`prizeid`  int(10) NULL  COMMENT '奖品编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('prize_address','奖品收货地址','0','','1','["address","mobile","turename","remark","prizeid"]','1:基础','','','','','prizeid:奖品名称\r\nturename:收货人\r\nmobile:联系方式\r\naddress:收货地址\r\nremark:备注\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','','','1429521514','1429857224','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','奖品收货地址','varchar(255) NULL','textarea','','','1','','0','1','1','1429857152','1429521685','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mobile','手机','varchar(50) NULL','string','','','1','','0','1','1','1429521877','1429521877','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('turename','收货人姓名','varchar(255) NULL','string','','','1','','0','1','1','1429672245','1429521930','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','int(10) NULL','num','','','0','','0','0','1','1429673948','1429522086','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','varchar(255) NULL','string','','','1','','0','0','1','1429598446','1429598446','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prizeid','奖品编号','int(10) NULL','num','','','1','','0','1','1','1429607543','1429607543','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_real_prize` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`prize_name`  varchar(255) NULL  COMMENT '奖品名称',
`prize_conditions`  text NULL  COMMENT '活动说明',
`prize_count`  int(10) NULL  COMMENT '奖品个数',
`prize_image`  varchar(255) NULL  DEFAULT '上传奖品图片' COMMENT '奖品图片',
`token`  varchar(255) NULL  COMMENT 'token',
`fail_content`  text NULL  COMMENT '领取失败提示',
`prize_type`  tinyint(2) NULL  DEFAULT 1 COMMENT '奖品类型',
`use_content`  text NULL  COMMENT '使用说明',
`prize_title`  varchar(255) NULL  COMMENT '活动标题',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('real_prize','实物奖励','0','','1','["prize_title","prize_name","prize_conditions","prize_count","prize_image","prize_type","use_content","fail_content","template"]','1:基础','','','','','prize_name:20%奖品名称\r\nprize_conditions:20%活动说明\r\nprize_count:10%奖品个数\r\nprize_type|get_name_by_status:10%奖品类型\r\nuse_content:20%使用说明\r\nid:20%操作:[EDIT]|编辑,[DELETE]|删除,address_lists?target_id=[id]|查看数据,preview?id=[id]&target=_blank|预览','20','','','1429515376','1437452269','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_name','奖品名称','varchar(255) NULL','string','','','1','','0','1','1','1429515512','1429515512','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_conditions','活动说明','text NULL','textarea','','奖品说明','1','','0','1','1','1429756762','1429516052','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_count','奖品个数','int(10) NULL','num','','','1','','0','1','1','1429779465','1429516109','/^[0-9]*$/','3','奖品个数不能小于0','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_image','奖品图片','varchar(255) NULL','picture','上传奖品图片','','1','','0','1','1','1429756675','1429516329','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1429521039','1429521039','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('fail_content','领取失败提示','text NULL','textarea','','用户领取失败，或者没有领取到时看到的提示','1','','0','1','1','1429860149','1429860149','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_type','奖品类型','tinyint(2) NULL','radio','1','选择奖品类型','1','1:实物\r\n0:虚拟','0','1','1','1429756998','1429756539','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_content','使用说明','text NULL','textarea','','用户领取成功后才会看到','1','','0','1','1','1429757185','1429757185','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_title','活动标题','varchar(255) NULL','string','','','1','','0','1','1','1429855569','1429855569','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430132994','1430132994','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_redbag` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(50) NULL  COMMENT 'token',
`uid`  int(10) NULL  COMMENT 'uid',
`mch_id`  varchar(32) NULL  COMMENT '商户号',
`sub_mch_id`  varchar(32) NULL  COMMENT '子商户号',
`wxappid`  varchar(32) NULL  COMMENT '公众账号appid',
`nick_name`  varchar(32) NULL  COMMENT '提供方名称',
`send_name`  varchar(32) NULL  COMMENT '商户名称',
`total_amount`  int(10) NULL  DEFAULT 1000 COMMENT '付款金额',
`min_value`  int(10) NULL  DEFAULT 1000 COMMENT '最小红包金额',
`max_value`  int(10) NULL  DEFAULT 1000 COMMENT '最大红包金额',
`total_num`  int(10) NULL  DEFAULT 1 COMMENT '红包发放总人数',
`wishing`  varchar(255) NULL  COMMENT '红包祝福语',
`act_name`  varchar(255) NULL  COMMENT '活动名称',
`remark`  varchar(255) NULL  COMMENT '备注',
`logo_imgurl`  int(10) UNSIGNED NULL  COMMENT '商户logo的url',
`share_content`  varchar(255) NULL  COMMENT '分享文案',
`share_url`  varchar(255) NULL  COMMENT '分享链接',
`share_imgurl`  int(10) UNSIGNED NULL  COMMENT '分享的图片',
`collect_count`  int(10) NULL  DEFAULT 0 COMMENT '领取人数',
`collect_amount`  int(10) NULL  DEFAULT 0 COMMENT '已领取金额',
`collect_limit`  tinyint(2) NULL  DEFAULT 0 COMMENT '每人最多领取次数',
`partner_key`  varchar(50) NULL  COMMENT '商户API密钥',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
`act_remark`  varchar(255) NULL  COMMENT '活动备注',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('redbag','微信红包','0','','1','["mch_id","wxappid","nick_name","send_name","total_amount","min_value","max_value","total_num","wishing","act_name","remark","collect_limit","partner_key","token","uid","template","act_remark"]','1:基础','','','','','act_name:活动名称\r\nsend_name:商户名称\r\ntotal_amount:付款金额\r\nmin_value:最小红包\r\nmax_value:最大红包\r\ntotal_num:发放人数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,preview?id=[id]&target=_blank|预览,lists?_controller=Follow&redbag_id=[id]|发放用户','20','act_name:活动名称','','1427701701','1443077124','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(50) NULL','string','','','1','','0','0','1','1430999098','1430999079','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','1','','0','0','1','1430999121','1430999121','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mch_id','商户号','varchar(32) NULL','string','','微信支付分配的商户号','1','','0','1','1','1427702346','1427702346','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sub_mch_id','子商户号','varchar(32) NULL','string','','可为空，微信支付分配的子商户号，受理模式下必填','0','','0','0','1','1427785321','1427702397','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wxappid','公众账号appid','varchar(32) NULL','string','','商户appid','1','','0','1','1','1427702433','1427702433','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('nick_name','提供方名称','varchar(32) NULL','string','','','1','','0','1','1','1427702473','1427702473','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_name','商户名称','varchar(32) NULL','string','','红包发送者名称','1','','0','1','1','1427702505','1427702505','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('total_amount','付款金额','int(10) NULL','num','1000','付款金额，单位分','1','','0','1','1','1427702603','1427702603','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('min_value','最小红包金额','int(10) NULL','num','1000','最小红包金额，单位分','1','','0','1','1','1427702653','1427702653','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('max_value','最大红包金额','int(10) NULL','num','1000','最大红包金额，单位分','1','','0','1','1','1427702703','1427702703','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('total_num','红包发放总人数','int(10) NULL','num','1','','1','','0','1','1','1427702757','1427702757','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wishing','红包祝福语','varchar(255) NULL','string','','如：感谢您参加猜灯谜活动，祝您元宵节快乐！','1','','0','1','1','1427702843','1427702843','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('act_name','活动名称','varchar(255) NULL','string','','如：猜灯谜抢红包活动','1','','0','1','1','1427702920','1427702920','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','varchar(255) NULL','string','','如：猜越多得越多，快来抢！','1','','0','1','1','1427703037','1427703011','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('logo_imgurl','商户logo的url','int(10) UNSIGNED NULL','picture','','','0','','0','0','1','1427785307','1427703083','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('share_content','分享文案','varchar(255) NULL','string','','如：快来参加猜灯谜活动','0','','0','0','1','1427785298','1427703125','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('share_url','分享链接','varchar(255) NULL','string','','','0','','0','0','1','1427785292','1427703167','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('share_imgurl','分享的图片','int(10) UNSIGNED NULL','picture','','','0','','0','0','1','1427785285','1427703301','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_count','领取人数','int(10) NULL','num','0','','0','','0','0','1','1427785218','1427785211','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_amount','已领取金额','int(10) NULL','num','0','单位为分','0','','0','0','1','1427785274','1427785262','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_limit','每人最多领取次数','tinyint(2) NULL','num','0','0 表示不限制','1','','0','0','1','1427786937','1427786937','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('partner_key','商户API密钥','varchar(50) NULL','string','','用户生成支付签名','1','','0','0','1','1427850414','1427850414','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430132068','1430132068','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('act_remark','活动备注','varchar(255) NULL','string','','','1','','0','0','1','1440488802','1440488802','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_redbag_follow` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`redbag_id`  int(10) NULL  COMMENT '红包ID',
`follow_id`  int(10) NULL  COMMENT '粉丝ID',
`amount`  int(10) NULL  DEFAULT 0 COMMENT '领取金额',
`cTime`  int(10) NULL  COMMENT '发放时间',
`status`  char(10) NULL  DEFAULT 'SENDING' COMMENT '发放状态',
`reason`  varchar(50) NULL  COMMENT '失败原因 ',
`Rcv_time`  int(10) NULL  COMMENT '领取红包的时间 ',
`Send_time`  int(10) NULL  COMMENT '红包发送时间 ',
`Refund_time`  int(10) NULL  COMMENT '红包退款时间',
`extra`  text NULL  COMMENT '微信返回的数据集',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('redbag_follow','领取红包的用户','0','','1','["redbag_id","follow_id","amount","cTime"]','1:基础','','','','','follow_id|get_follow_name:粉丝\r\namount:领取金额（分）\r\ncTime|time_format:领取时间','20','','','1427703365','1427703721','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('redbag_id','红包ID','int(10) NULL','num','','','1','','0','0','1','1427703408','1427703408','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','粉丝ID','int(10) NULL','num','','','1','','0','0','1','1427703457','1427703457','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('amount','领取金额','int(10) NULL','num','0','单位为分','1','','0','0','1','1427703546','1427703546','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发放时间','int(10) NULL','num','','','1','','0','0','1','1443077352','1427703593','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','发放状态','char(10) NULL','radio','SENDING','','1','SENDING:发放中\r\nSENT:已发放待领取\r\nFAILED：发放失败\r\nRECEIVED:已领取\r\nREFUND:已退款 ','0','0','1','1443077224','1443077224','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reason','失败原因 ','varchar(50) NULL','string','','','0','','0','0','1','1443077304','1443077304','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Rcv_time','领取红包的时间 ','int(10) NULL','datetime','','','0','','0','0','1','1443077415','1443077415','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Send_time','红包发送时间 ','int(10) NULL','datetime','','','0','','0','0','1','1443077446','1443077446','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Refund_time','红包退款时间','int(10) NULL','datetime','','','0','','0','0','1','1443077472','1443077472','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra','微信返回的数据集','text NULL','textarea','','','0','','0','0','1','1443077530','1443077530','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_reservation` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`reservation_date`  int(10) NULL  COMMENT '日期',
`morning_count`  char(50) NULL  DEFAULT 30 COMMENT '上午放号数',
`afternoon_count`  char(50) NULL  DEFAULT 30 COMMENT '下午放号数',
`c_time`  int(10) NULL  COMMENT '创建日期',
`manager_id`  int(10) NULL  DEFAULT 0 COMMENT '管理员ID',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('reservation','每天放号','0','','1','["reservation_date","morning_count","afternoon_count"]','1:基础','','','','','reservation_date|day_format:30%日期\r\nmorning_count:15%上午放号数\r\nafternoon_count:15%下午放号数\r\nids:40%操作:lists?reservation_id=[id]&_controller=ReservationNumber&_addons=Reservation|查看预约情况,[DELETE]|删除','20','','','1436236287','1436255291','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reservation_date','日期','int(10) NULL','date','','','1','','0','1','1','1436236546','1436236546','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('morning_count','上午放号数','char(50) NULL','select','30','','1','30:30\r\n31:31\r\n32:32\r\n33:33\r\n34:34\r\n35:35\r\n36:36\r\n37:37\r\n38:38\r\n39:39\r\n40:40\r\n41:41\r\n42:42\r\n43:43\r\n44:44\r\n45:45\r\n46:46\r\n47:47\r\n48:48\r\n49:49\r\n50:50\r\n51:51\r\n52:52\r\n53:53\r\n54:54\r\n55:55\r\n56:56\r\n57:57\r\n58:58\r\n59:59\r\n60:60','0','0','1','1436249878','1436236781','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('afternoon_count','下午放号数','char(50) NULL','select','30','','1','30:30\r\n31:31\r\n32:32\r\n33:33\r\n34:34\r\n35:35\r\n36:36\r\n37:37\r\n38:38\r\n39:39\r\n40:40\r\n41:41\r\n42:42\r\n43:43\r\n44:44\r\n45:45\r\n46:46\r\n47:47\r\n48:48\r\n49:49\r\n50:50\r\n51:51\r\n52:52\r\n53:53\r\n54:54\r\n55:55\r\n56:56\r\n57:57\r\n58:58\r\n59:59\r\n60:60','0','0','1','1436249892','1436236849','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('c_time','创建日期','int(10) NULL','date','','','0','','0','0','1','1436236906','1436236906','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','0','','0','','0','0','1','1436251279','1436251263','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1436251320','1436251320','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_reservation_number` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`reservation_id`  int(10) NULL  COMMENT '日期ID',
`use_time`  int(10) NULL  COMMENT '提交预约的时间',
`desc`  text NULL  COMMENT '病症描述',
`name`  varchar(255) NULL  COMMENT '姓名',
`phone`  varchar(255) NULL  COMMENT '手机号',
`is_use`  int(10) NULL  DEFAULT 0 COMMENT '是否预约',
`type`  int(10) NULL  COMMENT '上午/下午',
`reservation_date`  int(10) NULL  COMMENT '预约日期',
`reservation_num`  varchar(255) NULL  COMMENT '预约号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('reservation_number','预约号','0','','1','["reservation_date","type","is_use","phone","name","desc","use_time"]','1:基础','','','','','type|get_name_by_status:10%上午/下午\r\nreservation_num:15%预约号\r\nis_use|get_name_by_status:10%是否预约\r\nname:11%姓名\r\nphone:12%手机号\r\ndesc:20%病症描述\r\nuse_time:12%提交预约时间\r\nids:10%操作:[EDIT]|编辑,[DELETE]|删除','20','','','1436237723','1436256435','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reservation_id','日期ID','int(10) NULL','num','','','0','','0','0','1','1436251378','1436251378','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_time','提交预约的时间','int(10) NULL','datetime','','','0','','0','0','1','1436256904','1436238953','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('desc','病症描述','text NULL','textarea','','','1','','0','0','1','1436238865','1436238865','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','姓名','varchar(255) NULL','string','','','1','','0','0','1','1436238841','1436238841','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('phone','手机号','varchar(255) NULL','string','','','1','','0','0','1','1436254005','1436238816','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','是否预约','int(10) NULL','radio','0','','1','0:未预约\r\n1:已预约','0','0','1','1436256933','1436238780','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','上午/下午','int(10) NULL','radio','','','1','0:上午\r\n1:下午','0','0','1','1436256997','1436238743','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reservation_date','预约日期','int(10) NULL','date','','','0','','0','0','1','1436258926','1436238697','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reservation_num','预约号','varchar(255) NULL','string','','','0','','0','0','1','1436256148','1436253089','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_scratch` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`use_tips`  varchar(255) NOT NULL  COMMENT '使用说明',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '封面简介',
`end_time`  int(10) NULL  COMMENT '结束时间',
`cover`  int(10) unsigned NULL   COMMENT '封面图片',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_tips`  text NULL  COMMENT '过期说明',
`end_img`  int(10) unsigned NULL   COMMENT '过期提示图片',
`predict_num`  int(10) unsigned NOT NULL   COMMENT '预计参与人数',
`max_num`  int(10) unsigned NULL   DEFAULT 1 COMMENT '每人最多允许抽奖次数',
`follower_condtion`  char(50) NULL  DEFAULT 1 COMMENT '粉丝状态',
`credit_conditon`  int(10) unsigned NULL   DEFAULT 0 COMMENT '积分限制',
`credit_bug`  int(10) unsigned NULL   DEFAULT 0 COMMENT '积分消费',
`addon_condition`  varchar(255) NULL  COMMENT '插件场景限制',
`collect_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '已领取人数',
`view_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '浏览人数',
`update_time`  int(10) NULL  COMMENT '更新时间',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('scratch','刮刮卡','0','','1','["keyword","title","intro","cover","use_tips","start_time","end_time","end_tips","end_img","predict_num","max_num","follower_condtion","credit_conditon","credit_bug","addon_condition","collect_count","view_count","template"]','1:基础','','','','','id:刮刮卡ID\r\nkeyword:关键词\r\ntitle:标题\r\ncollect_count:获取人数\r\ncTime|time_format:发布时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|中奖管理,lists?target_id=[id]&target=_blank&_controller=Prize|奖品管理,preview?id=[id]&target=_blank|预览','20','title','','1396061373','1437035669','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396624337','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_tips','使用说明','varchar(255) NOT NULL','textarea','','用户获取刮刮卡后显示的提示信息','1','','0','1','1','1420989679','1399259489','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NULL','editor','','','1','','0','0','1','1420983308','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','0','1','1399259433','1399259433','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) unsigned NULL ','picture','','可为空','1','','0','0','1','1399710705','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','0','1','1399259416','1399259416','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_tips','过期说明','text NULL','textarea','','活动过期或者结束说明','1','','0','0','1','1399259570','1399259570','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_img','过期提示图片','int(10) unsigned NULL ','picture','','可为空','1','','0','0','1','1399712676','1399711987','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('predict_num','预计参与人数','int(10) unsigned NOT NULL ','num','','预计人数直接影响抽奖概率：中奖概率 = 奖品总数/(预估活动人数*每人抽奖次数) 要确保100%中奖可设置为1','1','','0','1','1','1399710446','1399259992','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('max_num','每人最多允许抽奖次数','int(10) unsigned NULL ','num','1','0表示不限制数量','1','','0','0','1','1399260079','1399260079','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follower_condtion','粉丝状态','char(50) NULL','select','1','粉丝达到设置的状态才能获取','1','0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员','0','0','1','1399260479','1399260479','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_conditon','积分限制','int(10) unsigned NULL ','num','0','粉丝达到多少积分后才能领取，领取后不扣积分','1','','0','0','1','1399260618','1399260618','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_bug','积分消费','int(10) unsigned NULL ','num','0','用积分中的财富兑换、兑换后扣除相应的积分财富','1','','0','0','1','1399260764','1399260764','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_condition','插件场景限制','varchar(255) NULL','string','','格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示','1','','0','0','1','1399274022','1399261026','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_count','已领取人数','int(10) unsigned NULL ','num','0','','1','','0','0','1','1420980201','1399270900','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','浏览人数','int(10) unsigned NULL ','num','0','','1','','0','0','1','1420980183','1399270926','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('update_time','更新时间','int(10) NULL','datetime','','','0','','0','0','1','1399562468','1399359204','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430201266','1430201266','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '商店名称',
`logo`  int(10) NULL  COMMENT '商店LOGO',
`intro`  text NULL  COMMENT '店铺简介',
`mobile`  varchar(30) NULL  COMMENT '联系电话',
`qq`  int(10) NULL  COMMENT 'QQ',
`wechat`  varchar(50) NULL  COMMENT '微信',
`template`  varchar(30) NULL  COMMENT '模板',
`content`  text  NULL  COMMENT '店铺介绍',
`token`  varchar(100) NULL  COMMENT 'Token',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`api_key`  varchar(100) NULL  COMMENT '快递接口的APPKEY',
`parent_shop`  varchar(255) NULL  COMMENT '分销上级商店',
`address`  varchar(255) NULL  COMMENT '详细地址',
`gps`  varchar(55) NULL  COMMENT 'GPS经纬度',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop','微商城','0','','1','["title","logo","intro","mobile","qq","wechat","api_key","content"]','1:基础','','','','','title:商店名称\r\nlogo|get_img_html:商店LOGO\r\nmobile:联系电话\r\nqq:QQ号\r\nwechat:微信号\r\nids:操作:[EDIT]&id=[id]|编辑,lists&_controller=Category&target=_blank&shop_id=[id]|商品分类,lists&_controller=Slideshow&target=_blank&shop_id=[id]|幻灯片,lists&_controller=Goods&target=_blank&shop_id=[id]|商品管理,lists&_controller=Order&target=_blank&shop_id=[id]|订单管理,lists&_addons=Payment&_controller=Payment&target=_blank&shop_id=[id]|支付配置,lists&_controller=Template&target=_blank&shop_id=[id]|模板选择,[DELETE]|删除,index&_controller=Wap&target=_blank&shop_id=[id]|预览','20','title:请输入商店名称','','1422670956','1440558983','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','商店名称','varchar(255) NOT NULL','string','','','1','','0','1','1','1422671603','1422671261','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('logo','商店LOGO','int(10) NULL','picture','','','1','','0','0','1','1422950521','1422671295','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','店铺简介','text NULL','textarea','','','1','','0','0','1','1422671570','1422671345','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mobile','联系电话','varchar(30) NULL','string','','','1','','0','0','1','1422671410','1422671410','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('qq','QQ','int(10) NULL','num','','','1','','0','0','1','1422671498','1422671498','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat','微信','varchar(50) NULL','string','','','1','','0','0','1','1422671544','1422671544','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','模板','varchar(30) NULL','string','','','0','','0','0','1','1422950165','1422950165','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','店铺介绍','text  NULL','editor','','','1','','0','0','1','1423108654','1423108654','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1439456512','1439455806','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1439456496','1439455828','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('api_key','快递接口的APPKEY','varchar(100) NULL','string','','申请地址：http://www.juhe.cn/docs/api/id/43','1','','0','0','1','1449642784','1440558965','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('parent_shop','分销上级商店','varchar(255) NULL','string','','','0','','0','0','1','1441937801','1441620588','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','详细地址','varchar(255) NULL','string','','（请点击地图，然后拖动图标到你的位置上）','1','','0','1','1','1444617207','1444616843','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gps','GPS经纬度','varchar(55) NULL','string','','（请点击地图，然后拖动图标到你的位置上）','1','','0','0','1','1444617275','1444616886','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_address` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户ID',
`truename`  varchar(100) NULL  COMMENT '收货人姓名',
`mobile`  varchar(50) NULL  COMMENT '手机号码',
`city`  varchar(255) NULL  COMMENT '城市',
`address`  varchar(255) NULL  COMMENT '具体地址',
`is_use`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否设置为默认',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_address','收货地址','0','','1','','1:基础','','','','','','20','','','1423477477','1423477477','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','1','1','1429522999','1423477509','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('truename','收货人姓名','varchar(100) NULL','string','','','1','','0','1','1','1423477690','1423477548','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mobile','手机号码','varchar(50) NULL','string','','','1','','0','1','1','1423477580','1423477580','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('city','城市','varchar(255) NULL','cascade','','','1','module=city','0','1','1','1423477660','1423477660','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','具体地址','varchar(255) NULL','string','','','1','','0','1','1','1423477681','1423477681','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','是否设置为默认','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1423536697','1423477729','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_cart` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) UNSIGNED NOT NULL  COMMENT '用户ID',
`shop_id`  varchar(255) NOT NULL  COMMENT '商店id',
`goods_id`  varchar(255) NOT NULL  COMMENT '商品id',
`num`  int(10) UNSIGNED NULL  COMMENT '数量',
`price`  varchar(30) NULL  COMMENT '单价',
`goods_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '商品类型',
`openid`  varchar(255) NULL  COMMENT 'openid',
`spec_option_ids`  varchar(50) NULL  COMMENT '商品SKU',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_cart','购物车','0','','1','','1:基础','','','','','','20','','','1419577864','1419577864','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) UNSIGNED NOT NULL','num','','','0','','0','0','1','1419577913','1419577913','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','商店id','varchar(255) NOT NULL','string','','','0','','0','0','1','1419578098','1419577949','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品id','varchar(255) NOT NULL','string','','','0','','0','0','1','1419578025','1419578025','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','数量','int(10) UNSIGNED NULL','num','','','1','','0','0','1','1442375501','1419578075','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('price','单价','varchar(30) NULL','num','','','0','','0','0','1','1442375464','1419578154','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_type','商品类型','tinyint(2) NULL','bool','0','','1','','0','0','1','1442375477','1420551825','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','openid','varchar(255) NULL','string','','','0','','0','0','1','1442375487','1420195356','','3','','regex','get_openid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('spec_option_ids','商品SKU','varchar(50) NULL','string','','','0','','0','0','1','1442630926','1442630926','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_collect` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '使用UID',
`goods_id`  int(10) NULL  COMMENT '商品ID',
`cTime`  int(10) NULL  COMMENT '收藏时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_collect','商品收藏','0','','1','','1:基础','','','','','','20','','','1423471275','1423471275','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','使用UID','int(10) NULL','num','','','0','','0','0','1','1423471296','1423471296','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品ID','int(10) NULL','num','','','0','','0','0','1','1423471321','1423471321','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','收藏时间','int(10) NULL','datetime','','','0','','0','0','1','1423471348','1423471348','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_goods` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cover`  int(10) UNSIGNED NULL  COMMENT '商品封面图',
`content`  text NULL  COMMENT '商品介绍',
`title`  varchar(255) NOT NULL  COMMENT '商品名称',
`market_price`  decimal(10,2) NULL  DEFAULT 0 COMMENT '市场价',
`imgs`  varchar(255) NULL  COMMENT '商品图片',
`stock_num`  int(10) NULL  DEFAULT 0 COMMENT '库存数量',
`shop_id`  int(10) NULL  DEFAULT 0 COMMENT '商店ID',
`is_show`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否上架',
`sale_count`  int(10) NULL  DEFAULT 0 COMMENT '销售量',
`is_recommend`  tinyint(2) NULL  COMMENT '是否推荐',
`rank`  int(10) NULL  DEFAULT 0 COMMENT '热销度',
`show_time`  int(10) NULL  DEFAULT 0 COMMENT '上架时间',
`cost_price`  decimal(10,2) NULL  DEFAULT 0 COMMENT '成本价',
`type`  tinyint(2) NULL  DEFAULT 0 COMMENT '商品类型',
`category_id`  char(50) NULL  COMMENT '商品分类',
`auto_send`  char(10) NULL  DEFAULT 0 COMMENT '自动发货',
`virtual_textarea`  text NULL  COMMENT '虚拟物品信息',
`token`  varchar(255) NULL  COMMENT 'token',
`sale_price`  int(10) NULL  COMMENT '促销价',
`weight`  int(10) NULL  COMMENT '重量',
`sn_code`  varchar(255) NULL  COMMENT '商品编号',
`extra_int_1`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_0`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_2`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_3`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_4`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_5`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_6`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_7`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_8`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_9`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_10`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_11`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_12`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_13`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_14`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_15`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_16`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_17`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_18`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_int_19`  int(10) NULL  DEFAULT 0 COMMENT '扩展数字字段',
`extra_varchar_20`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_0`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_1`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_2`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_3`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_4`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_5`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_6`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_7`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_8`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_9`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_10`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_11`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_12`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_13`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_14`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_15`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_16`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_17`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_18`  varchar(255) NULL  COMMENT '扩展文本字段',
`extra_varchar_19`  varchar(255) NULL  COMMENT '扩展文本字段',
`diy_id`  int(10) NULL  DEFAULT 0 COMMENT '详情页面DidId',
`is_delete`  int(10) NULL  DEFAULT 0 COMMENT '是否删除',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_goods','商品列表','0','','1','["title","category_id","imgs","content","cover","type","is_recommend","auto_send","virtual_textarea","is_show","market_price","stock_num","cost_price","sale_price","weight","sn_code"]','1:基础','','','','','cover|get_img_html:封面图\r\ntitle:商品名称\r\nmarket_price:价格\r\nstock_num:库存量\r\nsale_count:销售量\r\nis_show|get_name_by_status:是否上架\r\nids:操作:set_show?id=[id]&is_show=[is_show]|改变上架状态,[EDIT]|编辑,[DELETE]|删除','20','title:请输入商品名称','','1422672084','1442479519','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','商品封面图','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1431071756','1422672306','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','商品介绍','text NULL','editor','','','1','','0','0','1','1442288877','1422672255','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','商品名称','varchar(255) NOT NULL','string','','','1','','0','1','1','1422672113','1422672113','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('market_price','市场价','decimal(10,2) NULL','num','0','','1','','0','1','1','1442326615','1422672186','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('imgs','商品图片','varchar(255) NULL','mult_picture','','可以上传多个图片,可以拖曳改变顺序，第一张图为商品封面','1','','0','1','1','1442327212','1422672449','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('stock_num','库存数量','int(10) NULL','num','0','','1','','0','0','1','1442322062','1422672560','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','商店ID','int(10) NULL','num','0','','4','','0','0','1','1422934861','1422931951','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否上架','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1422935533','1422935533','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sale_count','销售量','int(10) NULL','num','0','','0','','0','0','1','1422935712','1422935600','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_recommend','是否推荐','tinyint(2) NULL','bool','','推荐后首页的推荐商品里显示','1','0:否\r\n1:是','0','0','1','1423107236','1423107213','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('rank','热销度','int(10) NULL','num','0','热销度由发布时间、推荐状态、销量三个维度进行计算得到','0','','0','0','1','1423474955','1423126715','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('show_time','上架时间','int(10) NULL','datetime','0','','0','','0','0','1','1423127849','1423127833','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cost_price','成本价','decimal(10,2) NULL','num','0','','1','','0','1','1','1442326633','1423132272','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','商品类型','tinyint(2) NULL','bool','0','注：虚拟商品不支持货到付款','1','0:实物商品（需要快递）|weight@show\r\n1:虚拟商品（不需要快递）|weight@hide','0','0','1','1442324211','1439458735','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('category_id','商品分类','char(50) NULL','cascade','','','1','type=db&table=shop_goods_category','0','0','1','1442824418','1440066901','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('auto_send','自动发货','char(10) NULL','radio','0','自动发货在用户下单成功时会自动发送虚拟物品的信息','1','0:人工发货|inventory@show,virtual_textarea@hide\r\n1:自动发货|inventory@hide,virtual_textarea@show','0','0','1','1441008893','1440753768','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('virtual_textarea','虚拟物品信息','text NULL','textarea','','每行一条信息 卡密用“|”号分开，如：weiphp@weiphp.cn|123456  ','1','','0','0','1','1441006652','1441006557','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1441621773','1441621764','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sale_price','促销价','int(10) NULL','num','','','1','','0','1','1','1442326650','1441971805','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('weight','重量','int(10) NULL','num','','单位为KG','1','','0','0','1','1441971881','1441971881','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn_code','商品编号','varchar(255) NULL','string','','','1','','0','0','1','1442322078','1441976829','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_1','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_0','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_2','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_3','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_4','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_5','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_6','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_7','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_8','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_9','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_10','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_11','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_12','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_13','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_14','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_15','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_16','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_17','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_18','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_int_19','扩展数字字段','int(10) NULL','num','0','','0','','0','0','1','1442198844','1442198844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_20','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442200574','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_0','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594465','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_1','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594457','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_2','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594448','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_3','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594439','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_4','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594430','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_5','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594509','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_6','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594421','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_7','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594412','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_8','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594403','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_9','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594394','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_10','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594386','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_11','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594369','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_12','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594360','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_13','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594351','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_14','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594343','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_15','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594499','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_16','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594333','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_17','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594323','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_18','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594313','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra_varchar_19','扩展文本字段','varchar(255) NULL','string','','','0','','0','0','1','1442594282','1442200574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('diy_id','详情页面DidId','int(10) NULL','num','0','','0','','0','0','1','1442800697','1442800218','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_delete','是否删除','int(10) NULL','num','0','','1','','0','0','1','1442830457','1442830457','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_goods_category` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '分类标题',
`icon`  int(10) unsigned NULL   COMMENT '分类图标',
`pid`  int(10) unsigned NULL  DEFAULT 0 COMMENT '上一级分类',
`path`  varchar(255) NULL  COMMENT '分类路径',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否显示',
`shop_id`  int(10) NOT NULL  DEFAULT 0 COMMENT '商店ID',
`is_recommend`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否推荐',
`token`  varchar(100) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_goods_category','商品分类','0','','1','["pid","title","icon","sort","is_recommend","is_show"]','1:基础','','','','','title:30%分组\r\nicon|get_img_html:20%图标\r\nsort:10%排序号\r\nis_show|get_name_by_status:20%显示\r\nids:20%操作:lists?cate_id=[id]&_controller=Attribute|商品属性配置,[EDIT]|编辑,[DELETE]|删除','20','title','','1397529095','1442373193','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','分类标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1397529407','1397529407','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon','分类图标','int(10) unsigned NULL ','picture','','建议上传100X100的正方形图片','1','','0','0','1','1431072029','1397529461','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','上一级分类','int(10) unsigned NULL','select','0','如果你要增加一级分类，这里选择“无”即可，最多支持三级分类','1','','0','0','1','1442374133','1397529555','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('path','分类路径','varchar(255) NULL','string','','','0','','0','0','1','1397529604','1397529604','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','数值越小越靠前','1','','0','0','1','1397529705','1397529705','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','tinyint(2) NULL','bool','1','','1','0:不显示\r\n1:显示','0','0','1','1397532496','1397529809','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','商店ID','int(10) NOT NULL','num','0','','4','','0','0','1','1422934193','1422672025','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_recommend','是否推荐','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1423106432','1423106432','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1441528001','1441528001','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_goods_score` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户ID',
`goods_id`  int(10) NULL  COMMENT '商品ID',
`score`  int(10) NULL  DEFAULT 0 COMMENT '得分',
`cTime`  int(10) NULL  COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_goods_score','商品评分记录','0','','1','','1:基础','','','','','','20','','','1422930901','1422930901','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1422931055','1422930936','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品ID','int(10) NULL','num','','','0','','0','0','1','1422930970','1422930970','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','得分','int(10) NULL','num','0','','0','','0','0','1','1422931004','1422931004','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1422931044','1422931044','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_order` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`goods_datas`  text NOT NULL  COMMENT '商品序列化数据',
`uid`  int(10) UNSIGNED NOT NULL  COMMENT '用户id',
`remark`  text NOT NULL  COMMENT '备注',
`order_number`  varchar(255) NOT NULL  COMMENT '订单编号',
`cTime`  int(10) NOT NULL  COMMENT '订单时间',
`total_price`  decimal(10,2) NULL  COMMENT '总价',
`openid`  varchar(255) NOT NULL  COMMENT 'OpenID',
`pay_status`  int(10)  NULL  COMMENT '支付状态',
`pay_type`  int(10) NULL  COMMENT '支付类型',
`address_id`  int(10) NULL  COMMENT '配送信息',
`is_send`  int(10) NULL  DEFAULT 0 COMMENT '是否发货',
`send_code`  varchar(255) NULL  COMMENT '快递公司编号',
`send_number`  varchar(255) NULL  COMMENT '快递单号',
`send_type`  char(10) NULL  COMMENT '发货类型',
`is_new`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否为新订单',
`shop_id`  int(10) NULL  DEFAULT 0 COMMENT '商店编号',
`status_code`  char(50) NULL  DEFAULT 0 COMMENT '订单跟踪状态码',
`order_from_type`  int(10) NULL  DEFAULT 0 COMMENT '订单来源',
`token`  varchar(255) NULL  COMMENT 'token',
`manager_id`  int(10) NULL  COMMENT '管理员id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_order','订单记录','0','','1','["uid","goods_datas","remark","order_number","cTime","total_price","address_id","is_send","send_code","send_number","send_type","shop_id"]','1:基础','','','','','order_number:15%订单编号\r\ngoods:20%下单商品\r\nuid:10%客户\r\ntotal_price:7%总价\r\ncTime|time_format:17%下单时间\r\ncommon|get_name_by_status:10%支付类型\r\nstatus_code|get_name_by_status:10%订单跟踪\r\naction:11%操作','20','order_number:请输入订单编号 或 客户昵称','','1420269240','1440147136','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_datas','商品序列化数据','text NOT NULL','textarea','','','1','','0','0','1','1423534050','1420269321','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','int(10) UNSIGNED NOT NULL','num','','','1','','0','0','1','1420269348','1420269348','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','text NOT NULL','textarea','','','1','','0','0','1','1423534071','1420269399','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_number','订单编号','varchar(255) NOT NULL','string','','','1','','0','0','1','1423534179','1420269451','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','订单时间','int(10) NOT NULL','datetime','','','1','','0','0','1','1423534102','1420269666','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('total_price','总价','decimal(10,2) NULL','num','','','1','','0','0','1','1439812371','1420272711','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenID','varchar(255) NOT NULL','string','','','0','','0','0','1','1420526437','1420526437','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pay_status','支付状态','int(10)  NULL','num','','','0','','0','0','1','1423537847','1420596969','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pay_type','支付类型','int(10) NULL','num','','','0','','0','0','1','1423537868','1420596998','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address_id','配送信息','int(10) NULL','num','','','1','','0','0','1','1423534264','1423534264','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_send','是否发货','int(10) NULL','num','0','','1','','0','0','1','1438336095','1438336095','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_code','快递公司编号','varchar(255) NULL','string','','','1','','0','0','1','1438336511','1438336511','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_number','快递单号','varchar(255) NULL','string','','','1','','0','0','1','1438336556','1438336556','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_type','发货类型','char(10) NULL','radio','','','1','0|线上发货\r\n1|物流公司发货','0','0','1','1438336756','1438336756','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_new','是否为新订单','tinyint(2) NULL','bool','1','','0','0:否\r\n1:是','0','0','1','1439435979','1439435969','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','商店编号','int(10) NULL','num','0','','1','','0','0','1','1439455026','1439455026','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status_code','订单跟踪状态码','char(50) NULL','select','0','','0','0:待支付\r\n1:待商家确认\r\n2:待发货\r\n3:配送中\r\n4:确认已收货\r\n5:确认已收款\r\n6:待评价\r\n7:已评价','0','0','1','1439536746','1439526095','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_from_type','订单来源','int(10) NULL','num','0','','0','0:商城\r\n1:电视购物','0','0','1','1441100373','1441100373','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1441713216','1441713216','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员id','int(10) NULL','num','','','1','','0','0','1','1441713730','1441713730','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_order_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`order_id`  int(10) NULL  COMMENT '订单ID',
`status_code`  char(50) NULL  DEFAULT 0 COMMENT '状态码',
`remark`  varchar(255) NULL  COMMENT '备注内容',
`cTime`  int(10) NULL  COMMENT '时间',
`extend`  varchar(255) NULL  COMMENT '扩展信息',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_order_log','订单跟踪','0','','1','','1:基础','','','','','','10','','','1439525562','1439525562','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_id','订单ID','int(10) NULL','num','','','0','','0','0','1','1439525588','1439525588','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status_code','状态码','char(50) NULL','select','0','','0','0:待支付\r\n1:待商家确认\r\n2:待发货\r\n3:配送中\r\n4:确认已收货\r\n5:确认已收款\r\n6:待评价\r\n7:已评价','0','0','1','1439536678','1439525934','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注内容','varchar(255) NULL','string','','','0','','0','0','1','1439525979','1439525979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','时间','int(10) NULL','datetime','','','0','','0','0','1','1439526002','1439526002','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extend','扩展信息','varchar(255) NULL','string','','','0','','0','0','1','1439526038','1439526038','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_slideshow` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '标题',
`img`  int(10) unsigned NOT NULL   COMMENT '图片',
`url`  varchar(255) NULL  COMMENT '链接地址',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否显示',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序',
`token`  varchar(100) NULL  COMMENT 'Token',
`shop_id`  int(10) NULL  DEFAULT 0 COMMENT '商店ID',
`uid`  int(10) NULL  COMMENT '用户id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_slideshow','幻灯片','0','','1','["title","img","url","is_show","sort"]','1:基础','','','','','title:标题\r\nimg:图片\r\nurl:链接地址\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除','20','title','','1396098264','1408323347','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NULL','string','','可为空','1','','0','0','1','1396098316','1396098316','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','图片','int(10) unsigned NOT NULL ','picture','','','1','','0','1','1','1396098349','1396098349','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','链接地址','varchar(255) NULL','string','','','1','','0','0','1','1396098380','1396098380','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','tinyint(2) NULL','bool','1','','1','0:不显示\r\n1:显示','0','0','1','1396098464','1396098464','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序','int(10) unsigned NULL ','num','0','值越小越靠前','1','','0','0','1','1396098682','1396098682','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1396098747','1396098747','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','商店ID','int(10) NULL','num','0','','4','','0','0','1','1422934490','1422932093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','int(10) NULL','num','','','0','','0','0','1','1441626202','1441626194','','3','','regex','get_mid','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_smalltools` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`tooltype`  tinyint(2) NULL  DEFAULT 0 COMMENT '工具类型',
`keyword`  varchar(255) NULL  COMMENT ' 关键词 ',
`cTime`  int(10) NULL  COMMENT '创建时间',
`toolname`  varchar(255) NULL  COMMENT '工具名称',
`tooldes`  text NULL  COMMENT '工具描述',
`toolnum`  varchar(255) NULL  COMMENT '工具唯一编号',
`toolstate`  tinyint(2) NULL  DEFAULT 0 COMMENT '工具状态',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('smalltools','小工具-管理','0','','1','["keyword","toolname","tooldes","toolstate"]','1:基础','','','','','id:编号\r\nkeyword:关键词\r\ntoolname:名称\r\ntooldes:描述\r\ntooltype|get_name_by_status:类型\r\ntoolstate|get_name_by_status:状态','20','toolname','tooldes','1404273263','1404277639','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tooltype','工具类型','tinyint(2) NULL','bool','0','','2','0:微信消息\r\n1:单独页面','0','0','1','1404273343','1404273343','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword',' 关键词 ','varchar(255) NULL','string','','','1','','0','0','1','1404273406','1404273406','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1404273542','1404273542','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('toolname','工具名称','varchar(255) NULL','string','','','1','','0','0','1','1404273609','1404273609','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tooldes','工具描述','text NULL','textarea','','','1','','0','0','1','1404273652','1404273652','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('toolnum','工具唯一编号','varchar(255) NULL','string','','','2','','0','0','1','1404274841','1404273757','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('toolstate','工具状态','tinyint(2) NULL','bool','0','','1','0:启用\r\n1:停用','0','0','1','1404273809','1404273809','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1404273958','1404273958','','3','','regex','get_token','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sn_code` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`sn`  varchar(255) NULL  COMMENT 'SN码',
`uid`  int(10) NULL  COMMENT '粉丝UID',
`cTime`  int(10) NULL  COMMENT '创建时间',
`is_use`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否已使用',
`use_time`  int(10) NULL  COMMENT '使用时间',
`addon`  varchar(255) NULL  DEFAULT 'Coupon' COMMENT '来自的插件',
`target_id`  int(10) unsigned NULL   COMMENT '来源ID',
`prize_id`  int(10) unsigned NULL   COMMENT '奖项ID',
`prize_title`  varchar(255) NULL  COMMENT '奖项',
`token`  varchar(255) NULL  COMMENT 'Token',
`can_use`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否可用',
`server_addr`  varchar(50) NULL  COMMENT '服务器IP',
`admin_uid`  int(10) NULL  COMMENT '核销管理员ID',
PRIMARY KEY (`id`),
KEY `id` (`uid`,target_id,addon),
KEY `addon` (`target_id`,addon)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sn_code','SN码','0','','1','["prize_title","server_addr"]','1:基础','','','','','sn:SN码\r\nuid|get_nickname|deal_emoji:昵称\r\ncTime|time_format:创建时间\r\nis_use|get_name_by_status:是否已使用\r\nuse_time|time_format:使用时间\r\nids:操作:[DELETE]|删除,set_use?id=[id]|改变使用状态','20','sn','','1399272054','1445570072','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn','SN码','varchar(255) NULL','string','','','0','','0','0','1','1399272236','1399272228','','3','','regex','uniqid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','粉丝UID','int(10) NULL','num','','','0','','0','0','1','1399772738','1399272401','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1399272456','1399272456','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','是否已使用','tinyint(2) NULL','bool','0','','0','0:未使用\r\n1:已使用','0','0','1','1400601159','1399272514','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_time','使用时间','int(10) NULL','datetime','','','0','','0','0','1','1399272560','1399272537','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon','来自的插件','varchar(255) NULL','string','Coupon','','4','','0','0','1','1399272651','1399272651','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('target_id','来源ID','int(10) unsigned NULL ','num','','','4','','0','0','1','1399272705','1399272705','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_id','奖项ID','int(10) unsigned NULL ','num','','','0','','0','0','1','1399686317','1399686317','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_title','奖项','varchar(255) NULL','string','','','1','','0','0','1','1399790367','1399790367','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1404525481','1404525481','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('can_use','是否可用','tinyint(2) NULL','bool','1','','0','0:不可用\r\n1:可用','0','0','1','1418890020','1418890020','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('server_addr','服务器IP','varchar(50) NULL','string','','','1','','0','0','1','1425807865','1425807865','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('admin_uid','核销管理员ID','int(10) NULL','num','','','0','','0','0','1','1445504807','1445504807','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sport_award` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`img`  int(10) NOT NULL  COMMENT '奖品图片',
`name`  varchar(255) NOT NULL  COMMENT '奖项名称',
`score`  int(10) NULL  DEFAULT 0 COMMENT '积分数',
`award_type`  varchar(30) NULL  DEFAULT 1 COMMENT '奖品类型',
`price`  FLOAT(10) NULL  DEFAULT 0 COMMENT '商品价格',
`explain`  text NULL  COMMENT '奖品说明',
`count`  int(10) NULL  DEFAULT 0 COMMENT '奖品数量',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`uid`  int(10) NULL  COMMENT 'uid',
`token`  varchar(255) NULL  COMMENT 'token',
`coupon_id`  char(50) NULL  COMMENT '选择赠送券',
`money`  float(10) NULL  COMMENT '返现金额',
`aim_table`  varchar(255) NULL  COMMENT '活动标识',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sport_award','抽奖奖品','0','','1','["award_type","name","coupon_id","price","money","score","img","explain"]','1:基础','','','','','id:6%编号\r\nname:23%奖项名称\r\nimg|get_img_html:8%商品图片\r\naward_type|get_name_by_status:奖品类型\r\nexplain:24%奖品说明\r\nids:20%操作:[EDIT]|编辑,[DELETE]|删除','20','name:请输入抽奖名称','','1432607100','1444901269','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','奖品图片','int(10) NOT NULL','picture','','图片尺寸建议为200*200','1','','0','1','1','1448075550','1432607410','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','奖项名称','varchar(255) NOT NULL','string','','','1','','0','1','1','1432621511','1432607270','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分数','int(10) NULL','num','0','虚拟奖品积分奖励','1','','0','0','1','1444894759','1433304974','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_type','奖品类型','varchar(30) NULL','select','1','选择奖品类别','1','1:实物奖品|price@show,score@hide,coupon_id@hide,money@hide\r\n0:虚拟奖品|price@hide,score@show,coupon_id@hide,money@hide\r\n2:优惠券|price@hide,score@hide,coupon_id@show,money@hide\r\n3:代金券|price@hide,score@hide,coupon_id@show,money@hide','0','1','1','1445054197','1433303130','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('price','商品价格','FLOAT(10) NULL','num','0','价格默认为0，表示未报价','1','','0','0','1','1433312127','1432607574','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('explain','奖品说明','text NULL','textarea','','','1','','0','0','1','1432621815','1432607605','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('count','奖品数量','int(10) NULL','num','0','','0','','0','0','1','1444901244','1432607983','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','','0','','0','0','1','1432809831','1432608522','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1435308540','1435308540','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1444879923','1444879923','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','选择赠送券','char(50) NULL','select','','','1','','0','0','1','1444893831','1444881398','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','返现金额','float(10) NULL','num','','','1','','0','0','1','1444882709','1444881428','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_table','活动标识','varchar(255) NULL','string','','','0','','0','0','1','1444883071','1444883071','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sports` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`score`  varchar(30) NULL  COMMENT '比分',
`content`  text NULL  COMMENT '说明',
`start_time`  int(10) NULL  COMMENT '时间',
`visit_team`  varchar(255) NULL  COMMENT '客场球队',
`home_team`  varchar(255) NULL  COMMENT '主场球队',
`countdown`  int(10) NULL  DEFAULT 60 COMMENT '擂鼓时长',
`drum_count`  int(10) NULL  DEFAULT 0 COMMENT '擂鼓次数',
`drum_follow_count`  int(10) NULL  DEFAULT 0 COMMENT '擂鼓人数',
`home_team_support_count`  int(10) NULL  DEFAULT 0 COMMENT '主场球队支持数',
`visit_team_support_count`  int(10) NULL  DEFAULT 0 COMMENT '客场球队支持人数',
`home_team_drum_count`  int(10) NULL  DEFAULT 0 COMMENT '主场球队擂鼓数',
`visit_team_drum_count`  int(10) NULL  DEFAULT 0 COMMENT '客场球队擂鼓数',
`yaotv_count`  int(10) NULL  DEFAULT 0 COMMENT '摇一摇总次',
`draw_count`  int(10) NULL  DEFAULT 0 COMMENT '抽奖总次数',
`is_finish`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否已结束',
`yaotv_follow_count`  int(10) NULL  DEFAULT 0 COMMENT '摇电视总人数',
`draw_follow_count`  int(10) NULL  DEFAULT 0 COMMENT '抽奖总人数',
`comment_status`  tinyint(2) NULL  DEFAULT 0 COMMENT '评论是否需要审核',
PRIMARY KEY (`id`),
KEY `start_time` (`start_time`,id)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sports','体育赛事','0','','1','["home_team","visit_team","start_time","score","content","countdown","comment_status"]','1:基础','','','','','start_time|time_format:20%比赛场次\r\nvs_team:20%对战球队（主场VS客场）\r\nscore_title:8%比分\r\ncontent|lists_msubstr:27%对战球队的介绍\r\nids:23%操作:add?sports_id=[id]&_controller=LotteryPrizeList&_addons=Draw&target=_blank|奖品配置,lists?sports_id=[id]&_addons=Draw&_controller=LuckyFollow&target=_blank|中奖列表,lists?sports_id=[id]&_addons=Comment&_controller=Comment&target=_blank|评论列表,package?id=[id]&_controller=Sucai&_addons=Sucai&source=Sports&is_preview=1&target=_blank|预览,package?id=[id]&_controller=Sucai&_addons=Sucai&source=Sports&is_download=1&target=_blank|下载素材,[EDIT]|编辑,[DELETE]|删除','20','home_team:请输入球队名','','1432556238','1436173617','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','比分','varchar(30) NULL','string','','输入格式：4:1','1','','0','0','1','1432781750','1432556644','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','说明','text NULL','textarea','','请输入说明','1','','0','0','1','1432556696','1432556696','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','时间','int(10) NULL','datetime','','','1','','0','1','1','1432556499','1432556499','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('visit_team','客场球队','varchar(255) NULL','cascade','','','1','type=db&table=sports_team','0','1','1','1432558295','1432556450','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('home_team','主场球队','varchar(255) NULL','cascade','','','1','type=db&table=sports_team','0','1','1','1432558269','1432556380','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('countdown','擂鼓时长','int(10) NULL','num','60','擂鼓倒计的时长,单位为秒,取值范围: 10~99','1','','0','0','1','1432645901','1432642097','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('drum_count','擂鼓次数','int(10) NULL','num','0','','0','','0','0','1','1432642664','1432642664','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('drum_follow_count','擂鼓人数','int(10) NULL','num','0','','0','','0','0','1','1432642718','1432642718','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('home_team_support_count','主场球队支持数','int(10) NULL','num','0','','0','','0','0','1','1432642808','1432642808','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('visit_team_support_count','客场球队支持人数','int(10) NULL','num','0','','0','','0','0','1','1432642849','1432642849','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('home_team_drum_count','主场球队擂鼓数','int(10) NULL','num','0','','0','','0','0','1','1432642978','1432642978','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('visit_team_drum_count','客场球队擂鼓数','int(10) NULL','num','0','','0','','0','0','1','1432644311','1432643015','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('yaotv_count','摇一摇总次','int(10) NULL','num','0','','0','','0','0','1','1432884957','1432784354','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('draw_count','抽奖总次数','int(10) NULL','num','0','','0','','0','0','1','1432887571','1432784416','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_finish','是否已结束','tinyint(2) NULL','bool','0','','0','0:未结束\r\n1:已结束','0','0','1','1432868975','1432868975','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('yaotv_follow_count','摇电视总人数','int(10) NULL','num','0','','0','','0','0','1','1432884721','1432884721','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('draw_follow_count','抽奖总人数','int(10) NULL','num','0','','0','','0','0','1','1432887553','1432887553','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('comment_status','评论是否需要审核','tinyint(2) NULL','radio','0','','1','0:不审核\r\n1:审核','0','0','1','1435109668','1435030411','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sports_drum` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`sports_id`  int(10) NULL  COMMENT '场次ID',
`team_id`  int(10) NULL  COMMENT '球队ID',
`follow_id`  int(10) NULL  COMMENT '用户ID',
`drum_count`  int(10) NULL  COMMENT '擂鼓次数',
`cTime`  int(10) NULL  COMMENT '时间',
PRIMARY KEY (`id`),
KEY `ctime` (`sports_id`,cTime),
KEY `team_id` (`sports_id`,team_id)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sports_drum','擂鼓记录','0','','1','','1:基础','','','','','','20','','','1432642253','1432642253','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sports_id','场次ID','int(10) NULL','num','','','0','','0','0','1','1432642290','1432642290','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('team_id','球队ID','int(10) NULL','num','','','0','','0','0','1','1432642312','1432642312','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','用户ID','int(10) NULL','num','','','0','','0','0','1','1432642354','1432642354','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('drum_count','擂鼓次数','int(10) NULL','num','','','0','','0','0','1','1432642384','1432642384','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','时间','int(10) NULL','datetime','','','0','','0','0','1','1432642409','1432642409','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sports_support` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`sports_id`  int(10) NULL  COMMENT '场次ID',
`team_id`  int(10) NULL  COMMENT '球队ID',
`follow_id`  int(10) NULL  COMMENT '用户ID',
`cTime`  int(10) NULL  COMMENT '支持时间',
PRIMARY KEY (`id`),
KEY `sf` (`sports_id`,follow_id)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sports_support','球队支持记录','0','','1','','1:基础','','','','','','20','','','1432635084','1432635084','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sports_id','场次ID','int(10) NULL','num','','','0','','0','0','1','1432635120','1432635120','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('team_id','球队ID','int(10) NULL','num','','','0','','0','0','1','1432635147','1432635147','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','用户ID','int(10) NULL','num','','','0','','0','0','1','1432635168','1432635168','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','支持时间','int(10) NULL','datetime','','','0','','0','0','1','1432635202','1432635202','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sports_team` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序号',
`intro`  text  NULL  COMMENT '球队说明',
`pid`  int(10) NULL  DEFAULT 0 COMMENT 'pid',
`logo`  int(10) UNSIGNED NULL  COMMENT '球队图标',
`title`  varchar(100) NULL  COMMENT '球队名称',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sports_team','比赛球队','0','','1','["title","logo","intro"]','1:基础','','','','','logo|get_img_html:球队图标\r\ntitle:球队名称\r\nintro|lists_msubstr:球队说明\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title:请输入球队名','','1432556797','1432886417','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL','num','0','','0','','0','0','1','1432559360','1432559360','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','球队说明','text  NULL','textarea','','','1','','0','0','1','1432557159','1432556960','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','pid','int(10) NULL','num','0','','0','','0','0','1','1432557085','1432557085','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('logo','球队图标','int(10) UNSIGNED NULL','picture','','','1','','0','1','1','1432556913','1432556913','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','球队名称','varchar(100) NULL','string','','请输入球队名称','1','','0','1','1','1432958716','1432556869','unique','3','球队名称不能重复','unique','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_store` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '应用标题',
`uid`  int(10) NULL   DEFAULT 0 COMMENT '用户ID',
`content`  text NULL   COMMENT '应用详细介绍',
`cTime`  int(10) NULL   COMMENT '发布时间',
`attach`  varchar(255) NULL   COMMENT '应用压缩包',
`is_top`  int(10) NULL   DEFAULT 0 COMMENT '置顶',
`cid`  tinyint(4) NULL   COMMENT '分类',
`view_count`  int(11) unsigned NULL   DEFAULT 0 COMMENT '浏览数',
`download_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '下载数',
`img_2`  int(10) unsigned NULL   COMMENT '应用截图2',
`img_1`  int(10) unsigned NULL   COMMENT '应用截图1',
`img_3`  int(10) unsigned NULL   COMMENT '应用截图3',
`img_4`  int(10) unsigned NULL   COMMENT '应用截图4',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('store','应用商店','0','','1','["type","title","price","attach","logo","content","img_1","img_2","img_3","img_4","is_top","audit","audit_time"]','1:基础','','','','','id:ID值\r\ntype|get_name_by_status:应用类型\r\ntitle:应用标题\r\nprice:价格\r\nlogo|get_img_html:应用LOGO\r\nmTime|time_format:更新时间\r\naudit|get_name_by_status:审核状态\r\naudit_time|time_format:审核时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1394033250','1402885526','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','应用标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1402758132','1394033402','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL ','num','0','','0','','0','0','1','1394087733','1394033447','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','应用详细介绍','text NULL ','editor','','','1','','0','1','1','1402758118','1394033484','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) NULL ','datetime','','','0','','0','0','1','1394033571','1394033571','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attach','应用压缩包','varchar(255) NULL ','file','','需要上传zip文件','1','','0','0','1','1402758100','1394033674','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_top','置顶','int(10) NULL ','bool','0','0表示不置顶，否则其它值表示置顶且值是置顶的时间','1','0:不置顶\r\n1:置顶','0','0','1','1402800009','1394068787','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cid','分类','tinyint(4) NULL ','select','','','0','1:基础模块\r\n2:行业模块\r\n3:会议活动\r\n4:娱乐模块\r\n5:其它模块','0','0','1','1402758069','1394069964','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','浏览数','int(11) unsigned NULL ','num','0','','0','','0','0','1','1394072168','1394072168','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('download_count','下载数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1394085763','1394085763','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img_2','应用截图2','int(10) unsigned NULL ','picture','','','1','','0','0','1','1402758035','1394084714','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img_1','应用截图1','int(10) unsigned NULL ','picture','','','1','','0','0','1','1402758046','1394084635','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img_3','应用截图3','int(10) unsigned NULL ','picture','','','1','','0','0','1','1402758021','1394084757','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img_4','应用截图4','int(10) unsigned NULL ','picture','','','1','','0','0','1','1402758011','1394084797','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sucai` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT 'uid',
`name`  varchar(100) NULL  COMMENT '素材名称',
`status`  char(10) NULL  DEFAULT 'UnSubmit' COMMENT '状态',
`cTime`  int(10) NULL  COMMENT '提交时间',
`url`  varchar(255) NULL  COMMENT '实际摇一摇所使用的页面URL',
`type`  varchar(255) NULL  COMMENT '素材类型',
`detail`  text NULL  COMMENT '素材内容',
`reason`  text NULL  COMMENT '入库失败的原因',
`create_time`  int(10) NULL  COMMENT '申请时间',
`checked_time`  int(10) NULL  COMMENT '入库时间',
`source`  varchar(50) NULL  COMMENT '来源',
`source_id`  int(10) NULL  COMMENT '来源ID',
`wechat_id`  int(10) NULL  COMMENT '微信端的素材ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sucai','素材管理','0','','1','["name","status","cTime","url","type","detail","reason","create_time","checked_time","source","source_id"]','1:基础','','','','','name:素材名称\r\nstatus|get_name_by_status:状态\r\nurl:页面URL\r\ncreate_time|time_format:申请时间\r\nchecked_time|time_format:入库时间\r\nids:操作','20','name','','1424611702','1425386629','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','1','','0','0','1','1430880974','1430880974','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','素材名称','varchar(100) NULL','string','','','1','','0','0','1','1424612322','1424611929','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','char(10) NULL','radio','UnSubmit','','1','UnSubmit:未提交\r\nWaiting:入库中\r\nSuccess:入库成功\r\nFailure:入库失败','0','0','1','1424612039','1424612039','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','提交时间','int(10) NULL','datetime','','','1','','0','0','1','1424612114','1424612114','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','实际摇一摇所使用的页面URL','varchar(255) NULL','string','','','1','','0','0','1','1424612483','1424612154','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','素材类型','varchar(255) NULL','string','','','1','','0','0','1','1424612421','1424612421','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('detail','素材内容','text NULL','textarea','','','1','','0','0','1','1424612456','1424612456','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reason','入库失败的原因','text NULL','textarea','','','1','','0','0','1','1424612509','1424612509','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('create_time','申请时间','int(10) NULL','datetime','','','1','','0','0','1','1424612542','1424612542','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('checked_time','入库时间','int(10) NULL','datetime','','','1','','0','0','1','1424612571','1424612571','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('source','来源','varchar(50) NULL','string','','','1','','0','0','1','1424836818','1424836818','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('source_id','来源ID','int(10) NULL','num','','','1','','0','0','1','1424836842','1424836842','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat_id','微信端的素材ID','int(10) NULL','num','','','0','','0','0','1','1425370605','1425370605','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sucai_template` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '管理员id',
`token`  varchar(255) NULL  COMMENT '用户token',
`addons`  varchar(255) NULL  COMMENT '插件名称',
`template`  varchar(255) NULL  COMMENT '模版名称',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sucai_template','素材模板库','0','','1','','1:基础','','','','','','20','','','1431575544','1431575544','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','管理员id','int(10) NULL','num','','','1','','0','0','1','1431575588','1431575588','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','用户token','varchar(255) NULL','string','','','1','','0','0','1','1431575617','1431575617','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addons','插件名称','varchar(255) NULL','string','','','1','','0','0','1','1431590322','1431575667','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','模版名称','varchar(255) NULL','string','','','1','','0','0','1','1431575691','1431575691','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_survey` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '关键词类型',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '封面简介',
`mTime`  int(10) NULL  COMMENT '修改时间',
`cover`  int(10) unsigned NULL   COMMENT '封面图片',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`finish_tip`  text NULL  COMMENT '结束语',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '结束时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('survey','调研问卷','0','','1','["keyword","keyword_type","title","cover","intro","finish_tip","template"]','1:基础','','','','','id:微调研ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,survey_question&id=[id]|问题管理,survey_answer&id=[id]|数据管理,preview?id=[id]&target=_blank|预览','20','title','','1396061373','1437033981','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396624337','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NOT NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','1','1','1396624426','1396061765','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NULL','textarea','','','1','','0','0','1','1396624505','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) unsigned NULL ','picture','','','1','','0','1','1','1439368240','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('finish_tip','结束语','text NULL','textarea','','为空默认为：调研完成，谢谢参与','1','','0','0','1','1440403647','1396953940','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430193696','1430193696','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1440408604','1440407931','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','1','1','1440408598','1440407951','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_survey_answer` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`answer`  text NULL  COMMENT '回答内容',
`openid`  varchar(255) NULL  COMMENT 'OpenId',
`uid`  int(10) NULL   COMMENT '用户UID',
`question_id`  int(10) unsigned NOT NULL   COMMENT 'question_id',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`survey_id`  int(10) unsigned NOT NULL   COMMENT 'survey_id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('survey_answer','调研回答','0','','1','','1:基础','','','','','openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\ncTime|time_format:发布时间\r\nids:操作:detail?uid=[uid]&survey_id=[survey_id]|回答内容','20','title','','1396061373','1397011511','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('answer','回答内容','text NULL','textarea','','','0','','0','0','1','1396955766','1396955766','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenId','varchar(255) NULL','string','','','0','','0','0','1','1396955581','1396955581','','3','','regex','get_openid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户UID','int(10) NULL ','num','','','0','','0','0','1','1396955530','1396955530','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('question_id','question_id','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1396955412','1396955392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('survey_id','survey_id','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1396955403','1396955369','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_survey_question` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '问题描述',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`is_must`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否必填',
`extra`  text NULL  COMMENT '参数',
`type`  char(50) NOT NULL  DEFAULT 'radio' COMMENT '问题类型',
`survey_id`  int(10) unsigned NOT NULL   COMMENT 'survey_id',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('survey_question','调研问题','0','','1','["title","type","extra","intro","is_must","sort"]','1:基础','','','','','title:标题\r\ntype|get_name_by_status:问题类型\r\nis_must|get_name_by_status:是否必填\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1396061373','1396955090','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','问题描述','text NULL','textarea','','','1','','0','0','1','1396954176','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_must','是否必填','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1396954649','1396954649','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra','参数','text NULL','textarea','','类型为单选、多选时的定义数据，格式见上面的提示','1','','0','0','1','1396954558','1396954558','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','问题类型','char(50) NOT NULL','radio','radio','','1','radio:单选题\r\ncheckbox:多选题\r\ntextarea:简答题','0','1','1','1396962517','1396954463','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('survey_id','survey_id','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1396954240','1396954240','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','值越小越靠前','1','','0','0','1','1396955010','1396955010','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_system_notice` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '公告标题',
`content`  text  NULL  COMMENT '公告内容',
`create_time`  int(10) NULL  COMMENT '发布时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('system_notice','系统公告表','0','','1','','1:基础','','','','','','20','','','1431141043','1431141043','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','公告标题','varchar(255) NULL','string','','','1','','0','1','1','1431143985','1431143985','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','公告内容','text  NULL','editor','','','1','','0','1','1','1431144020','1431144020','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('create_time','发布时间','int(10) NULL','datetime','','','4','','0','0','1','1431146373','1431144069','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_update_version` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`version`  int(10) unsigned NOT NULL   COMMENT '版本号',
`title`  varchar(50) NOT NULL  COMMENT '升级包名',
`description`  text NULL  COMMENT '描述',
`create_date`  int(10) NULL  COMMENT '创建时间',
`download_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '下载统计',
`package`  varchar(255) NOT NULL  COMMENT '升级包地址',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('update_version','系统版本升级','0','','1','["version","title","description","create_date","package"]','1:基础','','','','','version:版本号\r\ntitle:升级包名\r\ndescription:描述\r\ncreate_date|time_format:创建时间\r\ndownload_count:下载统计数\r\nids:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除','20','','','1393770420','1393771807','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('version','版本号','int(10) unsigned NOT NULL ','num','','','1','','0','1','1','1393770457','1393770457','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','升级包名','varchar(50) NOT NULL','string','','','1','','0','1','1','1393770499','1393770499','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('description','描述','text NULL','textarea','','','1','','0','0','1','1393770546','1393770546','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('create_date','创建时间','int(10) NULL','datetime','','','1','','0','0','1','1393770591','1393770591','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('download_count','下载统计','int(10) unsigned NULL ','num','0','','0','','0','0','1','1393770659','1393770659','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('package','升级包地址','varchar(255) NOT NULL','textarea','','','1','','0','1','1','1393812247','1393770727','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_vote` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(50) NOT NULL  COMMENT '关键词',
`title`  varchar(100) NOT NULL  COMMENT '投票标题',
`description`  text NULL  COMMENT '投票描述',
`picurl`  int(10) unsigned NULL   COMMENT '封面图片',
`type`  char(10) NOT NULL  DEFAULT 0 COMMENT '选择类型',
`start_date`  int(10) NULL  COMMENT '开始日期',
`end_date`  int(10) NULL  COMMENT '结束日期',
`is_img`  tinyint(2) NULL  DEFAULT 0 COMMENT '文字/图片投票',
`vote_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '投票数',
`cTime`  int(10) NULL  COMMENT '投票创建时间',
`mTime`  int(10) NULL  COMMENT '更新时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('vote','投票','0','','1','["keyword","title","description","picurl","start_date","end_date","template"]','1:基础','','','','','id:投票ID\r\nkeyword:关键词\r\ntitle:投票标题\r\ntype|get_name_by_status:类型\r\nis_img|get_name_by_status:状态\r\nvote_count:投票数\r\nids:操作:[EDIT]&id=[id]|编辑,[DELETE]|删除,showLog&id=[id]|投票记录,showCount&id=[id]|选项票数,preview?id=[id]&target=_blank|预览','20','title','description','1388930292','1437446751','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(50) NOT NULL','string','','用户在微信里回复此关键词将会触发此投票。','1','','0','1','1','1392969972','1388930888','keyword_unique','1','此关键词已经存在，请换成别的关键词再试试','function','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','投票标题','varchar(100) NOT NULL','string','','','1','','0','1','1','1388931041','1388931041','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('description','投票描述','text NULL','textarea','','','1','','0','0','1','1400633517','1388931173','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('picurl','封面图片','int(10) unsigned NULL ','picture','','支持JPG、PNG格式，较好的效果为大图360*200，小图200*200','1','','0','0','1','1388931285','1388931285','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','选择类型','char(10) NOT NULL','radio','0','','0','0:单选\r\n1:多选','0','1','1','1430376146','1388931487','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_date','开始日期','int(10) NULL','datetime','','','1','','0','0','1','1388931734','1388931734','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_date','结束日期','int(10) NULL','datetime','','','1','','0','0','1','1388931769','1388931769','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_img','文字/图片投票','tinyint(2) NULL','radio','0','','0','0:文字投票\r\n1:图片投票','0','1','1','1389081985','1388931941','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_count','投票数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1388932035','1388932035','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','投票创建时间','int(10) NULL','datetime','','','0','','0','1','1','1388932128','1388932128','','1','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','更新时间','int(10) NULL','datetime','','','0','','0','0','1','1430379170','1390634006','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1391397388','1391397388','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1430188739','1430188739','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_vote_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`vote_id`  int(10) unsigned NULL   COMMENT '投票ID',
`user_id`  int(10) NULL   COMMENT '用户ID',
`token`  varchar(255) NULL  COMMENT '用户TOKEN',
`options`  varchar(255) NULL  COMMENT '选择选项',
`cTime`  int(10) NULL  COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('vote_log','投票记录','0','','1','["vote_id","user_id","options"]','1:基础','','','','','vote_id:25%投票标题\r\nuser_id:25%用户\r\noptions:25%投票选项\r\ncTime|time_format:25%创建时间\r\n\r\n\r\n\r\n','20','','','1388934136','1430101786','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_id','投票ID','int(10) unsigned NULL ','num','','','1','','0','1','1','1429846753','1388934189','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('user_id','用户ID','int(10) NULL ','num','','','1','','0','1','1','1429855665','1388934265','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','用户TOKEN','varchar(255) NULL','string','','','0','','0','1','1','1429855713','1388934296','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('options','选择选项','varchar(255) NULL','string','','','1','','0','1','1','1429855086','1388934351','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1429874378','1388934392','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_weisite_category` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(100) NOT NULL  COMMENT '分类标题',
`icon`  int(10) unsigned NULL   COMMENT '分类图片',
`url`  varchar(255) NULL  COMMENT '外链',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '显示',
`token`  varchar(100) NULL   COMMENT 'Token',
`sort`  int(10) NULL   DEFAULT 0 COMMENT '排序号',
`pid`  int(10) NULL  DEFAULT 0 COMMENT '一级分类',
`template`  varchar(255) NULL  COMMENT '二级模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('weisite_category','微官网分类','0','','1','["title","icon","url","is_show","sort","pid"]','1:基础','','','','','title:15%分类标题\r\nicon|get_img_html:10%分类图片\r\nurl:20%外链\r\nsort:10%排序号\r\npid:10%一级目录\r\ntemplate:10%二级模板\r\nis_show|get_name_by_status:10%显示\r\nids:10%操作:[EDIT]|编辑,[DELETE]|删除,lists&_addons=WeiSite&_controller=WeiSite&cate_id=[id]|复制链接','20','title','','1395987942','1449226885','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','分类标题','varchar(100) NOT NULL','string','','','1','','0','1','1','1408950771','1395988016','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon','分类图片','int(10) unsigned NULL ','picture','','最佳尺寸：200X200','1','','0','0','1','1449201967','1395988966','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','外链','varchar(255) NULL','string','','为空时默认跳转到该分类的文章列表页面','1','','0','0','1','1401408363','1395989660','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','显示','tinyint(2) NULL','bool','1','','1','0:不显示\r\n1:显示','0','0','1','1445395029','1395989709','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL ','string','','','0','','0','0','1','1395989760','1395989760','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL ','num','0','数值越小越靠前','1','','0','0','1','1396340334','1396340334','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','一级分类','int(10) NULL','cascade','0','不选时，则为一级分类；有选时，则为二级分类','1','type=db&table=weisite_category&pid=id','0','0','1','1449202283','1439469294','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','二级模板','varchar(255) NULL','string','','','0','','0','0','1','1449230368','1449124974','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_weisite_cms` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NULL  COMMENT '关键词类型',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '简介',
`cate_id`  int(10) unsigned NULL   DEFAULT 0 COMMENT '所属类别',
`cover`  int(10) unsigned NULL   COMMENT '封面图片',
`content`  text NULL  COMMENT '内容',
`cTime`  int(10) NULL  COMMENT '发布时间',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序号',
`view_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '浏览数',
`show_type`  varchar(100) NULL  DEFAULT 0 COMMENT '显示方式',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('weisite_cms','文章管理','0','','1','["keyword","keyword_type","title","intro","cate_id","cover","content","sort"]','1:基础','','','','','keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncate_id:所属分类\r\nsort:排序号\r\nview_count:浏览数\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除','20','title','','1396061373','1445399235','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396061575','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词类型','tinyint(2) NULL','select','','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','0','1','1396061814','1396061765','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396061877','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','简介','text NULL','textarea','','','1','','0','0','1','1396061947','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cate_id','所属类别','int(10) unsigned NULL ','select','0','要先在微官网分类里配置好分类才可选择','1','0:请选择分类','0','0','1','1396078914','1396062003','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) unsigned NULL ','picture','','','1','','0','0','1','1396062093','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','text NULL','editor','','','1','','0','0','1','1396062146','1396062146','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) NULL','datetime','','','0','','0','0','1','1396075102','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) unsigned NULL ','num','0','数值越小越靠前','1','','0','0','1','1396510508','1396510508','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','浏览数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1396510630','1396510630','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('show_type','显示方式','varchar(100) NULL','checkbox','0','若列表模板有显示幻灯片，则可指定该文章的显示为幻灯片或列表','1','0:列表\r\n1:幻灯片','0','0','1','1449657545','1449657109','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_weisite_footer` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`url`  varchar(255) NULL   COMMENT '关联URL',
`title`  varchar(50) NOT NULL  COMMENT '菜单名',
`pid`  tinyint(2) NULL  DEFAULT 0 COMMENT '一级菜单',
`sort`  tinyint(4) NULL   DEFAULT 0 COMMENT '排序号',
`token`  varchar(255) NULL  COMMENT 'Token',
`icon`  int(10) unsigned NULL   COMMENT '图标',
PRIMARY KEY (`id`),
KEY `token` (`token`,pid,sort)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('weisite_footer','底部导航','0','','1','["pid","title","url","sort"]','1:基础','','','','','title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','title','','1394518309','1396507698','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','关联URL','varchar(255) NULL ','string','','','1','','0','0','1','1394519090','1394519090','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','菜单名','varchar(50) NOT NULL','string','','可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。','1','','0','1','1','1408950832','1394518988','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','一级菜单','tinyint(2) NULL','select','0','如果是一级菜单，选择“无”即可','1','0:无','0','0','1','1409045931','1394518930','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','tinyint(4) NULL ','num','0','数值越小越靠前','1','','0','0','1','1394523288','1394519175','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1394526820','1394526820','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon','图标','int(10) unsigned NULL ','picture','','根据选择的底部模板决定是否需要上传图标','1','','0','0','1','1396506297','1396506297','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_weisite_slideshow` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '标题',
`img`  int(10) unsigned NOT NULL   COMMENT '图片',
`url`  varchar(255) NULL  COMMENT '链接地址',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否显示',
`sort`  int(10) unsigned NULL   DEFAULT 0 COMMENT '排序',
`token`  varchar(100) NULL  COMMENT 'Token',
`cate_id`  varchar(100) NOT NULL  DEFAULT 0 COMMENT '所属目录',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('weisite_slideshow','幻灯片','0','','1','["title","img","url","is_show","sort","cate_id"]','1:基础','','','','','title:标题\r\nimg:图片\r\nurl:链接地址\r\ncate_id:所属目录\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除','20','title','','1396098264','1449126299','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NULL','string','','可为空','1','','0','0','1','1396098316','1396098316','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','图片','int(10) unsigned NOT NULL ','picture','','尺寸：640X320','1','','0','1','1','1447051836','1396098349','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','链接地址','varchar(255) NULL','string','','','1','','0','0','1','1396098380','1396098380','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','tinyint(2) NULL','bool','1','','1','0:不显示\r\n1:显示','0','0','1','1396098464','1396098464','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序','int(10) unsigned NULL ','num','0','值越小越靠前','1','','0','0','1','1396098682','1396098682','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1396098747','1396098747','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cate_id','所属目录','varchar(100) NOT NULL','dynamic_select','0','','1','type=db&table=weisite_category&pid=id','0','0','1','1449198100','1449126239','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_weixin_message` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`ToUserName`  varchar(100) NULL  COMMENT 'Token',
`FromUserName`  varchar(100) NULL  COMMENT 'OpenID',
`CreateTime`  int(10) NULL  COMMENT '创建时间',
`MsgType`  varchar(30) NULL  COMMENT '消息类型',
`MsgId`  varchar(100) NULL  COMMENT '消息ID',
`Content`  text NULL  COMMENT '文本消息内容',
`PicUrl`  varchar(255) NULL  COMMENT '图片链接',
`MediaId`  varchar(100) NULL  COMMENT '多媒体文件ID',
`Format`  varchar(30) NULL  COMMENT '语音格式',
`ThumbMediaId`  varchar(30) NULL  COMMENT '缩略图的媒体id',
`Title`  varchar(100) NULL  COMMENT '消息标题',
`Description`  text NULL  COMMENT '消息描述',
`Url`  varchar(255) NULL  COMMENT 'Url',
`collect`  tinyint(1) NULL  DEFAULT 0 COMMENT '收藏状态',
`deal`  tinyint(1) NULL  DEFAULT 0 COMMENT '处理状态',
`is_read`  tinyint(1) NULL  DEFAULT 0 COMMENT '是否已读',
`type`  tinyint(1) NULL  DEFAULT 0 COMMENT '消息分类',
`is_material`  int(10) NULL  DEFAULT 0 COMMENT '设置为文本素材',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('weixin_message','微信消息管理','0','','1','','1:基础','','','','','FromUserName:用户\r\ncontent:内容\r\nCreateTime:时间','20','','','1438142999','1438151555','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ToUserName','Token','varchar(100) NULL','string','','','0','','0','0','1','1438143065','1438143065','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('FromUserName','OpenID','varchar(100) NULL','string','','','0','','0','0','1','1438143098','1438143098','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('CreateTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1438143120','1438143120','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('MsgType','消息类型','varchar(30) NULL','string','','','0','','0','0','1','1438143139','1438143139','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('MsgId','消息ID','varchar(100) NULL','string','','','0','','0','0','1','1438143182','1438143182','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Content','文本消息内容','text NULL','textarea','','','0','','0','0','1','1438143218','1438143218','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('PicUrl','图片链接','varchar(255) NULL','string','','','0','','0','0','1','1438143273','1438143273','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('MediaId','多媒体文件ID','varchar(100) NULL','string','','','0','','0','0','1','1438143357','1438143357','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Format','语音格式','varchar(30) NULL','string','','','0','','0','0','1','1438143397','1438143397','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ThumbMediaId','缩略图的媒体id','varchar(30) NULL','string','','','0','','0','0','1','1438143445','1438143426','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Title','消息标题','varchar(100) NULL','string','','','0','','0','0','1','1438143471','1438143471','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Description','消息描述','text NULL','textarea','','','0','','0','0','1','1438143535','1438143535','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('Url','Url','varchar(255) NULL','string','','','0','','0','0','1','1438143558','1438143558','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect','收藏状态','tinyint(1) NULL','bool','0','','0','0:未收藏\r\n1:已收藏','0','0','1','1438153936','1438153936','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('deal','处理状态','tinyint(1) NULL','bool','0','','0','0:未处理\r\n1:已处理','0','0','1','1438165005','1438153991','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_read','是否已读','tinyint(1) NULL','bool','0','','1','0:未读\r\n1:已读','0','0','1','1438165062','1438165062','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','消息分类','tinyint(1) NULL','bool','0','','1','0:用户消息\r\n1:管理员回复消息','0','0','1','1438168301','1438168301','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_material','设置为文本素材','int(10) NULL','num','0','','0','0:不设置\r\n1:设置','0','0','1','1445497359','1445497359','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_wish_card` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`send_name`  varchar(255) NULL  COMMENT '发送人',
`receive_name`  varchar(255) NULL  COMMENT '接收人',
`content`  text NULL  COMMENT '祝福语',
`create_time`  int(10) NULL  COMMENT ' 创建时间',
`template`  char(50) NULL  COMMENT '模板',
`template_cate`  varchar(255) NULL  COMMENT '模板分类',
`read_count`  int(10) NULL  DEFAULT 0 COMMENT '浏览次数',
`mid`  varchar(255) NULL  COMMENT '用户Id',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('wish_card','微贺卡','0','','1','["send_name","receive_name","content","template"]','1:基础','','','','','send_name:10%发送人\r\nreceive_name:10%接收人\r\ncontent:40%祝福语\r\ncreate_time|time_format:15%创建时间\r\nread_count:10%浏览次数\r\nid:15%操作:[EDIT]|编辑,card_show?id=[id]&target=_blank&_controller=Wap|预览,[DELETE]|删除','20','content:祝福语','','1429346197','1429760720','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_name','发送人','varchar(255) NULL','string','','','1','','0','1','1','1429346507','1429346507','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('receive_name','接收人','varchar(255) NULL','string','','','1','','0','1','1','1429346556','1429346556','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','祝福语','text NULL','textarea','','','1','','0','1','1','1429346679','1429346679','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('create_time',' 创建时间','int(10) NULL','datetime','','','0','','0','0','1','1429604045','1429346729','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','模板','char(50) NULL','string','','模板的文件夹名称，不能为中文','1','','0','1','1','1429348371','1429346979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template_cate','模板分类','varchar(255) NULL','string','','','4','','0','1','1','1429348355','1429347540','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('read_count','浏览次数','int(10) NULL','num','0','','0','','0','0','1','1429348951','1429348951','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mid','用户Id','varchar(255) NULL','num','','','0','','0','0','1','1429673299','1429512603','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1429764969','1429764969','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_wish_card_content` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`content_cate_id`  int(10) NULL  DEFAULT 0 COMMENT '祝福语类别Id',
`content`  text NULL  COMMENT '祝福语',
`content_cate`  varchar(255) NULL  COMMENT '类别',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('wish_card_content','祝福语','0','','1','["content_cate","content"]','1:基础','','','','','content_cate_id:10%类别Id\r\ncontent_cate:20%类别\r\ncontent:50%祝福语\r\nid:20%操作:[EDIT]|编辑,[DELETE]|删除','20','','','1429348863','1429841596','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content_cate_id','祝福语类别Id','int(10) NULL','num','0','','4','','0','1','1','1429349347','1429349074','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','祝福语','text NULL','textarea','','','1','','0','1','1','1429349162','1429349162','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content_cate','类别','varchar(255) NULL','select','','','1','','0','0','1','1429522282','1429350568','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1429523422','1429512730','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_wish_card_content_cate` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`content_cate_name`  varchar(255) NULL  COMMENT '祝福语类别',
`token`  varchar(255) NULL  COMMENT 'Token',
`content_cate_icon`  int(10) UNSIGNED NULL  COMMENT '类别图标',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('wish_card_content_cate','祝福语类别','0','','1','["content_cate_name","content_cate_icon"]','1:基础','','','','','content_cate_name:类别\r\ncontent_cate_icon|get_img_html:图标\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','content_cate_name:类别','','1429348818','1429598114','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content_cate_name','祝福语类别','varchar(255) NULL','string','','','1','','0','1','1','1429349396','1429349396','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1429520955','1429512697','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content_cate_icon','类别图标','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1429597855','1429597855','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_xydzp` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`end_date`  int(10) NULL   COMMENT '结束日期',
`cTime`  int(10) NULL   COMMENT '活动创建时间',
`states`  char(10) NULL   DEFAULT 0 COMMENT '活动状态',
`picurl`  int(10) unsigned NULL   COMMENT '封面图片',
`title`  varchar(255) NULL   COMMENT '活动标题',
`guiz`  text NULL   COMMENT '活动规则',
`choujnum`  int(10) unsigned NULL   DEFAULT 0 COMMENT '每日抽奖次数',
`des`  text NULL   COMMENT '活动介绍',
`des_jj`  text NULL   COMMENT '活动介绍',
`token`  varchar(255) NULL  COMMENT 'Token',
`keyword`  varchar(255) NULL   COMMENT '关键词',
`start_date`  int(10) NULL   COMMENT '开始时间',
`experience`  int(10) NULL  DEFAULT 0 COMMENT '消耗经验值',
`background`  int(10) UNSIGNED NULL  COMMENT '背景图',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('xydzp','幸运大转盘','0','','1','["keyword","title","picurl","des_jj","guiz","choujnum","start_date","end_date","experience","background","template"]','1:基础','','','','','id:编号\r\nkeyword:触发关键词\r\ntitle:标题\r\nstart_date|time_format:开始时间\r\nend_date|time_format:结束日期\r\nchoujnum:每日抽奖次数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,zjloglists?id=[id]|中奖记录,jplists?xydzp_id=[id]|奖品设置,preview?id=[id]&target=_blank|预览','20','title','des','1395395179','1437449460','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_date','结束日期','int(10) NULL ','datetime','','','1','','0','0','1','1395395670','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','活动创建时间','int(10) NULL ','datetime','','','0','','0','0','1','1395395963','1395395179','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('states','活动状态','char(10) NULL ','radio','0','','0','0:未开始\r\n1:已结束','0','0','1','1395395602','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('picurl','封面图片','int(10) unsigned NULL ','picture','','','1','','0','1','1','1439370422','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动标题','varchar(255) NULL ','string','','','1','','0','0','1','1395395535','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('guiz','活动规则','text NULL ','textarea','','','1','','0','0','1','1418369751','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('choujnum','每日抽奖次数','int(10) unsigned NULL ','num','0','','1','','0','0','1','1395395485','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('des','活动介绍','text NULL ','textarea','','','0','','0','0','1','1431068356','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('des_jj','活动介绍','text NULL ','textarea','','活动介绍简介 用于给用户发送消息时候的图文描述','1','','0','0','1','1431068323','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1395396571','1395396571','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(255) NULL ','string','','用户发送 “关键词” 触发','1','','0','0','1','1395395713','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_date','开始时间','int(10) NULL ','datetime','','','1','','0','0','1','1395395676','1395395179','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('experience','消耗经验值','int(10) NULL','num','0','','1','','0','0','1','1419299966','1419299966','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('background','背景图','int(10) UNSIGNED NULL','picture','','图片尺寸建议是760X421 并且主要内容要居中并留出大转盘位置','1','','0','0','1','1419997464','1419997464','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','1','','0','0','1','1431659474','1431659474','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_xydzp_jplist` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`gailv`  int(10) UNSIGNED NULL  DEFAULT 0 COMMENT '中奖概率',
`gailv_str`  varchar(255) NULL  COMMENT '参数',
`xydzp_id`  int(10) UNSIGNED NULL  DEFAULT 0 COMMENT '幸运大转盘关联的活动id',
`jlnum`  int(10) UNSIGNED NULL  DEFAULT 1 COMMENT '奖励数量',
`type`  char(50) NULL  DEFAULT 0 COMMENT '奖品中奖方式',
`gailv_maxnum`  int(10) UNSIGNED NULL  DEFAULT 0 COMMENT '单日发放上限',
`xydzp_option_id`  int(10) UNSIGNED NULL  COMMENT '幸运大转盘关联的全局奖品id',
PRIMARY KEY (`id`),
KEY `xydzp_id` (`xydzp_id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('xydzp_jplist','幸运大转盘奖品列表','0','','1','["gailv","gailv_maxnum"]','1:基础','','','','','xydzp_option_id:奖品名称\r\ngailv:中奖概率（0-100）\r\ngailv_maxnum:单日发放上限\r\nids:操作:jpedit?id=[id]|编辑,jpdel?id=[id]|删除','20','','','1395554963','1419305652','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gailv','中奖概率','int(10) UNSIGNED NULL','num','0','请输入0-100之间的整数','1','','0','0','1','1419303857','1395559151','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gailv_str','参数','varchar(255) NULL','string','','请输入对应中奖方式的相应值 多个以英文状态下的 逗号(,)分隔','0','','0','0','1','1419303819','1395559219','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('xydzp_id','幸运大转盘关联的活动id','int(10) UNSIGNED NULL','num','0','幸运大转盘关联的活动id','0','','0','0','1','1395555019','1395555019','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('jlnum','奖励数量','int(10) UNSIGNED NULL','num','1','中奖后，获得该奖品的数量','0','','0','0','1','1419303776','1395559386','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','奖品中奖方式','char(50) NULL','select','0','选择奖品中奖的方式','0','0:按概率中奖\r\n1:按时间中奖(未启用)\r\n2:按顺序中奖(未启用)\r\n3:按指定用户id中奖(未启用)','0','0','1','1419303723','1395559102','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gailv_maxnum','单日发放上限','int(10) UNSIGNED NULL','num','0','每天最多发放奖品的数量','1','','0','0','1','1395559281','1395559281','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('xydzp_option_id','幸运大转盘关联的全局奖品id','int(10) UNSIGNED NULL','num','','幸运大转盘关联的全局奖品id','0','','0','0','1','1395555085','1395555085','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_xydzp_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  varchar(255) NULL  COMMENT '用户openid',
`message`  text NULL   COMMENT '留言',
`address`  text NULL   COMMENT '收件地址',
`iphone`  varchar(255) NULL   COMMENT '电话',
`zip`  int(10) unsigned NULL   COMMENT '邮编',
`state`  tinyint(2) NULL  DEFAULT 0 COMMENT '领奖状态',
`xydzp_option_id`  int(10) unsigned NULL   DEFAULT 0 COMMENT '奖品id',
`xydzp_id`  int(10) unsigned NULL   DEFAULT 0 COMMENT '活动id',
`zjdate`  int(10) UNSIGNED NULL  COMMENT '中奖时间',
PRIMARY KEY (`id`),
KEY `xydzp_id` (`uid`,xydzp_id)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('xydzp_log','幸运大转盘中奖列表','0','','1','["xydzp_id","xydzp_option_id","zip","iphone","address","message"]','1:基础','','','','','id:编号\r\ntruename:用户名称\r\nopenid:用户ID\r\nmobile:联系电话\r\ntitle:奖品名称\r\nstate|get_name_by_status:领奖状态\r\nzjdate|time_format:中奖时间\r\nid:标记:ylingqu?id=[id]|已领取,wlingqu?id=[id]|未领取','20','','','1395395200','1420358394','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户openid','varchar(255) NULL','string','','','0','','0','0','1','1396686415','1396686415','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('message','留言','text NULL ','string','','','1','','0','0','1','1395395200','1395395200','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','收件地址','text NULL ','string','','','1','','0','0','1','1395395200','1395395200','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('iphone','电话','varchar(255) NULL ','string','','','1','','0','0','1','1395395200','1395395200','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zip','邮编','int(10) unsigned NULL ','string','','','1','','0','0','1','1395395200','1395395200','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','领奖状态','tinyint(2) NULL','bool','0','','0','0:未领取\r\n1:已领取','0','0','1','1396705093','1395395200','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('xydzp_option_id','奖品id','int(10) unsigned NULL ','string','0','','1','','0','0','1','1395395200','1395395200','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('xydzp_id','活动id','int(10) unsigned NULL ','string','0','','1','','0','0','1','1395395200','1395395200','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zjdate','中奖时间','int(10) UNSIGNED NULL','num','','','0','','0','0','1','1396191999','1396191999','','3','','regex','time()','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_xydzp_option` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`jptype`  char(10) NULL   DEFAULT 0 COMMENT '奖品类型',
`duijma`  text NULL  COMMENT '兑奖码',
`title`  varchar(255) NULL   COMMENT '奖品名称',
`pic`  int(10) unsigned NULL   COMMENT '奖品图片',
`miaoshu`  text NULL   COMMENT '奖品描述',
`num`  int(10) unsigned NULL   DEFAULT 0 COMMENT '库存数量',
`isdf`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否为谢谢惠顾类',
`token`  varchar(255) NULL  COMMENT 'Token',
`coupon_id`  int(10) NULL  COMMENT '优惠券编号',
`experience`  int(10) NULL  DEFAULT 0 COMMENT '奖励经验值',
`card_url`  varchar(255) NULL  COMMENT '领取卡券的地址',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('xydzp_option','幸运大转盘奖品库设置','0','','1','["title","jptype","coupon_id","experience","num","pic","miaoshu"]','1:基础','','','','','pic|get_img_html:奖品图片\r\ntitle:奖品名称\r\njptype|get_name_by_status:奖品类型\r\nnum:库存数量\r\nids:操作:jpopedit?id=[id]|编辑,jpopdel?id=[id]|删除','20','title','','1395395190','1419303406','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('jptype','奖品类型','char(10) NULL ','select','0','奖品的类型','1','0:经验值|coupon_id@hide,experience@show,num@show,card_url@hide\r\n1:优惠券|coupon_id@show,experience@hide,num@show,card_url@hide\r\n2:谢谢参与|coupon_id@hide,experience@hide,num@hide,card_url@hide\r\n3:微信卡券|coupon_id@hide,experience@hide,num@show,card_url@show','0','0','1','1420207419','1395395190','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('duijma','兑奖码','text NULL','textarea','','请输入兑奖码，一行一个','0','','0','0','1','1419300292','1396253842','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','奖品名称','varchar(255) NULL ','string','','','1','','0','0','1','1395495283','1395395190','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pic','奖品图片','int(10) unsigned NULL ','picture','','','1','','0','0','1','1395495279','1395395190','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('miaoshu','奖品描述','text NULL ','textarea','','','1','','0','0','1','1418628021','1395395190','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','库存数量','int(10) unsigned NULL ','num','0','','1','','0','0','1','1396667941','1395395190','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('isdf','是否为谢谢惠顾类','tinyint(2) NULL','bool','0','','0','0:中奖品\r\n1:该奖为谢谢惠顾类','0','0','1','1419392345','1396191564','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1395554191','1395554191','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','优惠券编号','int(10) NULL','num','','','1','','0','0','1','1419300336','1419300336','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('experience','奖励经验值','int(10) NULL','num','0','','1','','0','0','1','1419300396','1419300396','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('card_url','领取卡券的地址','varchar(255) NULL','string','','','1','','0','0','1','1420207297','1420207297','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_xydzp_userlog` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  varchar(255) NULL  COMMENT '用户id',
`xydzp_id`  int(10) UNSIGNED NULL  COMMENT '幸运大转盘关联的活动id',
`num`  int(10) UNSIGNED NULL  DEFAULT 0 COMMENT '已经抽奖的次数',
`cjdate`  int(10) NULL  COMMENT '抽奖日期',
PRIMARY KEY (`id`),
KEY `xydzp_id` (`uid`,xydzp_id)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('xydzp_userlog','幸运大转盘用户抽奖记录','0','','1','','1:基础','','','','','','20','','','1395567366','1395567366','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','varchar(255) NULL','string','','用户id','0','','0','0','1','1395567404','1395567404','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('xydzp_id','幸运大转盘关联的活动id','int(10) UNSIGNED NULL','num','','幸运大转盘关联的活动id','0','','0','0','1','1395567452','1395567452','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','已经抽奖的次数','int(10) UNSIGNED NULL','num','0','','1','','0','0','1','1395567486','1395567486','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cjdate','抽奖日期','int(10) NULL','datetime','','','1','','0','0','1','1395567537','1395567537','','3','','regex','time','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_yaotv` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT 'uid',
`date_format`  varchar(30) NULL  COMMENT '开始日期2',
`date`  int(8) NULL  COMMENT '开始日期',
`program_id`  varchar(100) NULL  COMMENT '节目ID',
`name`  varchar(100) NULL  COMMENT '节目名称',
`begin_stamp`  int(10) NULL  COMMENT '节目开始时间',
`end_stamp`  int(10) NULL  COMMENT '节目结束时间',
`desc`  text NULL  COMMENT '节目详情说明',
`act_version`  varchar(255) NULL  COMMENT '微信后台存储的活动信息的版本',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('yaotv','电视节目','0','','1','','1:基础','','','','','','20','','','1426817666','1426817666','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','1','','0','0','1','1430880873','1430880873','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('date_format','开始日期2','varchar(30) NULL','string','','','1','','0','0','1','1430978957','1430978957','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('date','开始日期','int(8) NULL','string','','','1','','0','0','1','1430903905','1430794952','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('program_id','节目ID','varchar(100) NULL','string','','','1','','0','1','1','1426818337','1426818337','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','节目名称','varchar(100) NULL','string','','','1','','0','1','1','1426818392','1426818392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('begin_stamp','节目开始时间','int(10) NULL','datetime','','单位是秒','1','','0','1','1','1426818484','1426818484','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_stamp','节目结束时间','int(10) NULL','datetime','','单位是秒','1','','0','1','1','1426818525','1426818525','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('desc','节目详情说明','text NULL','textarea','','','1','','0','0','1','1426819380','1426819380','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('act_version','微信后台存储的活动信息的版本','varchar(255) NULL','string','','','1','','0','0','1','1426819431','1426819431','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_yaotv_activities` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`is_sync`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否已同步',
`res_url`  varchar(255) NULL  COMMENT '素材URL',
`yaotv_id`  int(10) NULL  COMMENT 'yaotv_id',
`status`  tinyint(2) NULL  DEFAULT 1 COMMENT '状态',
`begin_offset`  int(10) NULL  COMMENT '节目的相对开始时间',
`end_offset`  int(10) NULL  COMMENT '节目的相对结束时间',
`res_id`  varchar(30) NULL  COMMENT '活动所使用的素材ID',
`res_name`  varchar(50) NULL  COMMENT '素材名称',
`res_type`  varchar(255) NULL  COMMENT '资源的类型',
`res_detail`  text NULL  COMMENT '资源的内容',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('yaotv_activities','活动列表','0','','1','','1:基础','','','','','','20','','','1426819474','1426819474','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_sync','是否已同步','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1430966564','1430966564','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('res_url','素材URL','varchar(255) NULL','string','','','1','','0','0','1','1430826963','1430826963','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('yaotv_id','yaotv_id','int(10) NULL','num','','','1','','0','0','1','1430819824','1430819824','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','tinyint(2) NULL','bool','1','','1','1:正常\r\n0:已失效','0','0','1','1430819922','1430819922','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('begin_offset','节目的相对开始时间','int(10) NULL','datetime','','','1','','0','1','1','1426819551','1426819551','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_offset','节目的相对结束时间','int(10) NULL','datetime','','','1','','0','1','1','1426819589','1426819589','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('res_id','活动所使用的素材ID','varchar(30) NULL','string','','','1','','0','1','1','1426819653','1426819653','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('res_name','素材名称','varchar(50) NULL','string','','','1','','0','1','1','1426819711','1426819711','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('res_type','资源的类型','varchar(255) NULL','string','','目前支持URL','1','','0','0','1','1426819772','1426819772','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('res_detail','资源的内容','text NULL','textarea','','','1','','0','0','1','1426819818','1426819818','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_behavior` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`fid`  int(11) NULL   COMMENT '',
`token`  varchar(60) NULL   COMMENT '',
`openid`  varchar(60) NULL   COMMENT '',
`date`  varchar(11) NULL   COMMENT '',
`enddate`  int(11) NULL   COMMENT '',
`model`  varchar(60) NULL   COMMENT '',
`num`  int(11) NULL   COMMENT '',
`keyword`  varchar(60) NULL   COMMENT '',
`type`  tinyint(1) NULL   COMMENT '',
PRIMARY KEY (`id`),
KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_behavior','youaskservice_behavior','0','','1','','1:基础','','','','','','20','','','1404033501','1404033501','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('fid','','int(11) NULL ','string','','','1','','0','0','1','1404033503','1404033503','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','','varchar(60) NULL ','string','','','1','','0','0','1','1404033503','1404033503','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','','varchar(60) NULL ','string','','','1','','0','0','1','1404033503','1404033503','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('date','','varchar(11) NULL ','string','','','1','','0','0','1','1404033504','1404033504','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('enddate','','int(11) NULL ','string','','','1','','0','0','1','1404033504','1404033504','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('model','','varchar(60) NULL ','string','','','1','','0','0','1','1404033504','1404033504','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','','int(11) NULL ','string','','','1','','0','0','1','1404033505','1404033505','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','','varchar(60) NULL ','string','','','1','','0','0','1','1404033505','1404033505','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','','tinyint(1) NULL ','string','','','1','','0','0','1','1404033505','1404033505','','0','','','','0','');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_group` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'token',
`groupname`  varchar(255) NULL  COMMENT '分组名称',
`groupdata`  text NULL  COMMENT '分组数据源',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_group','你问我答-客服分组','0','','1','["groupname"]','1:基础','','','','','id:编号\r\ngroupname:分组名称\r\ntoken:操作:[EDIT]|编辑,[DELETE]|删除','20','groupname','','1404475456','1404491410','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1404485505','1404475530','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('groupname','分组名称','varchar(255) NULL','string','','','1','','0','0','1','1404475556','1404475556','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('groupdata','分组数据源','text NULL','textarea','','','0','','0','0','1','1404476127','1404476127','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_keyword` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`msgkeyword`  varchar(555) NULL  COMMENT '消息关键字',
`msgkeyword_type`  char(50) NULL  DEFAULT 3 COMMENT '关键字类型',
`msgkfaccount`  varchar(255) NULL  COMMENT '接待的客服人员',
`cTime`  int(10) NULL  COMMENT '创建时间',
`token`  varchar(255) NULL  COMMENT 'token',
`msgstate`  tinyint(2) NULL  DEFAULT 1 COMMENT '关键字状态',
`zjnum`  int(10) NULL  COMMENT '转接次数',
`zdtype`  char(10) NULL  DEFAULT 0 COMMENT '指定类型',
`kfgroupid`  int(10) NULL  DEFAULT 0 COMMENT '客服分组id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_keyword','你问我答-关键词指配','0','','1','["msgkeyword","msgkeyword_type","zdtype","msgstate"]','1:基础','','','','','id:编号\r\nmsgkeyword:关键字\r\nmsgkeyword_type|get_name_by_status:匹配类型\r\nmsgkfaccount:指定的接待客服或分组\r\nmsgstate|get_name_by_status:状态\r\nzdtype:操作:[EDIT]|编辑,[DELETE]|删除','20','msgkeyword','','1404399143','1404493938','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgkeyword','消息关键字','varchar(555) NULL','string','','当用户发送的消息中含有关键字时,将自动转到分配的客服人员','1','','0','0','1','1404399336','1404399336','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgkeyword_type','关键字类型','char(50) NULL','select','3','选择关键字匹配的类型','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配','0','0','1','1404399466','1404399466','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgkfaccount','接待的客服人员','varchar(255) NULL','string','','','0','','0','0','1','1404403340','1404399587','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','date','','','0','','0','0','1','1404399629','1404399629','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1404399656','1404399656','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgstate','关键字状态','tinyint(2) NULL','bool','1','停用后用户将不会触发此关键词','1','0:停用\r\n1:启用','0','0','1','1404399749','1404399749','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zjnum','转接次数','int(10) NULL','num','','','0','','0','0','1','1404399784','1404399784','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zdtype','指定类型','char(10) NULL','radio','0','选择关键字匹配时是按指定人员或者指定客服组','1','0:指定客服人员\r\n1:指定客服组','0','0','1','1404474672','1404474672','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('kfgroupid','客服分组id','int(10) NULL','num','0','','0','','0','0','1','1404474777','1404474777','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_logs` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`pid`  int(11) NULL   COMMENT '',
`openid`  varchar(60) NULL   COMMENT '',
`enddate`  int(11) NULL   COMMENT '',
`keyword`  varchar(200) NULL   COMMENT '',
`status`  tinyint(1) NULL   DEFAULT 2 COMMENT '',
PRIMARY KEY (`id`),
KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_logs','你问我答-聊天记录管理','0','','1','["pid","openid","enddate","keyword","status"]','1:基础','','','','','id:编号\r\nkeyword:回复内容\r\nenddate:回复时间','20','keyword','','1403947270','1404060187','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pid','','int(11) NULL ','string','','','1','','0','0','1','1403947272','1403947272','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','','varchar(60) NULL ','string','','','1','','0','0','1','1403947273','1403947273','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('enddate','','int(11) NULL ','string','','','1','','0','0','1','1403947273','1403947273','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','','varchar(200) NULL ','string','','','1','','0','0','1','1403947274','1403947274','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','','tinyint(1) NULL ','string','2','','1','','0','0','1','1403947274','1403947274','','0','','','','0','');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_user` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`name`  varchar(60) NULL   COMMENT '客服昵称',
`token`  varchar(60) NULL   COMMENT 'token',
`userName`  varchar(60) NULL   COMMENT '客服帐号',
`userPwd`  varchar(32) NULL   COMMENT '客服密码',
`endJoinDate`  int(11) NULL   COMMENT '客服加入时间',
`status`  tinyint(1) NULL   DEFAULT 0 COMMENT '客服在线状态',
`state`  tinyint(2) NULL  DEFAULT 0 COMMENT '客服状态',
`isdelete`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否删除',
`kfid`  varchar(255) NULL  COMMENT '客服编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_user','你问我答-客服工号','0','','1','["name","userName","userPwd","state","kfid"]','1:基础','','','','','kfid:编号\r\nname:客服昵称\r\nuserName:客服帐号','20','name','userName','1403947253','1404398415','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','客服昵称','varchar(60) NULL ','string','','','1','','0','0','1','1403959775','1403947255','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(60) NULL ','string','','','0','','0','0','1','1403959638','1403947256','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('userName','客服帐号','varchar(60) NULL ','string','','','1','','0','0','1','1403959752','1403947256','','3','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('userPwd','客服密码','varchar(32) NULL ','string','','','1','','0','0','1','1403959722','1403947257','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('endJoinDate','客服加入时间','int(11) NULL ','string','','','0','','0','0','1','1403959825','1403947257','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','客服在线状态','tinyint(1) NULL ','bool','0','','0','0:离线\r\n1:在线','0','0','1','1404016782','1403947258','','0','','regex','','0','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','客服状态','tinyint(2) NULL','bool','0','','1','0:停用\r\n1:启用','0','0','1','1404016877','1404016877','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('isdelete','是否删除','tinyint(2) NULL','bool','0','','0','0:正常\r\n1:已被删除','0','0','1','1404016931','1404016931','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('kfid','客服编号','varchar(255) NULL','string','','','1','','0','0','1','1404398387','1404398387','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_wechat_enddate` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`openid`  varchar(60) NULL   COMMENT '',
`enddate`  int(11) NULL   COMMENT '',
`joinUpDate`  int(11) NULL   DEFAULT 0 COMMENT '',
`uid`  int(11) NULL   DEFAULT 0 COMMENT '',
`token`  varchar(40) NULL   COMMENT '',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_wechat_enddate','youaskservice_wechat_enddate','0','','1','','1:基础','','','','','','20','','','1404026714','1404026714','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','','varchar(60) NULL ','string','','','1','','0','0','1','1404026716','1404026716','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('enddate','','int(11) NULL ','string','','','1','','0','0','1','1404026716','1404026716','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('joinUpDate','','int(11) NULL ','string','0','','1','','0','0','1','1404026716','1404026716','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','','int(11) NULL ','string','0','','1','','0','0','1','1404026717','1404026717','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','','varchar(40) NULL ','string','','','1','','0','0','1','1404026717','1404026717','','0','','','','0','');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_wechat_grouplist` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`g_id`  varchar(20) NULL   COMMENT '',
`nickname`  varchar(60) NULL   COMMENT '',
`sex`  tinyint(1) NULL   COMMENT '',
`province`  varchar(20) NULL   COMMENT '',
`city`  varchar(30) NULL   COMMENT '',
`headimgurl`  varchar(200) NULL   COMMENT '',
`subscribe_time`  int(11) NULL   COMMENT '',
`token`  varchar(30) NULL   COMMENT '',
`openid`  varchar(60) NULL   COMMENT '',
`status`  tinyint(1) NULL   COMMENT '',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_wechat_grouplist','youaskservice_wechat_grouplist','0','','1','','1:基础','','','','','','20','','','1404027300','1404027300','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('g_id','','varchar(20) NULL ','string','','','1','','0','0','1','1404027302','1404027302','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('nickname','','varchar(60) NULL ','string','','','1','','0','0','1','1404027302','1404027302','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sex','','tinyint(1) NULL ','string','','','1','','0','0','1','1404027303','1404027303','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('province','','varchar(20) NULL ','string','','','1','','0','0','1','1404027303','1404027303','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('city','','varchar(30) NULL ','string','','','1','','0','0','1','1404027303','1404027303','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('headimgurl','','varchar(200) NULL ','string','','','1','','0','0','1','1404027304','1404027304','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('subscribe_time','','int(11) NULL ','string','','','1','','0','0','1','1404027304','1404027304','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','','varchar(30) NULL ','string','','','1','','0','0','1','1404027305','1404027305','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','','varchar(60) NULL ','string','','','1','','0','0','1','1404027305','1404027305','','0','','','','0','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','','tinyint(1) NULL ','string','','','1','','0','0','1','1404027305','1404027305','','0','','','','0','');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_youaskservice_wxlogs` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`opercode`  int(10) NULL  COMMENT '会话状态',
`text`  text NULL  COMMENT '消息',
`time`  int(10) NULL  COMMENT '时间',
`openid`  varchar(255) NULL  COMMENT 'openid',
`token`  varchar(255) NULL  COMMENT 'token',
`worker`  varchar(255) NULL  COMMENT '客服名称',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('youaskservice_wxlogs','你问我答- 微信聊天记录','0','','1','','1:基础','','','','','','20','','','1406094050','1406094093','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('opercode','会话状态','int(10) NULL','num','','','1','','0','0','1','1406094322','1406094322','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('text','消息','text NULL','textarea','','','1','','0','0','1','1406094387','1406094387','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('time','时间','int(10) NULL','datetime','','','1','','0','0','1','1406094341','1406094341','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','openid','varchar(255) NULL','string','','','1','','0','0','1','1406094276','1406094276','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1406094177','1406094177','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('worker','客服名称','varchar(255) NULL','string','','','1','','0','0','1','1406094257','1406094257','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lzwg_vote_option` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`vote_id`  int(10) unsigned NOT NULL   COMMENT '投票ID',
`name`  varchar(255) NOT NULL  COMMENT '选项标题',
`image`  int(10) unsigned NULL   COMMENT '图片选项',
`opt_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '当前选项投票数',
`order`  int(10) unsigned NULL   DEFAULT 0 COMMENT '选项排序',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lzwg_vote_option','投票选项','0','','1','["name","opt_count","order"]','1:基础','','','','','name:选项标题\r\nopt_count:投票数','20','','','1388933346','1429861449','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_id','投票ID','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1388982678','1388933478','','3','','regex','$_REQUEST[\'vote_id\']','3','string');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','选项标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1388933552','1388933552','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('image','图片选项','int(10) unsigned NULL ','picture','','','5','','0','0','1','1388984467','1388933679','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('opt_count','当前选项投票数','int(10) unsigned NULL ','num','0','','1','','0','0','1','1429861248','1388933860','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order','选项排序','int(10) unsigned NULL ','num','0','','1','','0','0','1','1388933951','1388933951','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_vote_option` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`vote_id`  int(10) unsigned NOT NULL   COMMENT '投票ID',
`name`  varchar(255) NOT NULL  COMMENT '选项标题',
`image`  int(10) unsigned NULL   COMMENT '图片选项',
`opt_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '当前选项投票数',
`order`  int(10) unsigned NULL   DEFAULT 0 COMMENT '选项排序',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('vote_option','投票选项','0','','1','["name","opt_count","order"]','1:基础','','','','','name:选项标题\r\nopt_count:投票数','20','','','1388933346','1429861449','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_id','投票ID','int(10) unsigned NOT NULL ','num','','','4','','0','1','1','1388982678','1388933478','','3','','regex','$_REQUEST[\'vote_id\']','3','string');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','选项标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1388933552','1388933552','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('image','图片选项','int(10) unsigned NULL ','picture','','','5','','0','0','1','1388984467','1388933679','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('opt_count','当前选项投票数','int(10) unsigned NULL ','num','0','','1','','0','0','1','1429861248','1388933860','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order','选项排序','int(10) unsigned NULL ','num','0','','1','','0','0','1','1388933951','1388933951','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_virtual` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`goods_id`  int(10) NULL  COMMENT '商品ID',
`account`  varchar(255) NULL  COMMENT '账号',
`password`  varchar(255) NULL  COMMENT '密码',
`is_use`  char(10) NULL  DEFAULT 0 COMMENT '是否已经使用',
`order_id`  int(10) NULL  COMMENT '订单号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_virtual','虚拟物品信息','0','','1','','1:基础','','','','','','10','','','1441006502','1441006502','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品ID','int(10) NULL','num','','','0','','0','0','1','1441006705','1441006705','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('account','账号','varchar(255) NULL','string','','','1','','0','0','1','1441006766','1441006766','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('password','密码','varchar(255) NULL','string','','','1','','0','0','1','1441006785','1441006785','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','是否已经使用','char(10) NULL','radio','0','','1','0:未使用\r\n1:已使用','0','0','1','1441006967','1441006967','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_id','订单号','int(10) NULL','num','','','0','','0','0','1','1441015297','1441015297','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_we_media` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cate_id`  varchar(100) NULL  DEFAULT 0 COMMENT '分类',
`title`  varchar(255) NULL  COMMENT '标题',
`cover_id`  int(10) UNSIGNED NULL  COMMENT '图片',
`music`  int(10) UNSIGNED NULL  COMMENT '背景音乐',
`intro`  text NULL  COMMENT '简介',
`content`  text  NULL  COMMENT '内容',
`init_view_count`  int(10) NULL  DEFAULT 0 COMMENT '初始化阅读数',
`init_digg_count`  int(10) NULL  DEFAULT 0 COMMENT '初始化点赞数',
`is_top`  tinyint(2) NULL  DEFAULT 0 COMMENT '列表置顶',
`ad_top_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '顶部广告类型',
`ad_top_img`  int(10) UNSIGNED NULL  COMMENT '广告图片',
`ad_top_url`  varchar(255) NULL  COMMENT '广告链接',
`ad_bottom_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '底部广告类型',
`ad_bottom_img`  int(10) UNSIGNED NULL  COMMENT '底部广告图片',
`ad_bottom_url`  varchar(255) NULL  COMMENT '底部广告链接',
`author`  varchar(100) NULL  COMMENT '作者名',
`author_url_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '点击作者跳转到',
`author_url`  varchar(255) NULL  COMMENT '自定义链接',
`view_count`  int(10) NULL  DEFAULT 0 COMMENT '阅读数',
`digg_count`  int(10) NULL  DEFAULT 0 COMMENT '点赞数',
`comment_count`  int(10) NULL  DEFAULT 0 COMMENT '评论数',
`uid`  int(10) NULL  COMMENT '用户ID',
`ad_top_count`  int(10) NULL  DEFAULT 0 COMMENT '顶部广告跳转数',
`ad_bottom_count`  int(10) NULL  DEFAULT 0 COMMENT '底部广告跳转数',
`ad_author_count`  int(10) NULL  DEFAULT 0 COMMENT '作者栏跳转数',
`cTime`  int(10) NULL  COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('we_media','自媒体中心','0','','1','["cate_id","title","cover_id","music","intro","content","init_view_count","init_digg_count","is_top","ad_top_type","ad_top_img","ad_top_url","ad_bottom_type","ad_bottom_img","ad_bottom_url","author_url_type","author_url"]','1:基础','','','','','cover_id:主图\r\ntitle:标题\r\ncTime:创建时间\r\nview_count:阅读数\r\nview_count:阅读数\r\ndigg_count:点赞数\r\ncomment_count:评论数\r\nad_top_count:顶部广告跳转数\r\nad_bottom_count:底部广告跳转数\r\nad_author_count:作者栏跳转数\r\n ad_top_img:预览码\r\nid:操作:detail?id=[id]|详细地址,[EDIT]|编辑,[DELETE]|删除','10','title:请输入标题','','1441019906','1441531673','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cate_id','分类','varchar(100) NULL','dynamic_select','0','','1','table=we_media_category&value_field=id','0','1','1','1441520087','1441020109','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NULL','string','','','1','','0','1','1','1441020152','1441020152','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover_id','图片','int(10) UNSIGNED NULL','picture','','','1','','0','1','1','1441020176','1441020176','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('music','背景音乐','int(10) UNSIGNED NULL','file','','','1','','0','0','1','1441020225','1441020225','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','简介','text NULL','textarea','','','1','','0','1','1','1441020258','1441020249','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','text  NULL','editor','','','1','','0','1','1','1441020288','1441020288','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('init_view_count','初始化阅读数','int(10) NULL','num','0','','1','','0','0','1','1441020318','1441020318','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('init_digg_count','初始化点赞数','int(10) NULL','num','0','','1','','0','0','1','1441020355','1441020355','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_top','列表置顶','tinyint(2) NULL','bool','0','','1','0:不置顶\r\n1:置顶','0','0','1','1441020416','1441020416','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_top_type','顶部广告类型','tinyint(2) NULL','bool','0','','1','0:无广告|ad_top_img@hide,ad_top_url@hide\r\n1:我的名片|ad_top_img@hide,ad_top_url@hide\r\n2:自定义|ad_top_img@show,ad_top_url@show','0','0','1','1441020851','1441020736','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_top_img','广告图片','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1441020773','1441020773','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_top_url','广告链接','varchar(255) NULL','string','','','1','','0','0','1','1441020799','1441020799','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_bottom_type','底部广告类型','tinyint(2) NULL','bool','0','','1','0:无广告|ad_bottom_img@hide,ad_bottom_url@hide\r\n1:我的名片|ad_bottom_img@hide,ad_bottom_url@hide\r\n2:自定义|ad_bottom_img@show,ad_bottom_url@show','0','0','1','1441020962','1441020919','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_bottom_img','底部广告图片','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1441021001','1441021001','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_bottom_url','底部广告链接','varchar(255) NULL','string','','','1','','0','0','1','1441021037','1441021037','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('author','作者名','varchar(100) NULL','string','','','0','','0','0','1','1441022764','1441021091','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('author_url_type','点击作者跳转到','tinyint(2) NULL','bool','0','','1','0:作者的名片|author_url@hide\r\n1:自定义链接|author_url@show','0','0','1','1441021268','1441021205','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('author_url','自定义链接','varchar(255) NULL','string','','','1','','0','0','1','1441021239','1441021239','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','阅读数','int(10) NULL','num','0','','0','','0','0','1','1441021330','1441021321','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('digg_count','点赞数','int(10) NULL','num','0','','0','','0','0','1','1441021934','1441021354','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('comment_count','评论数','int(10) NULL','num','0','','0','','0','0','1','1441021437','1441021429','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1441160721','1441160721','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_top_count','顶部广告跳转数','int(10) NULL','num','0','','0','','0','0','1','1441162215','1441162215','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_bottom_count','底部广告跳转数','int(10) NULL','num','0','','0','','0','0','1','1441162247','1441162247','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ad_author_count','作者栏跳转数','int(10) NULL','num','0','','0','','0','0','1','1441162291','1441162291','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1441175906','1441175906','','3','','regex','time','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_we_media_category` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(50) NULL  COMMENT '分类名',
`uid`  int(10) NULL  COMMENT '用户ID',
`manager_id`  int(10) NULL  DEFAULT 0 COMMENT 'manager_id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('we_media_category','自媒体分类','0','','1','["title"]','1:基础','','','','','id:编号\r\ntitle:分类名\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','title','','1441021795','1441022597','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','分类名','varchar(50) NULL','string','','','1','','0','1','1','1441021834','1441021826','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1441160762','1441160762','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','manager_id','int(10) NULL','num','0','','0','','0','0','1','1441527014','1441524944','','3','','regex','get_mid','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_we_media_digg` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户ID',
`media_id`  int(10) NULL  COMMENT '内容ID',
`cTime`  int(10) NULL  COMMENT '点赞时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('we_media_digg','点赞','0','','1','','1:基础','','','','','','10','','','1441176756','1441176756','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1441176785','1441176785','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','内容ID','int(10) NULL','num','','','0','','0','0','1','1441176807','1441176807','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','点赞时间','int(10) NULL','datetime','','','0','','0','0','1','1441176829','1441176829','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_business_card_column` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`type`  char(10) NULL  DEFAULT 0 COMMENT '栏目类型',
`cate_id`  varchar(100) NULL  DEFAULT 0 COMMENT '分类',
`title`  varchar(255) NULL  COMMENT '栏目名称',
`url`  varchar(255) NULL  COMMENT '跳转url',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序',
`business_card_id`  int(10) NULL  COMMENT '名片id',
`uid`  int(10) NULL  COMMENT '用户id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('business_card_column','名片栏目','0','','1','["type","cate_id","title","url","sort"]','1:基础','','','','','type|get_name_by_status:栏目类型\r\ncate_id:分类名\r\ntitle:标题\r\nurl:url\r\nsort:排序\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1441511425','1441782615','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','栏目类型','char(10) NULL','select','0','','1','0:自定义|cate_id@hide,title@show,url@show\r\n1:文章分类|cate_id@show,title@hide,url@hide','0','0','1','1441525619','1441512922','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cate_id','分类','varchar(100) NULL','dynamic_select','0','','1','table=we_media_category&value_field=id','0','0','1','1441525628','1441513085','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','栏目名称','varchar(255) NULL','string','','','1','','0','0','1','1441525667','1441513114','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','跳转url','varchar(255) NULL','string','','','1','','0','0','1','1441525683','1441520141','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序','int(10) NULL','num','0','','1','','0','0','1','1441520666','1441520666','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('business_card_id','名片id','int(10) NULL','num','','','4','','0','0','1','1441779829','1441522726','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','int(10) NULL','num','','','0','','0','0','1','1441781769','1441528808','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_comment` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`aim_table`  varchar(30) NULL  COMMENT '评论关联数据表',
`aim_id`  int(10) NULL  COMMENT '评论关联ID',
`cTime`  int(10) NULL  COMMENT '评论时间',
`follow_id`  int(10) NULL  COMMENT 'follow_id',
`content`  text NULL  COMMENT '评论内容',
`is_audit`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否审核',
`uid`  int(10) NULL  COMMENT 'uid',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('comment','评论互动','0','','1','["is_audit"]','1:基础','','','','','headimgurl|url_img_html:用户头像\r\ntruename|deal_emoji:用户姓名\r\nmobile:手机号码\r\ncontent:留言内容\r\ncTime|time_format:留言时间\r\nids:操作:[DELETE]|删除','20','content:请输入留言内容','','1432602310','1441593284','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_table','评论关联数据表','varchar(30) NULL','string','','','0','','0','0','1','1432602501','1432602501','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','评论关联ID','int(10) NULL','num','','','0','','0','0','1','1432602466','1432602466','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','评论时间','int(10) NULL','datetime','','','0','','0','0','1','1432602404','1432602404','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_id','follow_id','int(10) NULL','num','','','0','','0','1','1','1432602345','1432602345','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','评论内容','text NULL','textarea','','','0','','0','1','1','1432602376','1432602376','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_audit','是否审核','tinyint(2) NULL','bool','0','','1','0:未审核\r\n1:已审核','0','0','1','1435031747','1435029949','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1435561416','1435561392','','3','','regex','get_mid','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_goods_downshelf_user` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`goods_id`  int(10) NULL  COMMENT '商品id',
`down_shelf`  int(10) NULL  DEFAULT 0 COMMENT '是否下架',
`uid`  int(10) NULL  COMMENT '普通用户uid',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_goods_downshelf_user','普通用户下架商品','0','','1','["goods_id","is_down_shelf"]','1:基础','','','','','','10','','','1441700655','1441700989','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品id','int(10) NULL','num','','','1','','0','0','1','1441700844','1441700844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('down_shelf','是否下架','int(10) NULL','num','0','','1','0:下架\r\n1:上架\r\n','0','0','1','1441704190','1441700976','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','普通用户uid','int(10) NULL','num','','','1','','0','0','1','1441701024','1441701024','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1441701045','1441701045','','3','','regex','get_token','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_membership` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`membership`  varchar(255) NULL  COMMENT '会员名',
`condition`  int(10) NULL  DEFAULT 0 COMMENT '升级会员条件',
`uid`  int(10) NULL  COMMENT '企业用户id',
`token`  varchar(255) NULL  COMMENT 'token',
`img`  int(10) UNSIGNED NULL  COMMENT '图标',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_membership','商城会员设置','0','','1','["membership","img","condition"]','1:基础','','','','','img|get_img_html:20%会员图标\r\nmembership:25%会员名\r\ncondition:20%条件（经历值）\r\nid:30%操作:[EDIT]|编辑,[DELETE]|删除','10','membership:请输入会员名','','1441787383','1441857253','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('membership','会员名','varchar(255) NULL','string','','','1','','0','1','1','1441791109','1441788365','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('condition','升级会员条件','int(10) NULL','num','0','以用户经历值做为升级条件','1','','0','0','1','1441857240','1441789777','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','企业用户id','int(10) NULL','num','','','0','','0','0','1','1441790752','1441790752','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1441790783','1441790783','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','图标','int(10) UNSIGNED NULL','picture','','','1','','0','1','1','1441856273','1441855675','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_spec` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(30) NULL  COMMENT '规格名称',
`remark`  varchar(100) NULL  COMMENT '备注',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序',
`uid`  int(10) NULL  COMMENT '用户ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_spec','商品规格','0','','1','["title","remark","sort"]','1:基础','','','','','title:规格名称\r\nremark:规格属性\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title:请输入规格名称','','1441942151','1441943264','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','规格名称','varchar(30) NULL','string','','','1','','0','1','1','1441942269','1441942269','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','varchar(100) NULL','string','','','1','','0','0','1','1441942306','1441942306','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序','int(10) NULL','num','0','排序号越大排列越靠前','1','','0','0','1','1441942462','1441942351','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1441942416','1441942416','','3','','regex','get_mid','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_spec_option` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`spec_id`  int(10) NULL  COMMENT '规格ID',
`name`  varchar(100) NULL  COMMENT '规格属性名称',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_spec_option','商品规格选项','0','','1','','1:基础','','','','','','10','','','1441942503','1441942503','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('spec_id','规格ID','int(10) NULL','num','','','0','','0','0','1','1441942548','1441942548','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','规格属性名称','varchar(100) NULL','string','','','1','','0','1','1','1441942605','1441942605','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL','num','0','排序号越大排列越靠前','1','','0','0','1','1441942637','1441942637','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_distribution_profit` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'token',
`uid`  int(10) NULL  COMMENT 'Uid',
`ctime`  int(10) NULL  COMMENT '返利时间',
`profit`  float(10)  NULL  DEFAULT 0 COMMENT '拥金',
`profit_shop`  int(10) NULL  COMMENT '获得佣金的店铺',
`distribution_percent`  varchar(255) NULL  COMMENT '分销比例',
`order_id`  int(10) NULL  COMMENT '订单id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_distribution_profit','分销用户返利表','0','','1','','1:基础','','','','','','10','','','1441957173','1441957173','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1441957233','1441957233','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','Uid','int(10) NULL','num','','','0','','0','0','1','1441960826','1441957266','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','返利时间','int(10) NULL','datetime','','','1','','0','0','1','1441957292','1441957292','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('profit','拥金','float(10)  NULL','num','0','','1','','0','0','1','1442204022','1441957415','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('profit_shop','获得佣金的店铺','int(10) NULL','num','','','1','','0','0','1','1441961742','1441957488','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('distribution_percent','分销比例','varchar(255) NULL','string','','','1','','0','0','1','1441957786','1441957786','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_id','订单id','int(10) NULL','num','','','1','','0','0','1','1441959316','1441959316','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_attribute` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否显示',
`cate_id`  int(10) UNSIGNED NULL  COMMENT '所属分类ID',
`error_info`  varchar(255) NULL  COMMENT '出错提示',
`sort`  int(10) UNSIGNED NULL  DEFAULT 0 COMMENT '排序号',
`validate_rule`  varchar(255) NULL  COMMENT '正则验证',
`is_must`  tinyint(2) NULL  COMMENT '是否必填',
`remark`  varchar(255) NULL  COMMENT '字段备注',
`token`  varchar(255) NULL  COMMENT 'Token',
`value`  varchar(255) NULL  COMMENT '默认值',
`title`  varchar(255) NOT NULL  COMMENT '字段标题',
`mTime`  int(10) NULL  COMMENT '修改时间',
`extra`  text NULL  COMMENT '参数',
`attr_type`  char(50) NOT NULL  DEFAULT 'string' COMMENT '字段类型',
`type`  tinyint(2) NULL  DEFAULT 0 COMMENT '属性类型',
`name`  varchar(30) NULL  COMMENT '属性标识',
`goods_field`  varchar(50) NULL  COMMENT '商品表中所占用的字段名',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_attribute','分类属性','0','','1','["title","attr_type","extra","value","sort"]','1:基础','','','','','title:字段标题\r\ntype|get_name_by_status:字段类型\r\nextra:参数\r\nsort:排序\r\nids:操作:[EDIT]&cate_id=[cate_id]|编辑,[DELETE]|删除','20','title','','1396061373','1442368516','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','tinyint(2) NULL','select','1','是否显示在表单中','0','1:显示\r\n0:不显示','0','0','1','1396848437','1396848437','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cate_id','所属分类ID','int(10) UNSIGNED NULL','num','','','4','','0','0','1','1396710040','1396690613','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('error_info','出错提示','varchar(255) NULL','string','','验证不通过时的提示语','0','','0','0','1','1396685920','1396685920','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) UNSIGNED NULL','num','0','值越小越靠前','1','','0','0','1','1396685825','1396685825','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('validate_rule','正则验证','varchar(255) NULL','string','','为空表示不作验证','0','','0','0','1','1396685776','1396685776','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_must','是否必填','tinyint(2) NULL','bool','','用于自动验证','0','0:否\r\n1:是','0','0','1','1396685579','1396685579','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','字段备注','varchar(255) NULL','string','','用于表单中的提示','0','','0','0','1','1396685482','1396685482','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('value','默认值','varchar(255) NULL','string','','字段的默认值','1','','0','0','1','1396685291','1396685291','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','字段标题','varchar(255) NOT NULL','string','','请输入字段标题，用于表单显示','1','','0','1','1','1396676830','1396676830','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra','参数','text NULL','textarea','','每行一个参数','1','','0','0','1','1441963175','1396685105','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attr_type','字段类型','char(50) NOT NULL','select','string','用于表单中的展示方式','1','string:单行输入|extra@hide\r\ntextarea:多行输入|extra@hide\r\nradio:单选|extra@show\r\ncheckbox:多选|extra@show\r\nselect:下拉选择|extra@show\r\ndatetime:时间选择|extra@hide\r\npicture:上传图片|extra@hide','0','1','1','1441963886','1396683600','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','属性类型','tinyint(2) NULL','bool','0','','4','0:筛选属性\r\n1:普通属性','0','0','1','1441963898','1441962940','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','属性标识','varchar(30) NULL','string','','','0','','0','0','1','1441963238','1441963238','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_field','商品表中所占用的字段名','varchar(50) NULL','string','','','0','','0','0','1','1442198629','1442198629','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_value` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cate_id`  int(10) UNSIGNED NULL  COMMENT '所属分类ID',
`value`  text NULL  COMMENT '表单值',
`cTime`  int(10) NULL  COMMENT '增加时间',
`openid`  varchar(255) NULL  COMMENT 'OpenId',
`uid`  int(10) NULL  COMMENT '用户ID',
`token`  varchar(255) NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_value','分类扩展属性数据表','0','','1','','1:基础','','','','','','20','','','1396687959','1396687959','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cate_id','所属分类ID','int(10) UNSIGNED NULL','num','','','4','','0','0','1','1396710064','1396688308','','3','','regex','','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('value','表单值','text NULL','textarea','','','0','','0','0','1','1396688355','1396688355','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','增加时间','int(10) NULL','datetime','','','0','','0','0','1','1396688434','1396688434','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenId','varchar(255) NULL','string','','','0','','0','0','1','1396688187','1396688187','','3','','regex','get_openid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1396688042','1396688042','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396690911','1396690911','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_page` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '页面名称',
`ctime`  int(15) NULL  COMMENT '创建时间',
`config`  text NULL  COMMENT '配置参数',
`desc`  text NULL  COMMENT '描述',
`shop_id`  int(10) NULL  COMMENT '店铺ID',
`token`  varchar(255) NULL  COMMENT 'token',
`manager_id`  int(10) NULL  COMMENT '创建者ID',
`use`  varchar(255) NULL  DEFAULT 'page' COMMENT '哪里使用',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_page','自定义页面','0','','1','["title","ctime","config","desc","shop_id","token","manager_id","use"]','1:基础','','','','','title:页面标题\r\nctime|time_format:创建时间\r\nids:操作:preview?id=[id]&target=_blank|预览,[EDIT]|编辑,[DELETE]|删除\r\ncopy:复制链接','10','','','1442202619','1442821956','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','页面名称','varchar(255) NULL','string','','','1','','0','0','1','1442202642','1442202642','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','创建时间','int(15) NULL','datetime','','','1','','0','0','1','1442375202','1442202720','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('config','配置参数','text NULL','textarea','','','1','','0','0','1','1442324638','1442324638','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('desc','描述','text NULL','textarea','','','1','','0','0','1','1442324949','1442324949','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','店铺ID','int(10) NULL','num','','','1','','0','0','1','1442547531','1442547531','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1442548340','1442547553','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','创建者ID','int(10) NULL','num','','','1','','0','0','1','1442548325','1442547593','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use','哪里使用','varchar(255) NULL','string','page','','1','','0','0','1','1442547935','1442547935','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_goods_sku_data` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`goods_id`  int(10) NULL  COMMENT '商品ID',
`cost_price`  decimal(11,2) NULL  DEFAULT 0 COMMENT '成本价',
`market_price`  decimal(11,2) NULL  DEFAULT 0 COMMENT '市场价',
`sale_price`  decimal(11,2) NULL  DEFAULT 0 COMMENT '促销价',
`stock_num`  int(10) NULL  DEFAULT 0 COMMENT '库存量',
`sn_code`  varchar(50) NULL  COMMENT '商品编号',
`sku_int_0`  int(10) NULL  DEFAULT 0 COMMENT '数量规格0',
`sku_int_1`  int(10) NULL  DEFAULT 0 COMMENT '数量规格1',
`sku_int_2`  int(10) NULL  DEFAULT 0 COMMENT '数量规格2',
`sku_varchar_0`  varchar(255) NULL  COMMENT '文本规格0',
`sku_varchar_1`  varchar(255) NULL  COMMENT '文本规格1',
`sku_varchar_2`  varchar(255) NULL  COMMENT '文本规格2',
`spec_option_ids`  varchar(100) NULL  COMMENT '规格属性ID串',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_goods_sku_data','商品规格表','0','','1','["cost_price"]','1:基础','','','','','','10','','','1442221199','1442309479','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品ID','int(10) NULL','num','','','0','','0','0','1','1442221248','1442221248','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cost_price','成本价','decimal(11,2) NULL','num','0','','1','','0','0','1','1442221902','1442221902','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('market_price','市场价','decimal(11,2) NULL','num','0','','0','','0','0','1','1442221974','1442221974','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sale_price','促销价','decimal(11,2) NULL','num','0','','0','','0','0','1','1442283911','1442222057','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('stock_num','库存量','int(10) NULL','num','0','','0','','0','0','1','1442223404','1442223404','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn_code','商品编号','varchar(50) NULL','string','','','0','','0','0','1','1442223451','1442223451','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sku_int_0','数量规格0','int(10) NULL','num','0','','0','','0','0','1','1442223698','1442223592','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sku_int_1','数量规格1','int(10) NULL','num','0','','0','','0','0','1','1442223711','1442223638','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sku_int_2','数量规格2','int(10) NULL','num','0','','0','','0','0','1','1442223754','1442223754','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sku_varchar_0','文本规格0','varchar(255) NULL','string','','','0','','0','0','1','1442223793','1442223793','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sku_varchar_1','文本规格1','varchar(255) NULL','string','','','0','','0','0','1','1442223823','1442223823','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sku_varchar_2','文本规格2','varchar(255) NULL','string','','','0','','0','0','1','1442223852','1442223852','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('spec_option_ids','规格属性ID串','varchar(100) NULL','string','','','0','','0','0','1','1442309448','1442223947','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_goods_sku_config` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`goods_id`  int(10) NULL  DEFAULT 0 COMMENT '商品ID',
`spec_id`  int(10) NULL  DEFAULT 0 COMMENT '规格ID',
`option_id`  int(10) NULL  DEFAULT 0 COMMENT '属性ID',
`img`  int(10) UNSIGNED NULL  COMMENT '属性加图',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_goods_sku_config','商品规格配置','0','','1','','1:基础','','','','','','10','','','1442309511','1442309511','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品ID','int(10) NULL','num','0','','0','','0','0','1','1442309548','1442309548','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('spec_id','规格ID','int(10) NULL','num','0','','0','','0','0','1','1442309580','1442309580','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('option_id','属性ID','int(10) NULL','num','0','','0','','0','0','1','1442309607','1442309607','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','属性加图','int(10) UNSIGNED NULL','picture','','','0','','0','0','1','1442309652','1442309652','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_cashout_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cashout_amount`  float(10) NULL  COMMENT '提现金额',
`remark`  text NULL  COMMENT '备注',
`cashout_account`  varchar(300) NULL  COMMENT '提现账号',
`cashout_status`  int(10) NULL  DEFAULT 0 COMMENT '提现处理状态',
`ctime`  int(10) NULL  COMMENT '提现时间',
`uid`  int(10) NULL  COMMENT 'uid',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_cashout_log','提现记录表','0','','1','["cashout_amount","remark","cashout_status","ctime","token","cashout_account"]','1:基础','','','','','ctime|time_format:申请日期\r\ncashout_amount:申请金额（￥）\r\ntype:提现方式\r\ncashout_account:提现账号\r\nname:账号名称\r\ncashout_status|get_name_by_status:审核状态\r\nremark:详细','10','','','1442315168','1442478119','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cashout_amount','提现金额','float(10) NULL','num','','','1','','0','0','1','1442315267','1442315267','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','text NULL','textarea','','','1','','0','0','1','1442315310','1442315310','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cashout_account','提现账号','varchar(300) NULL','string','','','1','','0','0','1','1442462950','1442315434','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cashout_status','提现处理状态','int(10) NULL','num','0','','1','0:处理中\r\n1:提现成功\r\n2:提现失败','0','0','1','1442315554','1442315554','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','提现时间','int(10) NULL','datetime','','','1','','0','0','1','1442315608','1442315608','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1442315672','1442315631','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1442315658','1442315658','','3','','regex','get_mid','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_coupon` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(30) NULL  COMMENT '优惠券名称',
`num`  int(10) NULL  DEFAULT 0 COMMENT '发放量',
`money`  decimal(11,2) NULL  COMMENT '面值',
`money_max`  decimal(11,2) NULL  DEFAULT 0 COMMENT '最大面值',
`is_money_rand`  tinyint(2) NULL  DEFAULT 0 COMMENT '面值是否随机',
`order_money`  decimal(11,2) NULL  DEFAULT 0 COMMENT '订单金额',
`limit_num`  char(50) NULL  DEFAULT 0 COMMENT '每人限领',
`start_time`  int(10) NULL  COMMENT '生效时间',
`end_time`  int(10) NULL  COMMENT '过期时间',
`limit_goods`  tinyint(2) NULL  DEFAULT 0 COMMENT '可适用商品',
`limit_goods_ids`  varchar(100) NULL  COMMENT '指定的商品',
`is_market_price`  tinyint(2) NULL  DEFAULT 0 COMMENT '仅原价购买商品时可用 ',
`content`  text NULL  COMMENT '使用说明',
`status`  tinyint(2) NULL  DEFAULT 1 COMMENT '状态',
`collect_count`  int(10) NULL  DEFAULT 0 COMMENT '领取数',
`use_count`  int(10) NULL  DEFAULT 0 COMMENT '已使用数',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(100) NULL  COMMENT 'Token',
`cTime`  int(10) NULL  COMMENT '创建时间',
`member`  varchar(100) NULL  DEFAULT 0 COMMENT '选择人群',
`type`  char(10) NULL  DEFAULT 0 COMMENT '优惠券类型',
`is_del`  int(10) NULL  DEFAULT 0 COMMENT '是否删除',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_coupon','代金券','0','','1','["title","num","money","money_max","is_money_rand","order_money","limit_num","start_time","end_time","limit_goods","limit_goods_ids","is_market_price","content","member","type"]','1:基础','','','','','title:代金券名称\r\nmoney:面值\r\nlimit_num:领取限制\r\nstart_time:有效期\r\ncollect_count:已领取\r\nuse_count:已使用\r\nids:操作:preview?id=[id]|预览,lists?_controller=Sn&target_id=[id]|领取记录,sncode_lists?id=[id]|核销记录,[EDIT]|编辑,[DELETE]|删除,index&_addons=ShopCoupon&_controller=Wap&id=[id]|复制链接','10','title:请输入代金券名称搜索','','1442390631','1445565340','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','优惠券名称','varchar(30) NULL','string','','','1','','0','1','1','1442390791','1442390791','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','发放量','int(10) NULL','num','0','','1','','0','1','1','1442390822','1442390822','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','面值','decimal(11,2) NULL','num','','','1','','0','1','1','1442390916','1442390916','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money_max','最大面值','decimal(11,2) NULL','num','0','','1','','0','0','1','1444650857','1442390963','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_money_rand','面值是否随机','tinyint(2) NULL','bool','0','','1','0:否|money_max@hide\r\n1:是|money_max@show','0','0','1','1442391067','1442391067','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_money','订单金额','decimal(11,2) NULL','num','0','满多少可以使用，0表示不限制','1','','0','0','1','1442391194','1442391194','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('limit_num','每人限领','char(50) NULL','select','0','','1','0:不限张\r\n1:1张\r\n2:2张\r\n3:3张\r\n4:4张\r\n5:5张\r\n10:10张','0','0','1','1442391505','1442391505','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','生效时间','int(10) NULL','datetime','','','1','','0','1','1','1442391577','1442391534','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','过期时间','int(10) NULL','datetime','','','1','','0','1','1','1442391587','1442391560','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('limit_goods','可适用商品','tinyint(2) NULL','bool','0','','1','0:全店适用|limit_gooods_ids@hide\r\n1:指定商品适用|limit_gooods_ids@show','0','0','1','1442391793','1442391793','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('limit_goods_ids','指定的商品','varchar(100) NULL','string','','','1','','0','0','1','1442391948','1442391948','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_market_price','仅原价购买商品时可用 ','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1442392119','1442392119','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','使用说明','text NULL','textarea','','','1','','0','0','1','1442392183','1442392183','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','tinyint(2) NULL','bool','1','','0','0:失效\r\n1:正常','0','0','1','1442392723','1442392723','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_count','领取数','int(10) NULL','num','0','','0','','0','0','1','1442392753','1442392753','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_count','已使用数','int(10) NULL','num','0','','0','','0','0','1','1442392790','1442392790','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1442392818','1442392818','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1442392843','1442392843','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1442392869','1442392869','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('member','选择人群','varchar(100) NULL','checkbox','0','','1','0:所有用户\r\n-1:所有会员','0','0','1','1446101088','1444620516','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','优惠券类型','char(10) NULL','radio','0','','1','0:优惠券\r\n1:代金券\r\n2:礼品券','0','0','1','1444649770','1444649770','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否删除','int(10) NULL','num','0','','0','','0','0','1','1446119655','1446119655','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_cashout_account` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`account`  varchar(255) NULL  COMMENT '提现账号',
`type`  char(50) NULL  COMMENT '提现方式',
`name`  varchar(255) NULL  COMMENT '姓名',
`uid`  int(10) NULL  COMMENT 'uid',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_cashout_account','提现账号','0','','1','','1:基础','','','','','','10','','','1442396922','1442396922','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('account','提现账号','varchar(255) NULL','string','','','1','','0','0','1','1442396978','1442396978','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','提现方式','char(50) NULL','radio','','','1','0:支付宝\r\n1:银行','0','0','1','1442397717','1442397066','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','姓名','varchar(255) NULL','string','','','1','','0','0','1','1442397096','1442397096','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','1','','0','0','1','1442397118','1442397118','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1442397139','1442397139','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_reward` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(100) NULL  COMMENT '活动名称',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '过期时间',
`is_mult`  tinyint(2) NULL  DEFAULT 0 COMMENT '多级优惠',
`is_all_goods`  tinyint(2) NULL  DEFAULT 0 COMMENT '适用的活动商品',
`goods_ids`  text NULL  COMMENT '指定商品ID串',
`cTime`  int(10) NULL  COMMENT '创建时间',
`token`  varchar(50) NULL  COMMENT 'Token',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_reward','促销活动','0','','1','["title","start_time","end_time","is_mult","is_all_goods"]','1:基础','','','','','title:活动名称\r\nstart_time:有效期\r\nstatus:活动状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title:请输入活动名称搜索','','1442457808','1442544407','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(100) NULL','string','','','1','','0','1','1','1442457852','1442457852','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1442457879','1442457879','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','过期时间','int(10) NULL','datetime','','','1','','0','1','1','1442457902','1442457902','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_mult','多级优惠','tinyint(2) NULL','bool','0','多级情况下每级优惠不累积叠加','1','0:否\r\n1:是','0','0','1','1442458033','1442458011','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_all_goods','适用的活动商品','tinyint(2) NULL','bool','0','','1','0:全部商品参与\r\n1:指定商品参与','0','0','1','1442458365','1442458365','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_ids','指定商品ID串','text NULL','textarea','','','0','','0','0','1','1442540989','1442458406','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1442458439','1442458439','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','0','1','1442458480','1442458480','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1442458516','1442458516','','3','','regex','get_mid','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_reward_condition` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`condition`  decimal(11,2) NULL  COMMENT '条件',
`reward_id`  int(10) NULL  COMMENT '活动ID',
`money`  tinyint(2) NULL  COMMENT '现在开关',
`money_param`  decimal(11,2) NULL  COMMENT '现金参数',
`postage`  tinyint(2) NULL  DEFAULT 0 COMMENT '免邮',
`score`  tinyint(2) NULL  DEFAULT 0 COMMENT '积分开关',
`score_param`  int(10) NULL  COMMENT '积分参数',
`shop_coupon`  tinyint(2) NULL  DEFAULT 0 COMMENT '优惠券开关',
`shop_coupon_param`  int(10) NULL  COMMENT '优惠券ID',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_reward_condition','优惠条件','0','','1','','1:基础','','','','','','10','','','1442458767','1442458767','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('condition','条件','decimal(11,2) NULL','num','','满多少元','1','','0','1','1','1442458834','1442458834','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reward_id','活动ID','int(10) NULL','num','','','0','','0','0','1','1442458906','1442458906','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','现在开关','tinyint(2) NULL','bool','','','0','0:关\r\n1:开','0','0','1','1442542127','1442542127','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money_param','现金参数','decimal(11,2) NULL','num','','','1','','0','0','1','1442542160','1442542160','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('postage','免邮','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1442542224','1442542224','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分开关','tinyint(2) NULL','bool','0','','1','0:关\r\n1:开','0','0','1','1442542268','1442542268','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score_param','积分参数','int(10) NULL','num','','','1','','0','0','1','1442542292','1442542292','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_coupon','优惠券开关','tinyint(2) NULL','bool','0','','1','0:关\r\n1:开','0','0','1','1442542329','1442542329','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_coupon_param','优惠券ID','int(10) NULL','num','','','1','','0','0','1','1442542366','1442542366','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL','num','0','','1','','0','0','1','1442544909','1442544909','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_distribution_user` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户id',
`enable`  char(10) NULL  DEFAULT 0 COMMENT '是否启用',
`branch_id`  varchar(255) NULL  COMMENT '授权门店',
`ctime`  int(10) NULL  COMMENT '创建时间',
`token`  varchar(255) NULL  COMMENT 'token',
`qr_code`  varchar(255) NULL  COMMENT '二维码',
`fans_gift_money`  int(10) NULL  DEFAULT 0 COMMENT '转发增粉奖励金额',
`fans_gift_score`  int(10) NULL  DEFAULT 0 COMMENT '转发增粉奖励积分',
`fans_gift_shop_coupon`  int(10) NULL  DEFAULT 0 COMMENT '转发增粉奖励代金券',
`fans_gift_coupon`  int(10) NULL  DEFAULT 0 COMMENT '转发增粉奖励优惠券',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_distribution_user','分销用户','0','','1','["uid","enable","qr_code"]','1:基础','','','','','id:序号\r\ntruename:姓名\r\nmobile:手机号\r\nuid:微信昵称\r\nctime|time_format:创建时间\r\nqr_code:二维码\r\nenable|get_name_by_status:是否启用\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','truename:请输入姓名','','1442922612','1442990055','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','int(10) NULL','num','','','1','','0','0','1','1442922644','1442922644','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('enable','是否启用','char(10) NULL','radio','0','','1','0:否\r\n1:是','0','0','1','1442922940','1442922940','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('branch_id','授权门店','varchar(255) NULL','cascade','','','0','type=db&table=coupon_shop&branch_id=id','0','0','1','1443186424','1442923081','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1443002634','1442923109','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1442924496','1442923193','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('qr_code','二维码','varchar(255) NULL','string','','','1','','0','0','1','1442975336','1442975336','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('fans_gift_money','转发增粉奖励金额','int(10) NULL','num','0','','0','','0','0','1','1445492396','1445491625','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('fans_gift_score','转发增粉奖励积分','int(10) NULL','num','0','','0','','0','0','1','1445492390','1445491653','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('fans_gift_shop_coupon','转发增粉奖励代金券','int(10) NULL','num','0','','0','','0','0','1','1445492384','1445491691','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('fans_gift_coupon','转发增粉奖励优惠券','int(10) NULL','num','0','','0','','0','0','1','1445492377','1445491720','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_material_text` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`content`  text NULL  COMMENT '文本内容',
`token`  varchar(50) NULL  COMMENT 'Token',
`uid`  int(10) NULL  COMMENT 'uid',
`is_use`  int(10) NULL  DEFAULT 1 COMMENT '可否使用',
`aim_id`  int(10) NULL  COMMENT '添加来源标识id',
`aim_table`  varchar(255) NULL  COMMENT '来源表名',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('material_text','文本素材','0','','1','["content"]','1:基础','','','','','id:编号\r\ncontent:文本内容\r\nids:操作:text_edit?id=[id]|编辑,text_del?id=[id]|删除','10','content:请输入文本内容搜索','','1442976119','1442977453','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','文本内容','text NULL','textarea','','','1','','0','1','1','1442976151','1442976151','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','0','1','1442978004','1442978004','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1442978041','1442978041','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','可否使用','int(10) NULL','num','1','','0','0:不可用\r\n1:可用','0','0','1','1445496947','1445496947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','添加来源标识id','int(10) NULL','num','','','0','','0','0','1','1445497010','1445497010','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_table','来源表名','varchar(255) NULL','string','','','0','','0','0','1','1445497218','1445497218','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_material_file` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`file_id`  int(10) NULL  COMMENT '上传文件',
`cover_url`  varchar(255) NULL  COMMENT '本地URL',
`media_id`  varchar(100) NULL  DEFAULT 0 COMMENT '微信端图文消息素材的media_id',
`wechat_url`  varchar(255) NULL  COMMENT '微信端的文件地址',
`cTime`  int(10) NULL  COMMENT '创建时间',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(100) NULL  COMMENT 'Token',
`title`  varchar(100) NULL  COMMENT '素材名称',
`type`  int(10) NULL  COMMENT '类型',
`introduction`  text NULL  COMMENT '视频描述',
`is_use`  int(10) NULL  DEFAULT 1 COMMENT '可否使用',
`aim_id`  int(10) NULL  COMMENT '添加来源标识id',
`aim_table`  varchar(255) NULL  COMMENT '来源表名',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('material_file','文件素材','0','','1','["title","file_id"]','1:基础','','','','','','10','','','1438684613','1442982212','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('file_id','上传文件','int(10) NULL','file','','','1','','0','0','1','1442982169','1438684652','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover_url','本地URL','varchar(255) NULL','string','','','0','','0','0','1','1438684692','1438684692','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','微信端图文消息素材的media_id','varchar(100) NULL','string','0','','0','','0','0','1','1438744962','1438684776','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wechat_url','微信端的文件地址','varchar(255) NULL','string','','','0','','0','0','1','1439973558','1438684807','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1443004484','1438684829','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1442982446','1438684847','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NULL','string','','','0','','0','0','1','1442982460','1438684865','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','素材名称','varchar(100) NULL','string','','','1','','0','0','1','1442981165','1442981165','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','类型','int(10) NULL','num','','','0','1:语音素材\r\n2:视频素材','0','0','1','1445599238','1443006101','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('introduction','视频描述','text NULL','textarea','','','1','','0','0','1','1445684769','1445684769','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_use','可否使用','int(10) NULL','num','1','','0','0:不可用\r\n1:可用','0','0','1','1447901346','1447901346','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_id','添加来源标识id','int(10) NULL','num','','','0','','0','0','1','1447901383','1447901383','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aim_table','来源表名','varchar(255) NULL','string','','','0','','0','0','1','1447901415','1447901415','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_statistics_follow` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '粉丝id',
`duid`  int(10) NULL  COMMENT '分销用户id',
`ctime`  int(10) NULL  COMMENT '关注时间',
`token`  varchar(255) NULL  COMMENT 'token',
`openid`  varchar(255) NULL  COMMENT '粉丝openid',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_statistics_follow','分销粉丝统计表','0','','1','["uid","duid","ctime","token"]','1:基础','','','','','','10','','','1443001407','1443002218','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','粉丝id','int(10) NULL','num','','','1','','0','0','1','1443001489','1443001489','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('duid','分销用户id','int(10) NULL','num','','','1','','0','0','1','1443001536','1443001536','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','关注时间','int(10) NULL','datetime','','','1','','0','0','1','1443001584','1443001584','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1443001620','1443001620','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','粉丝openid','varchar(255) NULL','string','','','1','','0','0','1','1443010994','1443010994','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_servicer` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户选择',
`truename`  varchar(255) NULL  COMMENT '真实姓名',
`mobile`  varchar(255) NULL  COMMENT '手机号',
`role`  varchar(100) NULL  DEFAULT 0 COMMENT '授权列表',
`enable`  int(10) NULL  DEFAULT 1 COMMENT '是否启用',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('servicer','授权用户','0','','1','["uid","truename","mobile","role","enable"]','1:基础','','','','','truename:姓名\r\nrole:权限列表\r\nnickname:微信名称\r\nenable|get_name_by_status:是否启用\r\nids:操作:set_enable?id=[id]&enable=[enable]|改变启用状态,[EDIT]|编辑,[DELETE]|删除','10','truename','','1443066649','1445932371','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户选择','int(10) NULL','user','','','1','','0','1','1','1445325351','1443066688','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('truename','真实姓名','varchar(255) NULL','string','','','1','','0','1','1','1445325390','1443066736','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mobile','手机号','varchar(255) NULL','string','','','1','','0','1','1','1445325401','1443066833','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('role','授权列表','varchar(100) NULL','checkbox','0','','1','1:微信客服\r\n2:扫码验证\r\n3:微订单接单','0','1','1','1445325510','1443067065','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('enable','是否启用','int(10) NULL','radio','1','','1','0:禁用\r\n1:启用','0','0','1','1443067721','1443067149','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1443067647','1443067638','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_coupon` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`background`  int(10) UNSIGNED NULL  COMMENT '素材背景图',
`keyword`  varchar(100) NULL  COMMENT '关键词',
`use_tips`  text NULL  COMMENT '使用说明',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NULL  COMMENT '封面简介',
`end_time`  int(10) NULL  COMMENT '领取结束时间',
`cover`  int(10) unsigned NULL   COMMENT '优惠券图片',
`cTime`  int(10) unsigned NULL   COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_tips`  text NULL  COMMENT '领取结束说明',
`end_img`  int(10) unsigned NULL   COMMENT '领取结束提示图片',
`num`  int(10) unsigned NULL   DEFAULT 0 COMMENT '优惠券数量',
`max_num`  int(10) unsigned NULL   DEFAULT 1 COMMENT '每人最多允许获取次数',
`follower_condtion`  char(50) NULL  DEFAULT 1 COMMENT '粉丝状态',
`credit_conditon`  int(10) unsigned NULL   DEFAULT 0 COMMENT '积分限制',
`credit_bug`  int(10) unsigned NULL   DEFAULT 0 COMMENT '积分消费',
`addon_condition`  varchar(255) NULL  COMMENT '插件场景限制',
`collect_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '已领取数',
`view_count`  int(10) unsigned NULL   DEFAULT 0 COMMENT '浏览人数',
`addon`  char(50) NULL  DEFAULT 'public' COMMENT '插件',
`shop_uid`  varchar(255) NULL  COMMENT '商家管理员ID',
`use_count`  int(10) NULL  DEFAULT 0 COMMENT '已使用数',
`pay_password`  varchar(255) NULL  COMMENT '核销密码',
`empty_prize_tips`  varchar(255) NULL  COMMENT '奖品抽完后的提示',
`start_tips`  varchar(255) NULL  COMMENT '活动还没开始时的提示语',
`more_button`  text NULL  COMMENT '其它按钮',
`over_time`  int(10) NULL  COMMENT '使用的截止时间',
`use_start_time`  int(10) NULL  COMMENT '使用开始时间',
`shop_name`  varchar(255) NULL  DEFAULT '优惠商家' COMMENT '商家名称',
`shop_logo`  int(10) UNSIGNED NULL  COMMENT '商家LOGO',
`head_bg_color`  varchar(255) NULL  DEFAULT '#35a2dd' COMMENT '头部背景颜色',
`button_color`  varchar(255) NULL  DEFAULT '#0dbd02' COMMENT '按钮颜色',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '素材模板',
`member`  varchar(100) NULL  DEFAULT 0 COMMENT '选择人群',
`is_del`  int(10) NULL  DEFAULT 0 COMMENT '是否删除',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('coupon','优惠券','0','','1','["title","use_tips","start_time","end_time","num","max_num","over_time","background","use_start_time","member"]','1:基础','','','','','id:编号\r\ntitle:标题\r\nnum:计划发送数\r\ncollect_count:已领取数\r\nuse_count:已使用数\r\nstart_time|time_format:开始时间\r\nend_time|time_format:结束时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|领取记录,sncode_lists?id=[id]|核销记录,preview?id=[id]&target=_blank|预览,index&_addons=Coupon&_controller=Wap?id=[id]|复制链接','20','title','','1396061373','1445567658','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('background','素材背景图','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1422000992','1422000992','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NULL','string','','','0','','0','0','1','1422330526','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_tips','使用说明','text NULL','editor','','用户获取优惠券后显示的提示信息','1','','0','0','1','1444898231','1399259489','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NULL','textarea','','','0','','0','0','1','1418885972','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','领取结束时间','int(10) NULL','datetime','','','1','','0','0','1','1427161023','1399259433','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','优惠券图片','int(10) unsigned NULL ','picture','','','0','','0','0','1','1444897658','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) unsigned NULL ','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','0','1','1422330558','1399259416','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_tips','领取结束说明','text NULL','textarea','','活动过期或者结束说明','0','','0','0','1','1444897700','1399259570','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_img','领取结束提示图片','int(10) unsigned NULL ','picture','','可为空','0','','0','0','1','1444897717','1400989793','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','优惠券数量','int(10) unsigned NULL ','num','0','0表示不限制数量','1','','0','0','1','1399259838','1399259808','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('max_num','每人最多允许获取次数','int(10) unsigned NULL ','num','1','0表示不限制数量','1','','0','0','1','1421750268','1399260079','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follower_condtion','粉丝状态','char(50) NULL','select','1','粉丝达到设置的状态才能获取','0','0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员','0','0','1','1418885814','1399260479','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_conditon','积分限制','int(10) unsigned NULL ','num','0','粉丝达到多少积分后才能领取，领取后不扣积分','0','','0','0','1','1418885804','1399260618','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_bug','积分消费','int(10) unsigned NULL ','num','0','用积分中的财富兑换、兑换后扣除相应的积分财富','0','','0','0','1','1418885794','1399260764','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_condition','插件场景限制','varchar(255) NULL','string','','格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示','0','','0','0','1','1418885827','1399261026','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_count','已领取数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1400992246','1399270900','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','浏览人数','int(10) unsigned NULL ','num','0','','0','','0','0','1','1399270926','1399270926','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon','插件','char(50) NULL','select','public','','0','public:通用\r\ninvite:微邀约','0','0','1','1418885638','1418885638','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_uid','商家管理员ID','varchar(255) NULL','string','','','0','','0','0','1','1421750246','1418900122','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_count','已使用数','int(10) NULL','num','0','','0','','0','0','1','1418910237','1418910237','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pay_password','核销密码','varchar(255) NULL','string','','','0','','0','0','1','1444709270','1420875229','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('empty_prize_tips','奖品抽完后的提示','varchar(255) NULL','string','','不填写时默认显示：您来晚了，优惠券已经领取完','0','','0','0','1','1444897869','1421394267','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_tips','活动还没开始时的提示语','varchar(255) NULL','string','','','0','','0','0','1','1444897849','1423134546','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('more_button','其它按钮','text NULL','textarea','','格式：按钮名称|按钮跳转地址，每行一个。如：查看官网|http://weiphp.cn','0','','0','0','1','1444897830','1423193853','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('over_time','使用的截止时间','int(10) NULL','datetime','','券的使用截止时间，为空时表示不限制','1','','0','0','1','1427161334','1427161118','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_start_time','使用开始时间','int(10) NULL','datetime','','','1','','0','1','1','1427280116','1427280008','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_name','商家名称','varchar(255) NULL','string','优惠商家','','0','','0','0','1','1444897811','1427280255','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_logo','商家LOGO','int(10) UNSIGNED NULL','picture','','','0','','0','0','1','1444897797','1427280293','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('head_bg_color','头部背景颜色','varchar(255) NULL','string','#35a2dd','','0','','0','0','1','1444897785','1427282785','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('button_color','按钮颜色','varchar(255) NULL','string','#0dbd02','','0','','0','0','1','1444897771','1427282886','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','素材模板','varchar(255) NULL','string','default','','0','','0','0','1','1444897755','1430127336','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('member','选择人群','varchar(100) NULL','checkbox','0','','1','0:所有用户\r\n-1:所有会员','0','0','1','1444821380','1444821380','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否删除','int(10) NULL','num','0','','0','','0','0','1','1446119564','1446119564','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_coupon_shop` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`name`  varchar(100) NULL  COMMENT '店名',
`address`  varchar(255) NULL  COMMENT '详细地址',
`phone`  varchar(30) NULL  COMMENT '联系电话',
`gps`  varchar(50) NULL  COMMENT 'GPS经纬度',
`coupon_id`  int(10) NULL  COMMENT '所属优惠券编号',
`token`  varchar(255) NULL  COMMENT 'token',
`manager_id`  int(10) NULL  COMMENT '管理员id',
`open_time`  varchar(50) NULL  COMMENT '营业时间',
`img`  int(10) UNSIGNED NULL  COMMENT '门店展示图',
`auth_group`  int(10) NULL  COMMENT '门店用户组',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('coupon_shop','适用门店','0','','1','["name","address","gps","phone","open_time","img"]','1:基础','','','','','name:店名\r\nphone:联系电话\r\naddress:详细地址\r\nimg|get_cover_url:展示图\r\nauth_group:用户组\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','20','name:店名搜索','','1427164604','1448157992','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','店名','varchar(100) NULL','string','','','1','','0','1','1','1427164635','1427164635','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','详细地址','varchar(255) NULL','string','','','1','','0','1','1','1427164668','1427164668','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('phone','联系电话','varchar(30) NULL','string','','','1','','0','0','1','1427166529','1427164707','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gps','GPS经纬度','varchar(50) NULL','string','','格式：经度,纬度','1','','0','0','1','1427371523','1427164833','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','所属优惠券编号','int(10) NULL','num','','','4','','0','0','1','1427165806','1427165806','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1440071867','1440071805','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员id','int(10) NULL','num','','','0','','0','0','1','1440071927','1440071917','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('open_time','营业时间','varchar(50) NULL','string','','','1','','0','0','1','1443106576','1443106576','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','门店展示图','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1447060275','1447060275','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('auth_group','门店用户组','int(10) NULL','num','','','4','','0','0','1','1448156196','1448156158','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_coupon_shop_link` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`coupon_id`  int(10) NULL  COMMENT 'coupon_id',
`shop_id`  int(10) NULL  COMMENT 'shop_id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('coupon_shop_link','门店关联','0','','1','','1:基础','','','','','','20','','','1427356350','1427356350','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','coupon_id','int(10) NULL','num','','','1','','0','0','1','1427356371','1427356371','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_id','shop_id','int(10) NULL','num','','','1','','0','0','1','1427356387','1427356387','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_help_open` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(100) NULL  COMMENT '活动名称',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '过期时间',
`limit_num`  int(10) NULL  DEFAULT 5 COMMENT '帮拆人数限制',
`content`  text  NULL  COMMENT '活动规则',
`token`  varchar(50) NULL  COMMENT 'token',
`manager_id`  int(10) NULL  COMMENT 'manager_id',
`prize_num`  int(10) NULL  COMMENT '大礼包数量',
`status`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否开启',
`collect_tips`  text NULL  COMMENT '领取说明',
`share_icon`  int(10) UNSIGNED NULL  COMMENT '分享图标',
`share_title`  varchar(100) NULL  COMMENT '分享标题',
`share_intro`  varchar(255) NULL  COMMENT '分享简介',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('help_open','帮拆礼包','0','','1','["title","start_time","end_time","limit_num","content","prize_num","status","collect_tips","share_icon","share_title","share_intro"]','1:基础','','','','','title:礼包名称\r\nstatus:状态\r\nprize_num:大礼包总数\r\ncollect_num:大礼包领取\r\nlimit_num:分享要求\r\ntotal:领取总数\r\nstart_time:有效期\r\nid:操作:[EDIT]|编辑,prize_lists?id=[id]|获奖查询,share_lists?id=[id]|分享记录,sncode_lists?id=[id]|核销记录,[DELETE]|删除,preview?id=[id]|预览,index&_addons=HelpOpen&_controller=Wap&id=[id]&invite_uid=1|复制链接','10','title:请输入活动名称','','1443108580','1446429456','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(100) NULL','string','','','1','','0','1','1','1443111611','1443111611','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','0','1','1443111673','1443111673','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','过期时间','int(10) NULL','datetime','','','1','','0','0','1','1443111693','1443111693','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('limit_num','帮拆人数限制','int(10) NULL','num','5','多少好友帮拆开礼包才有效','1','','0','0','1','1443111821','1443111821','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','活动规则','text  NULL','textarea','','','1','','0','0','1','1445078360','1443111915','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(50) NULL','string','','','0','','0','0','1','1443148889','1443148889','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','manager_id','int(10) NULL','num','','','0','','0','0','1','1443148912','1443148912','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_num','大礼包数量','int(10) NULL','num','','','1','','0','0','1','1445078232','1445057624','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','是否开启','tinyint(2) NULL','bool','1','','1','0:禁用\r\n1:启用','0','0','1','1445072096','1445072096','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_tips','领取说明','text NULL','textarea','','','1','','0','0','1','1445072703','1445072703','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('share_icon','分享图标','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1445078407','1445078407','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('share_title','分享标题','varchar(100) NULL','string','','','1','','0','0','1','1445078427','1445078427','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('share_intro','分享简介','varchar(255) NULL','string','','','1','','0','0','1','1445078450','1445078450','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_help_open_user` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`invite_uid`  int(10) NULL  COMMENT '邀请人ID',
`friend_uid`  int(10) NULL  COMMENT '帮拆人ID',
`help_id`  int(10) NULL  COMMENT '活动ID',
`cTime`  int(10) NULL  COMMENT '创建时间',
`sn_id`  int(10) NULL  COMMENT 'sn',
`join_count`  int(10) NULL  DEFAULT 0 COMMENT '领取数量',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('help_open_user','帮拆参与人记录','0','','1','["cTime","join_count"]','1:基础','','','','','userface: 用户头像\r\nnickname:分享用户\r\njoin_count:获取数量\r\ncTime:分享时间\r\nids:操作:collect_lists?invite_uid=[invite_uid]&help_id=[help_id]|获取人列表','10','title:请输入分享用户名称','','1443141956','1445261503','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('invite_uid','邀请人ID','int(10) NULL','num','','','0','','0','0','1','1443141991','1443141991','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('friend_uid','帮拆人ID','int(10) NULL','num','','','0','','0','0','1','1443142036','1443142036','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('help_id','活动ID','int(10) NULL','num','','','0','','0','0','1','1443142057','1443142057','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','num','','','1','','0','0','1','1443142208','1443142208','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn_id','sn','int(10) NULL','num','','','0','','0','0','1','1445240730','1444462169','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('join_count','领取数量','int(10) NULL','num','0','','1','','0','0','1','1445240488','1445240488','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_vote` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '活动名称',
`select_type`  char(10) NULL  DEFAULT 1 COMMENT '投票类型',
`multi_num`  int(10) NULL  DEFAULT 0 COMMENT '多选限制',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '结束时间',
`remark`  text NULL  COMMENT '活动说明',
`token`  varchar(255) NULL  COMMENT 'token',
`manager_id`  int(10) NULL  COMMENT '管理员id',
`is_verify`  tinyint(2) NULL  DEFAULT 0 COMMENT '投票是否需要填写验证码',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_vote','商城微投票','0','','1','["title","select_type","multi_num","start_time","end_time","is_verify","remark"]','1:基础','','','','','title:活动名称\r\nselect_type|get_name_by_status:投票类型\r\nstart_time|time_format:开始时间\r\nend_time|time_format:结束时间\r\nremark:活动说明\r\nids:操作:[EDIT]&id=[id]|编辑,[DELETE]|删除,option_lists&vote_id=[id]|投票选项,show_log&vote_id=[id]|投票记录,preview&vote_id=[id]|预览,index&_addons=Vote&_controller=Wap&vote_id=[id]|复制链接','10','title:请输入活动名称','','1443148496','1445997045','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(255) NULL','string','','','1','','0','1','1','1443148922','1443148534','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('select_type','投票类型','char(10) NULL','radio','1','','1','1:单选|multi_num@hide\r\n2:多选|multi_num@show','0','0','1','1443148839','1443148618','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('multi_num','多选限制','int(10) NULL','num','0','0代表不限制','1','','0','0','1','1443148734','1443148734','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1443148948','1443148880','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','1','1','1443148958','1443148911','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','活动说明','text NULL','textarea','','','1','','0','0','1','1443149020','1443149020','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1443149050','1443149050','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员id','int(10) NULL','num','','','0','','0','0','1','1443149118','1443149118','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_verify','投票是否需要填写验证码','tinyint(2) NULL','bool','0','防止刷票行为时需要开启','1','0:不需要\r\n1:需要','0','0','1','1446000352','1445997031','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_vote_option` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`truename`  varchar(255) NULL  COMMENT '姓名',
`image`  int(10) UNSIGNED NULL  COMMENT '显示图片',
`uid`  int(10) NULL  COMMENT '用户id',
`manifesto`  text NULL  COMMENT '微笑宣言',
`introduce`  text NULL  COMMENT '选手介绍',
`ctime`  int(10) NULL  COMMENT '创建时间',
`vote_id`  int(10) NULL  COMMENT '活动id',
`opt_count`  int(10) NULL  DEFAULT 0 COMMENT '投票数',
`token`  varchar(255) NULL  COMMENT 'token',
`number`  int(10) NULL  DEFAULT 1 COMMENT '编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_vote_option','投票选项表','0','','1','["truename","image","manifesto","introduce"]','1:基础','','','','','truename:10%姓名\r\nimage|get_img_html:10%显示图片\r\nmanifesto:30%微笑宣言\r\nintroduce:25%选手介绍\r\nopt_count:8%得票数\r\nids:17%操作:option_edit&id=[id]|编辑,option_del&id=[id]|删除,show_log&option_id=[id]|投票记录','10','truename:请输入姓名','','1443149182','1443174326','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('truename','姓名','varchar(255) NULL','string','','','1','','0','1','1','1443149380','1443149261','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('image','显示图片','int(10) UNSIGNED NULL','picture','','图片尺寸建议为300*300','1','','0','1','1','1448075815','1443149366','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','int(10) NULL','num','','','0','','0','0','1','1443149449','1443149437','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manifesto','微笑宣言','text NULL','textarea','','','1','','0','1','1','1443149665','1443149626','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('introduce','选手介绍','text NULL','textarea','','','1','','0','1','1','1443149732','1443149732','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1443149776','1443149776','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_id','活动id','int(10) NULL','num','','','4','','0','0','1','1443149827','1443149827','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('opt_count','投票数','int(10) NULL','num','0','','0','','0','0','1','1443154633','1443149866','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1443149961','1443149961','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('number','编号','int(10) NULL','num','1','','0','','0','0','1','1443173465','1443173454','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_vote_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`vote_id`  int(10) NULL  COMMENT '活动id',
`option_id`  int(10) NULL  COMMENT '选项id',
`uid`  int(10) NULL  COMMENT '投票者id',
`token`  varchar(255) NULL  COMMENT 'token',
`ctime`  int(10) NULL  COMMENT '投票时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_vote_log','商城投票记录','0','','1','["vote_id","option_id","uid"]','1:基础','','','','','vote_id:25%投票标题\r\nuid:25%用户\r\noption_id:25%投票选项\r\nctime|time_format:25%投票时间','10','','','1443150057','1443159853','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('vote_id','活动id','int(10) NULL','num','','','1','','0','0','1','1443150128','1443150128','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('option_id','选项id','int(10) NULL','num','','','1','','0','0','1','1443150157','1443150157','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','投票者id','int(10) NULL','num','','','1','','0','0','1','1443150185','1443150185','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1443150248','1443150248','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','投票时间','int(10) NULL','datetime','','','0','','0','0','1','1443150271','1443150271','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_privilege` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '特权标题',
`grade`  varchar(100) NULL  COMMENT '适用人群',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '结束时间',
`intro`  text NULL  COMMENT '使用说明',
`token`  varchar(255) NULL  COMMENT 'token',
`enable`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否启用',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_privilege','会员卡特权','0','','1','["title","grade","start_time","end_time","intro","enable"]','1:基础','','','','','start_time|time_format:特权开始时间\r\nend_time|time_format:特权结束时间\r\ntitle:特权标题\r\ngrade:适用人群\r\nintro:特权内容\r\nenable|get_name_by_status:是否开启\r\nstatus:状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1443153625','1443167441','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','特权标题','varchar(255) NULL','string','','','1','','0','0','1','1443153661','1443153661','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('grade','适用人群','varchar(100) NULL','checkbox','','','1','','0','0','1','1443165742','1443153832','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','0','1','1443153870','1443153870','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','0','1','1443153895','1443153895','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','使用说明','text NULL','textarea','','','1','','0','0','1','1443153964','1443153964','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1443154036','1443154036','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('enable','是否启用','tinyint(2) NULL','bool','1','','1','1:启用\r\n0:禁用','0','0','1','1443164479','1443164437','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_level` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`level`  varchar(255) NULL  COMMENT '会员等级',
`score`  int(10) NULL  COMMENT '累计积分',
`recharge`  int(10) NULL  COMMENT '累计充值',
`discount`  int(10) NULL  COMMENT '折扣率',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_level','会员等级','0','','1','["level","score","recharge","discount"]','1:基础','','','','','level:会员等级\r\nscore:累计积分\r\nrecharge:累计充值\r\ndiscount:享受折扣\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1443163048','1443164698','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('level','会员等级','varchar(255) NULL','string','','','1','','0','0','1','1443163097','1443163097','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','累计积分','int(10) NULL','num','','','1','','0','0','1','1443163223','1443163223','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('recharge','累计充值','int(10) NULL','num','','','1','','0','0','1','1443163252','1443163252','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('discount','折扣率','int(10) NULL','num','','例如10代表优惠10%，即打9折','1','','0','0','1','1443163384','1443163384','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1443163422','1443163422','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_coupons` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`give_type`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '发放方式',
`title`  varchar(255) NOT NULL  COMMENT '优惠券标题',
`end_date`  int(10) NULL  COMMENT '结束时间',
`start_date`  int(10) NOT NULL  COMMENT '开始时间',
`content`  text NOT NULL  COMMENT '使用说明',
`cTime`  int(10) NULL  COMMENT '发布时间',
`token`  varchar(100) NOT NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_coupons','会员卡优惠券','0','','1','{"1":["title","give_type","start_date","end_date","content"]}','1:基础','','','','','title:标题\r\ngive_type|get_name_by_status:发放方式\r\nstart_date|time_format:开始时间\r\nend_date|time_format:结束时间\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title','','1395485774','1395486719','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('give_type','发放方式','tinyint(2) NOT NULL','bool','0','人工发放是指管理员要会员管理列表手工进行发放','0','0:自动发放\r\n1:人工发放','0','0','1','1395487734','1395486034','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','优惠券标题','varchar(255) NOT NULL','string','','','1','','0','0','1','1395485828','1395485828','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_date','结束时间','int(10) NULL','datetime','','','1','','0','0','1','1395486188','1395486188','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_date','开始时间','int(10) NOT NULL','datetime','','','1','','0','0','1','1395486135','1395486135','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','使用说明','text NOT NULL','editor','','','1','','0','0','1','1395486307','1395486307','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) NULL','datetime','','','0','','0','0','1','1395486839','1395486801','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NOT NULL','string','','','0','','0','0','1','1395912079','1395912079','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_notice` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cTime`  int(10) NULL  COMMENT '发布时间',
`content`  text NOT NULL  COMMENT '通知内容',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`token`  varchar(100) NOT NULL  COMMENT 'Token',
`img`  int(10) UNSIGNED NULL  COMMENT '通知图片',
`grade`  varchar(100) NULL  DEFAULT 0 COMMENT '适用人群',
`to_uid`  int(10) NULL  DEFAULT 0 COMMENT '指定用户',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_notice','会员卡通知','0','','1','["title","img","grade","content"]','1:基础','','','','','title:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title','','1395485156','1444798538','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) NULL','datetime','','','0','','0','0','1','1395485303','1395485303','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','通知内容','text NOT NULL','editor','','','1','','0','1','1','1444471509','1395485247','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1444471517','1395485192','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NOT NULL','string','','','0','','0','0','1','1395911896','1395911896','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','通知图片','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1444472055','1444470114','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('grade','适用人群','varchar(100) NULL','checkbox','0','','1','0:所有会员','0','0','1','1444478807','1444471427','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('to_uid','指定用户','int(10) NULL','num','0','','0','','0','0','1','1444717008','1444716962','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_member` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`number`  varchar(50) NULL  COMMENT '卡号',
`cTime`  int(10) NULL  COMMENT '加入时间',
`phone`  varchar(30) NULL  COMMENT '手机号',
`username`  varchar(100) NULL  COMMENT '姓名',
`uid`  int(10) NOT NULL  COMMENT '用户UID',
`token`  varchar(100) NOT NULL  COMMENT 'Token',
`recharge`  int(10) NULL  DEFAULT 0 COMMENT '余额',
`status`  tinyint(2) NULL  DEFAULT 1 COMMENT '会员状态',
`birthday`  int(10) NULL  COMMENT '生日',
`address`  varchar(255) NULL  COMMENT '地址',
`level`  int(10) NULL  DEFAULT 0 COMMENT '会员卡等级',
`sex`  int(10) NULL  COMMENT '性别',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_member','会员卡成员','0','','1','["phone","username","recharge"]','1:基础','','','','','number:卡号\r\nuid:uid\r\nusername:姓名\r\nphone:手机号\r\nscore:剩余积分\r\nrecharge:余额\r\nlevel:等级\r\ncTime|time_format:加入时间\r\nstatus|get_name_by_status:状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,do_recharge&id=[id]|会员充值,do_buy&id=[id]|会员消费,update_score&id=[id]|手动修改积分','10','username:请输入姓名','','1395482804','1444633312','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('number','卡号','varchar(50) NULL','string','','','3','','0','0','1','1395484806','1395483310','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','加入时间','int(10) NULL','datetime','','','0','','0','0','1','1395484366','1395484366','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('phone','手机号','varchar(30) NULL','string','','','1','','0','0','1','1395483248','1395483248','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('username','姓名','varchar(100) NULL','string','','','1','','0','0','1','1395483048','1395483048','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户UID','int(10) NOT NULL','num','','','0','','0','0','1','1395482973','1395482973','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(100) NOT NULL','string','','','0','','0','0','1','1395973788','1395912028','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('recharge','余额','int(10) NULL','num','0','','1','','0','0','1','1443171423','1443170806','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','会员状态','tinyint(2) NULL','bool','1','','0','1:正常\r\n0:冻结\r\n2:体验卡','0','0','1','1448171136','1444271533','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('birthday','生日','int(10) NULL','date','','','0','','0','0','1','1444634831','1444634831','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','地址','varchar(255) NULL','string','','','0','','0','0','1','1444634852','1444634852','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('level','会员卡等级','int(10) NULL','num','0','','1','','0','0','1','1444714615','1444714615','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sex','性别','int(10) NULL','num','','','1','1:男\r\n2:女','0','0','1','1444721537','1444720977','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_recharge_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`recharge`  float(10) NULL  COMMENT '充值金额',
`branch_id`  int(10) NULL  DEFAULT 0 COMMENT '充值门店',
`operator`  varchar(255) NULL  COMMENT '操作员',
`cTime`  int(10) NULL  COMMENT '创建时间',
`token`  varchar(255) NULL  COMMENT 'token',
`member_id`  int(10) NULL  COMMENT '会员id',
`manager_id`  int(10) NULL  COMMENT '管理员id',
`type`  tinyint(2) NULL  DEFAULT 1 COMMENT '充值方式',
`remark`  text NULL  COMMENT '备注',
`uid`  int(10) NULL  COMMENT '用户ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('recharge_log','会员充值记录','0','','1','["recharge","branch_id","operator","cTime","token","manager_id"]','1:基础','','','','','member_id:会员卡号\r\ntruename:姓名\r\nphone:手机号\r\nrecharge:充值金额\r\ncTime|time_format:充值时间\r\nbranch_id:充值门店\r\noperator:操作员','10','operator:请输入姓名或手机号或操作员','','1444275985','1444387901','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('recharge','充值金额','float(10) NULL','num','','','1','','0','1','1','1444286201','1444276045','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('branch_id','充值门店','int(10) NULL','num','0','','1','','0','0','1','1444276408','1444276408','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('operator','操作员','varchar(255) NULL','string','','','1','','0','0','1','1444287439','1444276506','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','1','','0','0','1','1444276539','1444276539','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1444276565','1444276565','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('member_id','会员id','int(10) NULL','num','','','4','','0','0','1','1444285683','1444285649','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员id','int(10) NULL','num','','','1','','0','0','1','1444287330','1444287330','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','充值方式','tinyint(2) NULL','bool','1','','0','0:系统自动\r\n1:管理员手工','0','0','1','1445251928','1445251928','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','text NULL','textarea','','','0','','0','0','1','1445251962','1445251962','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1445252123','1445252123','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_buy_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`pay`  float(10) NULL  COMMENT '消费金额',
`sn_id`  int(10) NULL  COMMENT '优惠卷',
`pay_type`  char(10) NULL  COMMENT '支付方式',
`branch_id`  int(10) NULL  DEFAULT 0 COMMENT '消费门店',
`member_id`  int(10) NULL  COMMENT '会员卡id',
`cTime`  int(10) NULL  COMMENT '创建时间',
`token`  varchar(255) NULL  COMMENT 'token',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('buy_log','会员消费记录','0','','1','["pay","pay_type","branch_id","cTime","token","manager_id","sn_id"]','1:基础','','','','','member_id:会员名称\r\nphone:电话\r\ncTime|time_format:消费时间\r\nbranch_id:消费门店\r\npay:消费金额\r\nsn_id:优惠金额\r\npay_type|get_name_by_status:消费方式','10','member:请输入会员名称或手机号','','1444289843','1444392724','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pay','消费金额','float(10) NULL','num','','','1','','0','1','1','1444296855','1444289970','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sn_id','优惠卷','int(10) NULL','num','','','1','','0','0','1','1444297432','1444290217','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pay_type','支付方式','char(10) NULL','radio','','','1','1:会员卡余额消费\r\n2:现金或POS机消费','0','1','1','1444296840','1444290385','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('branch_id','消费门店','int(10) NULL','num','0','','1','','0','0','1','1444296901','1444290445','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('member_id','会员卡id','int(10) NULL','num','','','4','','0','0','1','1444290484','1444290472','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','1','','0','0','1','1444290512','1444290512','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1444290535','1444290535','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','1','','0','0','1','1444297606','1444290558','','3','','regex','get_mid','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_update_score_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`score`  int(10) NULL  COMMENT '修改积分',
`branch_id`  int(10) NULL  COMMENT '修改门店',
`operator`  varchar(255) NULL  COMMENT '操作员',
`cTime`  int(10) NULL  COMMENT '修改时间',
`token`  varchar(255) NULL  COMMENT 'token',
`member_id`  int(10) NULL  COMMENT '会员卡id',
`manager_id`  int(10) NULL  COMMENT '管理员id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('update_score_log','修改积分记录','0','','1','','1:基础','','','','','','10','','','1444302325','1444302325','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','修改积分','int(10) NULL','num','','','1','','0','1','1','1444302622','1444302410','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('branch_id','修改门店','int(10) NULL','num','','','1','','0','0','1','1444302450','1444302450','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('operator','操作员','varchar(255) NULL','string','','','1','','0','0','1','1444302474','1444302474','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1444302508','1444302508','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1444302539','1444302539','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('member_id','会员卡id','int(10) NULL','num','','','4','','0','0','1','1444302566','1444302566','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员id','int(10) NULL','num','','','1','','0','0','1','1444302595','1444302595','','3','','regex','get_mid','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_signin_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`score`  int(10) NOT NULL  COMMENT '积分',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`sTime`  int(10) UNSIGNED NOT NULL  COMMENT '签到时间',
`uid`  varchar(255) NOT NULL  COMMENT '用户ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('SignIn_Log','签到记录','0','','1','{"1":["uid","score"]}','1:基础','','','','','uid:用户ID\r\nnickname:呢称\r\nsTime|time_format:签到时间\r\nscore:积分\r\n','10','uid','','1396061373','1404694493','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分','int(10) NOT NULL','num','','','1','','0','0','1','1404694456','1404694456','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sTime','签到时间','int(10) UNSIGNED NOT NULL','datetime','','','0','','0','1','1','1404631787','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','varchar(255) NOT NULL','textarea','','','1','','0','1','1','1404631866','1396062093','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shop_card_member` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`username`  varchar(255) NULL  COMMENT '姓名',
`phone`  varchar(255) NULL  COMMENT '手机号',
`sex`  varchar(10) NULL  COMMENT '性别',
`birthday`  int(10) NULL  COMMENT '生日',
`address`  varchar(255) NULL  COMMENT '地址',
`ctime`  int(10) NULL  COMMENT '导入时间',
`is_get`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否领取',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_card_member','实体店会员卡','0','','1','["username","phone","sex","birthday","address","ctime","is_get","token"]','1:基础','','','','','username:姓名\r\nphone:手机号\r\nsex:性别\r\nbirthday:生日\r\naddress:地址\r\nctime|time_format:导入时间\r\nis_get|get_name_by_status:是否领取\r\nid:操作:changeGet&id=[id]&is_get=[is_get]|改变领取状态','10','username:请输入姓名','','1444362335','1444377851','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('username','姓名','varchar(255) NULL','string','','','1','','0','1','1','1444362378','1444362378','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('phone','手机号','varchar(255) NULL','string','','','1','','0','1','1','1444362399','1444362399','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sex','性别','varchar(10) NULL','string','','','1','','0','0','1','1444362506','1444362506','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('birthday','生日','int(10) NULL','date','','','1','','0','0','1','1444377105','1444362549','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','地址','varchar(255) NULL','string','','','1','','0','0','1','1444362572','1444362572','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','导入时间','int(10) NULL','datetime','','','1','','0','0','1','1444363093','1444363093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_get','是否领取','tinyint(2) NULL','bool','1','','1','0:否\r\n1:是','0','0','1','1444377709','1444363783','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1444363955','1444363955','','3','','regex','get_token','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_marketing` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '活动名称',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '结束时间',
`status`  tinyint(2) NULL  DEFAULT 0 COMMENT '状态',
`type`  char(50) NULL  COMMENT '活动类型',
`give_type`  char(10) NULL  COMMENT '赠送类型',
`give`  int(10) NULL  COMMENT '赠送数据',
`condition`  int(10) NULL  COMMENT '赠送条件',
`branch_id`  int(10) NULL  COMMENT '充值门店',
`grade`  int(10) NULL  COMMENT '适用人群',
`exchange_count`  int(10) NULL  COMMENT '兑换次数',
`open_give_rule`  tinyint(2) NULL  DEFAULT 0 COMMENT '启用赠送规则',
`enjoy_power`  tinyint(2) NULL  DEFAULT 0 COMMENT '消费享受权限',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_marketing','会员营销活动','0','','1','','1:基础','','','','','','10','','','1444482353','1444482364','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(255) NULL','string','','','1','','0','1','1','1444482518','1444482518','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1444482549','1444482549','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','1','1','1444482572','1444482572','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','tinyint(2) NULL','bool','0','','1','0:关闭\r\n1:开启','0','0','1','1444482635','1444482635','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','活动类型','char(50) NULL','select','','','1','1:开卡即送\r\n2:积分兑换\r\n3:充值赠送\r\n4:消费赠送','0','0','1','1444482777','1444482777','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('give_type','赠送类型','char(10) NULL','radio','','','1','1:积分\r\n2:优惠券\r\n3:现金','0','0','1','1444482866','1444482866','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('give','赠送数据','int(10) NULL','num','','','1','','0','0','1','1444482894','1444482894','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('condition','赠送条件','int(10) NULL','num','','','1','','0','0','1','1444482918','1444482918','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('branch_id','充值门店','int(10) NULL','num','','','1','','0','0','1','1444482965','1444482952','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('grade','适用人群','int(10) NULL','num','','','1','','0','0','1','1444482986','1444482986','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('exchange_count','兑换次数','int(10) NULL','num','','','1','','0','0','1','1444483035','1444483035','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('open_give_rule','启用赠送规则','tinyint(2) NULL','bool','0','','1','','0','0','1','1444483107','1444483107','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('enjoy_power','消费享受权限','tinyint(2) NULL','bool','0','','1','0:不限\r\n1:使用券消费的用户不享受','0','0','1','1444483206','1444483206','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1444483238','1444483238','','3','','regex','get_token','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_reward` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(50) NULL  COMMENT 'Token',
`cTime`  int(10) NULL  COMMENT '创建时间',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '过期时间',
`title`  varchar(100) NULL  COMMENT '活动名称',
`type`  tinyint(2) NULL  DEFAULT 0 COMMENT '活动策略',
`score`  int(10) NULL  DEFAULT 0 COMMENT '积分数',
`coupon_id`  int(10) NULL  COMMENT '商城优惠券',
`is_show`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否在用户领卡界面展示',
`content`  text NULL  COMMENT '活动说明',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_reward','开卡即送活动','0','','1','["title","start_time","end_time","type","score","is_show","content","coupon_id"]','1:基础','','','','','title:活动名称\r\ntype:活动策略\r\nstart_time:有效期\r\nstatus:活动状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title:请输入活动名称搜索','','1442457808','1444640724','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1442458516','1442458516','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','0','1','1442458480','1442458480','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1442458439','1442458439','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1442457879','1442457879','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','过期时间','int(10) NULL','datetime','','','1','','0','1','1','1442457902','1442457902','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(100) NULL','string','','','1','','0','1','1','1442457852','1442457852','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','活动策略','tinyint(2) NULL','bool','0','','1','0:送积分\r\n1:送优惠券','0','0','1','1444622808','1444622808','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分数','int(10) NULL','num','0','','1','','0','0','1','1444622853','1444622853','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','商城优惠券','int(10) NULL','num','','','1','','0','0','1','1444634724','1444622932','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否在用户领卡界面展示','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1444622979','1444622979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','活动说明','text NULL','textarea','','','1','','0','0','1','1444623015','1444623015','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_score` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(50) NULL  COMMENT 'Token',
`cTime`  int(10) NULL  COMMENT '创建时间',
`num_limit`  int(10) NULL  DEFAULT 0 COMMENT '兑换次数限制',
`coupon_id`  int(10) NULL  COMMENT '商城优惠券',
`score_limit`  int(10) NULL  DEFAULT 0 COMMENT '所需积分',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '过期时间',
`title`  varchar(100) NULL  COMMENT '活动名称',
`member`  varchar(100) NULL  DEFAULT 0 COMMENT '适用人群',
`coupon_type`  int(10) NULL  DEFAULT 0 COMMENT '优惠券类型',
`cover_id`  int(10) UNSIGNED NULL  COMMENT '活动图片',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_score','积分兑换活动','0','','1','["title","start_time","end_time","num_limit","coupon_id","score_limit","member","coupon_type"]','1:基础','','','','','title:活动名称\r\ncoupon_id:兑换内容\r\nstart_time:有效期\r\nstatus:活动状态\r\nmember:适用人群\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title:请输入活动名称搜索','','1442457808','1444798256','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1442458516','1442458516','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','0','1','1442458480','1442458480','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1442458439','1442458439','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num_limit','兑换次数限制','int(10) NULL','num','0','','1','','0','0','1','1444639490','1444622853','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','商城优惠券','int(10) NULL','num','','','1','','0','0','1','1444634724','1444622932','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score_limit','所需积分','int(10) NULL','num','0','','1','','0','0','1','1444639428','1444622979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1442457879','1442457879','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','过期时间','int(10) NULL','datetime','','','1','','0','1','1','1442457902','1442457902','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(100) NULL','string','','','1','','0','1','1','1442457852','1442457852','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('member','适用人群','varchar(100) NULL','checkbox','0','','1','0:所有用户\r\n-1:所有会员卡成员','0','0','1','1446107007','1444622808','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_type','优惠券类型','int(10) NULL','num','0','','1','0:代金券\r\n1:优惠券','0','0','1','1444727785','1444727785','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover_id','活动图片','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1444801906','1444801906','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_recharge` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(50) NULL  COMMENT 'Token',
`cTime`  int(10) NULL  COMMENT '创建时间',
`goods_ids`  text NULL  COMMENT '指定商品ID串',
`is_all_goods`  tinyint(2) NULL  DEFAULT 0 COMMENT '适用的活动商品',
`is_mult`  tinyint(2) NULL  DEFAULT 0 COMMENT '多级优惠',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '过期时间',
`title`  varchar(100) NULL  COMMENT '活动名称',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_recharge','充值赠送活动','0','','1','["title","start_time","end_time","is_mult","is_all_goods"]','1:基础','','','','','title:活动名称\r\nstart_time:有效期\r\nstatus:活动状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title:请输入活动名称搜索','','1442457808','1442544407','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1442458516','1442458516','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','0','1','1442458480','1442458480','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1442458439','1442458439','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_ids','指定商品ID串','text NULL','textarea','','','0','','0','0','1','1442540989','1442458406','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_all_goods','适用的活动商品','tinyint(2) NULL','bool','0','','1','0:全部商品参与\r\n1:指定商品参与','0','0','1','1442458365','1442458365','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_mult','多级优惠','tinyint(2) NULL','bool','0','多级情况下每级优惠不累积叠加','1','0:否\r\n1:是','0','0','1','1442458033','1442458011','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1442457879','1442457879','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','过期时间','int(10) NULL','datetime','','','1','','0','1','1','1442457902','1442457902','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(100) NULL','string','','','1','','0','1','1','1442457852','1442457852','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_recharge_condition` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`money_param`  decimal(11,2) NULL  COMMENT '现金参数',
`money`  tinyint(2) NULL  COMMENT '现在开关',
`reward_id`  int(10) NULL  COMMENT '活动ID',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序号',
`condition`  decimal(11,2) NULL  COMMENT '条件',
`score`  tinyint(2) NULL  DEFAULT 0 COMMENT '积分开关',
`score_param`  int(10) NULL  COMMENT '积分参数',
`shop_coupon`  tinyint(2) NULL  DEFAULT 0 COMMENT '优惠券开关',
`shop_coupon_param`  int(10) NULL  COMMENT '优惠券ID',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_recharge_condition','充值赠送条件','0','','1','["postage","money_param","sort","condition","score","score_param","shop_coupon","shop_coupon_param"]','1:基础','','','','','','10','','','1442458767','1444641566','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money_param','现金参数','decimal(11,2) NULL','num','','','1','','0','0','1','1442542160','1442542160','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','现在开关','tinyint(2) NULL','bool','','','0','0:关\r\n1:开','0','0','1','1442542127','1442542127','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reward_id','活动ID','int(10) NULL','num','','','0','','0','0','1','1442458906','1442458906','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL','num','0','','1','','0','0','1','1442544909','1442544909','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('condition','条件','decimal(11,2) NULL','num','','满多少元','1','','0','1','1','1442458834','1442458834','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分开关','tinyint(2) NULL','bool','0','','1','0:关\r\n1:开','0','0','1','1442542268','1442542268','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score_param','积分参数','int(10) NULL','num','','','1','','0','0','1','1442542292','1442542292','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_coupon','优惠券开关','tinyint(2) NULL','bool','0','','1','0:关\r\n1:开','0','0','1','1442542329','1442542329','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_coupon_param','优惠券ID','int(10) NULL','num','','','1','','0','0','1','1442542366','1442542366','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_card_custom` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`manager_id`  int(10) NULL  COMMENT '管理员ID',
`token`  varchar(50) NULL  COMMENT 'Token',
`cTime`  int(10) NULL  COMMENT '创建时间',
`score`  int(10) NULL  DEFAULT 0 COMMENT '积分数',
`coupon_id`  int(10) NULL  COMMENT '商城优惠券',
`is_show`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否在会员卡界面展示',
`start_time`  int(10) NULL  COMMENT '节日时间',
`end_time`  int(10) NULL  COMMENT '赠送时间',
`title`  varchar(100) NULL  COMMENT '活动名称',
`type`  tinyint(2) NULL  DEFAULT 0 COMMENT '活动策略',
`content`  text NULL  COMMENT '活动说明',
`member`  int(10) NULL  COMMENT '适用人群',
`is_birthday`  tinyint(2) NULL  DEFAULT 0 COMMENT '节日类型',
`before_day`  tinyint(2) NULL  DEFAULT 1 COMMENT '生日前',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('card_custom','客户关怀活动','0','','1','["title","start_time","end_time","type","score","is_show","content","coupon_id","member","is_birthday","before_day"]','1:基础','','','','','title:节日名称\r\nstart_time:节日时间\r\nmember:目标人群\r\nend_time:赠送时间\r\ntype:赠送内容\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title:请输入活动名称搜索','','1442457808','1444647144','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','0','1','1442458516','1442458516','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','0','1','1442458480','1442458480','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1442458439','1442458439','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分数','int(10) NULL','num','0','','1','','0','0','1','1444622853','1444622853','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','商城优惠券','int(10) NULL','num','','','1','','0','0','1','1444634724','1444622932','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否在会员卡界面展示','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1444646159','1444622979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','节日时间','int(10) NULL','datetime','','','1','','0','0','1','1444647869','1442457879','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','赠送时间','int(10) NULL','datetime','','','1','','0','0','1','1444647885','1442457902','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(100) NULL','string','','','1','','0','1','1','1442457852','1442457852','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','活动策略','tinyint(2) NULL','bool','0','','1','0:送积分\r\n1:送优惠券','0','0','1','1444622808','1444622808','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','活动说明','text NULL','textarea','','','1','','0','0','1','1444623015','1444623015','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('member','适用人群','int(10) NULL','num','','','1','','0','0','1','1444646000','1444646000','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_birthday','节日类型','tinyint(2) NULL','bool','0','','1','0:公历节日\r\n1:会员生日','0','0','1','1444646065','1444646065','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('before_day','生日前','tinyint(2) NULL','num','1','','1','','0','0','1','1444646117','1444646117','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_score_exchange_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`card_score_id`  int(10) NULL  COMMENT '兑换活动id',
`token`  varchar(255) NULL  COMMENT 'token',
`uid`  int(10) NULL  COMMENT 'uid',
`ctime`  int(10) NULL  COMMENT 'ctime',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('score_exchange_log','兑换记录','0','','1','','1:基础','','','','','','10','','','1444731340','1444731340','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('card_score_id','兑换活动id','int(10) NULL','num','','','1','','0','0','1','1444731420','1444731420','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1444799211','1444731443','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','1','','0','0','1','1444731483','1444731483','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','ctime','int(10) NULL','datetime','','','1','','0','0','1','1444731520','1444731520','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_share_log` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户id',
`sTime`  int(10) NULL  COMMENT '分享时间',
`token`  varchar(255) NULL  COMMENT 'token',
`score`  int(10) NULL  COMMENT '积分',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('share_log','分享记录','0','','1','','1:基础','','','','','','10','','','1444789662','1444789662','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户id','int(10) NULL','num','','','1','','0','0','1','1444789735','1444789735','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sTime','分享时间','int(10) NULL','datetime','','','1','','0','0','1','1444789762','1444789762','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','0','1','1444789785','1444789785','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分','int(10) NULL','num','','','1','','0','0','1','1444789813','1444789813','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lottery_games` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '活动名称',
`game_type`  char(10) NULL  DEFAULT 1 COMMENT '游戏类型',
`status`  char(10) NULL  DEFAULT 1 COMMENT '状态',
`start_time`  int(10) NULL  COMMENT '开始时间',
`end_time`  int(10) NULL  COMMENT '结束时间',
`day_attend_limit`  int(10) NULL  DEFAULT 0 COMMENT '每人每天抽奖次数',
`attend_limit`  int(10) NULL  DEFAULT 0 COMMENT '每人总共抽奖次数',
`day_win_limit`  int(10) NULL  DEFAULT 0 COMMENT '每人每天中奖次数',
`win_limit`  int(10) NULL  DEFAULT 0 COMMENT '每人总共中奖次数',
`day_winners_count`  int(10) NULL  DEFAULT 0 COMMENT '每天最多中奖人数',
`url`  varchar(300) NULL  COMMENT '关注链接',
`remark`  text NULL  COMMENT '活动说明',
`keyword`  varchar(255) NULL  COMMENT '微信关键词',
`attend_num`  int(10) NULL  DEFAULT 0 COMMENT '参与总人数',
`token`  varchar(255) NULL  COMMENT 'token',
`manager_id`  int(10) NULL  COMMENT '管理员id',
`cover`  int(10) UNSIGNED NULL  COMMENT '封面',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lottery_games','抽奖游戏','0','','1','["title","keyword","cover","game_type","start_time","end_time","status","day_attend_limit","attend_limit","day_win_limit","win_limit","day_winners_count","remark"]','1:基础','','','','','id:序号\r\ntitle:活动名称\r\ngame_type|get_name_by_status:游戏类型\r\nkeyword:关键词\r\nstart_time|time_format:开始时间\r\nend_time|time_format:结束时间\r\nstatus:活动状态\r\nattend_num:参与人数\r\nwinners_list:中奖人列表\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,preview&games_id=[id]|预览,index&_addons=Draw&_controller=Wap&games_id=[id]|复制链接','10','','','1444877287','1448074777','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(255) NULL','string','','','1','','0','1','1','1444877324','1444877324','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_type','游戏类型','char(10) NULL','radio','1','','1','1:刮刮乐\r\n2:大转盘\r\n3:砸金蛋\r\n4:九宫格','0','1','1','1444877425','1444877425','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','char(10) NULL','radio','1','','1','1:开启\r\n0:禁用','0','0','1','1444877482','1444877468','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','1','1','1444877509','1444877509','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NULL','datetime','','','1','','0','1','1','1444877530','1444877530','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('day_attend_limit','每人每天抽奖次数','int(10) NULL','num','0','0，则不限制，超过此限制点击抽奖，系统会提示“您今天的抽奖次数已经用完!”','1','','0','0','1','1444879540','1444878111','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attend_limit','每人总共抽奖次数','int(10) NULL','num','0','0，则不限制；否则必须>=每人每天抽奖次数，超过此限制点击抽奖，系统会提示“您的所有抽奖次数已用完!”','1','','0','0','1','1444879552','1444878167','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('day_win_limit','每人每天中奖次数','int(10) NULL','num','0','0，则不限制，超过此限制点击抽奖，抽奖者将无概率中奖','1','','0','0','1','1444879608','1444878254','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('win_limit','每人总共中奖次数','int(10) NULL','num','0','0，则不限制；否则必须>=每人每天中奖次数，超过此限制点击抽奖，抽奖者将无概率中奖','1','','0','0','1','1444879656','1444878336','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('day_winners_count','每天最多中奖人数','int(10) NULL','num','0','0，则不限制，超过此限制时，系统会提示“今天奖品已抽完，明天再来吧!”','1','','0','0','1','1444879673','1444878419','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','关注链接','varchar(300) NULL','string','','','0','','0','0','1','1445068488','1444878621','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','活动说明','text NULL','textarea','','','1','','0','0','1','1444878676','1444878676','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','微信关键词','varchar(255) NULL','string','','','1','','0','1','1','1444878722','1444878722','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attend_num','参与总人数','int(10) NULL','num','0','','0','','0','0','1','1444878774','1444878774','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1444878837','1444878837','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员id','int(10) NULL','num','','','0','','0','0','1','1444878900','1444878900','','3','','regex','get_mid','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面','int(10) UNSIGNED NULL','picture','','最佳尺寸为900*500','1','','0','0','1','1448074733','1448074733','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_lottery_games_award_link` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`award_id`  int(10) NULL  COMMENT '奖品id',
`games_id`  int(10) NULL  COMMENT '抽奖游戏id',
`grade`  varchar(255) NULL  COMMENT '中奖等级',
`num`  int(10) NULL  COMMENT '奖品数量',
`max_count`  int(10) NULL  COMMENT '最多抽奖',
`token`  varchar(255) NULL  COMMENT 'token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('lottery_games_award_link','抽奖游戏奖品设置','0','','1','','1:基础','','','','','','10','','','1444900969','1444900969','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_id','奖品id','int(10) NULL','num','','','1','','0','1','1','1444901378','1444900999','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('games_id','抽奖游戏id','int(10) NULL','num','','','1','','0','1','1','1444901386','1444901037','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('grade','中奖等级','varchar(255) NULL','string','','','1','','0','1','1','1444901399','1444901079','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','奖品数量','int(10) NULL','num','','','1','','0','1','1','1444901364','1444901364','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('max_count','最多抽奖','int(10) NULL','num','','n次,把奖品发放完, 不能小于奖品数量','1','','0','0','1','1444901486','1444901486','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1444901512','1444901512','','3','','regex','get_token','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_reserve` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`cTime`  int(10) UNSIGNED NULL  COMMENT '发布时间',
`token`  varchar(255) NULL  COMMENT 'Token',
`password`  varchar(255) NULL  COMMENT '微预约密码',
`jump_url`  varchar(255) NULL  COMMENT '提交后跳转的地址',
`content`  text NULL  COMMENT '详细介绍',
`finish_tip`  text NULL  COMMENT '用户提交后提示内容',
`can_edit`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否允许编辑',
`intro`  text NULL  COMMENT '封面简介',
`mTime`  int(10) NULL  COMMENT '修改时间',
`cover`  int(10) UNSIGNED NULL  COMMENT '封面图片',
`template`  varchar(255) NULL  DEFAULT 'default' COMMENT '模板',
`status`  tinyint(2) NULL  DEFAULT 0 COMMENT '状态',
`start_time`  int(10) NULL  COMMENT '报名开始时间',
`end_time`  int(10) NULL  COMMENT '报名结束时间',
`pay_online`  tinyint(2) NULL  DEFAULT 0 COMMENT '是否支持在线支付',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('reserve','微预约','0','','1','["title","intro","cover","can_edit","finish_tip","jump_url","content","template","status","start_time","end_time","pay_online"]','1:基础','','','','','title:标题\r\nstatus|get_name_by_status:状态\r\nstart_time:报名时间\r\nids:操作:preview&id=[id]|预览,[EDIT]|编辑,reserve_value&id=[id]|预约列表,[DELETE]|删除,index&_addons=Reserve&_controller=Wap&reserve_id=[id]|复制链接','20','title','','1396061373','1445409060','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) UNSIGNED NULL','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('password','微预约密码','varchar(255) NULL','string','','如要用户输入密码才能进入微预约，则填写此项。否则留空，用户可直接进入微预约','0','','0','0','1','1396871497','1396672643','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('jump_url','提交后跳转的地址','varchar(255) NULL','string','','要以http://开头的完整地址，为空时不跳转','1','','0','0','1','1402458121','1399800276','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','详细介绍','text NULL','editor','','可不填','1','','0','0','1','1396865295','1396865295','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('finish_tip','用户提交后提示内容','text NULL','textarea','','为空默认为：提交成功，谢谢参与','1','','0','0','1','1396676366','1396673689','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('can_edit','是否允许编辑','tinyint(2) NULL','bool','0','用户提交预约是否可以再编辑','1','0:不允许\r\n1:允许','0','0','1','1396688624','1396688624','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NULL','textarea','','','1','','0','1','1','1439371986','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) UNSIGNED NULL','picture','','','1','','0','1','1','1439372018','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('template','模板','varchar(255) NULL','string','default','','1','','0','0','1','1431661124','1431661124','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','状态','tinyint(2) NULL','bool','0','','1','0:已禁用\r\n1:已开启','0','0','1','1444917938','1444917938','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','报名开始时间','int(10) NULL','datetime','','','1','','0','0','1','1444959115','1444959115','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','报名结束时间','int(10) NULL','datetime','','','1','','0','0','1','1444959142','1444959142','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pay_online','是否支持在线支付','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','0','1','1444959225','1444959225','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_reserve_attribute` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`is_show`  tinyint(2) NULL  DEFAULT 1 COMMENT '是否显示',
`reserve_id`  int(10) UNSIGNED NULL  COMMENT '微预约ID',
`error_info`  varchar(255) NULL  COMMENT '出错提示',
`sort`  int(10) UNSIGNED NULL  DEFAULT 0 COMMENT '排序号',
`validate_rule`  varchar(255) NULL  COMMENT '正则验证',
`is_must`  tinyint(2) NULL  COMMENT '是否必填',
`remark`  varchar(255) NULL  COMMENT '字段备注',
`token`  varchar(255) NULL  COMMENT 'Token',
`value`  varchar(255) NULL  COMMENT '默认值',
`title`  varchar(255) NOT NULL  COMMENT '字段标题',
`mTime`  int(10) NULL  COMMENT '修改时间',
`extra`  text NULL  COMMENT '参数',
`type`  char(50) NOT NULL  DEFAULT 'string' COMMENT '字段类型',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('reserve_attribute','微预约字段','0','','1','["name","title","type","extra","value","remark","is_must","validate_rule","error_info","sort"]','1:基础','','','','','title:字段标题\r\nname:字段名\r\ntype|get_name_by_status:字段类型\r\nids:操作:[EDIT]&reserve_id=[reserve_id]|编辑,[DELETE]|删除','20','title','','1396061373','1396710959','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','tinyint(2) NULL','select','1','是否显示在微预约中','1','1:显示\r\n0:不显示','0','0','1','1396848437','1396848437','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reserve_id','微预约ID','int(10) UNSIGNED NULL','num','','','4','','0','0','1','1396710040','1396690613','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('error_info','出错提示','varchar(255) NULL','string','','验证不通过时的提示语','1','','0','0','1','1396685920','1396685920','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) UNSIGNED NULL','num','0','值越小越靠前','1','','0','0','1','1396685825','1396685825','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('validate_rule','正则验证','varchar(255) NULL','string','','为空表示不作验证','1','','0','0','1','1396685776','1396685776','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_must','是否必填','tinyint(2) NULL','bool','','用于自动验证','1','0:否\r\n1:是','0','0','1','1396685579','1396685579','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','字段备注','varchar(255) NULL','string','','用于微预约中的提示','1','','0','0','1','1396685482','1396685482','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('value','默认值','varchar(255) NULL','string','','字段的默认值','1','','0','0','1','1396685291','1396685291','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','字段标题','varchar(255) NOT NULL','string','','请输入字段标题，用于微预约显示','1','','0','1','1','1396676830','1396676830','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra','参数','text NULL','textarea','','字段类型为单选、多选、下拉选择和级联选择时的定义数据，其它字段类型为空','1','','0','0','1','1396835020','1396685105','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','字段类型','char(50) NOT NULL','select','string','用于微预约中的展示方式','1','string:单行输入\r\ntextarea:多行输入\r\nradio:单选\r\ncheckbox:多选\r\nselect:下拉选择\r\ndatetime:时间\r\npicture:上传图片','0','1','1','1396871262','1396683600','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_reserve_value` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`reserve_id`  int(10) UNSIGNED NULL  COMMENT '微预约ID',
`value`  text NULL  COMMENT '微预约值',
`cTime`  int(10) NULL  COMMENT '增加时间',
`openid`  varchar(255) NULL  COMMENT 'OpenId',
`uid`  int(10) NULL  COMMENT '用户ID',
`token`  varchar(255) NULL  COMMENT 'Token',
`is_check`  int(10) NULL  DEFAULT 0 COMMENT '验证是否成功',
`is_pay`  int(10) NULL  DEFAULT 0 COMMENT '是否支付',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('reserve_value','微预约数据','0','','1','','1:基础','','','','','','20','','','1396687959','1396687959','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reserve_id','微预约ID','int(10) UNSIGNED NULL','num','','','4','','0','0','1','1396710064','1396688308','','3','','regex','','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('value','微预约值','text NULL','textarea','','','0','','0','0','1','1396688355','1396688355','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','增加时间','int(10) NULL','datetime','','','0','','0','0','1','1396688434','1396688434','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenId','varchar(255) NULL','string','','','0','','0','0','1','1396688187','1396688187','','3','','regex','get_openid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户ID','int(10) NULL','num','','','0','','0','0','1','1396688042','1396688042','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NULL','string','','','0','','0','0','1','1396690911','1396690911','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_check','验证是否成功','int(10) NULL','num','0','','0','','0','0','1','1445246146','1445246146','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_pay','是否支付','int(10) NULL','num','0','','0','','0','0','1','1445258123','1445258123','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_reserve_option` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`reserve_id`  int(10) NULL  COMMENT '预约活动ID',
`name`  varchar(100) NULL  COMMENT '名称',
`money`  decimal(11,2) NULL  DEFAULT 0 COMMENT '报名费用',
`max_limit`  int(10) NULL  DEFAULT 0 COMMENT '最大预约数',
`init_count`  int(10) NULL  DEFAULT 0 COMMENT '初始化预约数',
`join_count`  int(10) NULL  DEFAULT 0 COMMENT '参加人数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('reserve_option','预约选项','0','','1','','1:基础','','','','','','10','','','1444962050','1444962050','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reserve_id','预约活动ID','int(10) NULL','num','','','0','','0','0','1','1444962084','1444962084','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','名称','varchar(100) NULL','string','','','0','','0','0','1','1444962123','1444962123','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','报名费用','decimal(11,2) NULL','num','0','','0','','0','0','1','1444962160','1444962160','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('max_limit','最大预约数','int(10) NULL','num','0','为空时表示不限制','0','','0','0','1','1444962264','1444962198','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('init_count','初始化预约数','int(10) NULL','num','0','','0','','0','0','1','1444962246','1444962246','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('join_count','参加人数','int(10) NULL','num','0','','0','','0','0','1','1444962764','1444962764','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_help_open_prize` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`help_id`  int(10) NULL  COMMENT '活动ID',
`sort`  int(10) NULL  COMMENT '序号',
`name`  varchar(100) NULL  COMMENT '奖项名称',
`prize_type`  tinyint(1) NULL  DEFAULT 0 COMMENT '奖项类型',
`coupon_id`  int(10) NULL  COMMENT '优惠券ID',
`shop_coupon_id`  int(10) NULL  COMMENT '代金券ID',
`money`  decimal(11,2) NULL  COMMENT '返现金额',
`is_del`  int(10) NULL  DEFAULT 0 COMMENT '是否删除',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('help_open_prize','礼包奖项','0','','1','["sort","name","prize_type","coupon_id","shop_coupon_id","money"]','1:基础','','','','','userface:获得用户\r\nnickname:名称\r\ntype:类型\r\nprize:获得礼包\r\ncTime:获取时间\r\ndeal:操作','10','title:请输入用户名称','','1445080823','1445241336','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('help_id','活动ID','int(10) NULL','num','','','0','','0','0','1','1445080858','1445080858','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','序号','int(10) NULL','num','','','1','','0','0','1','1445080918','1445080918','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','奖项名称','varchar(100) NULL','string','','','1','','0','0','1','1445080939','1445080939','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_type','奖项类型','tinyint(1) NULL','radio','0','','1','0:请选择\r\n1:优惠券\r\n2:代金券\r\n3:返现','0','0','1','1445081030','1445081030','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('coupon_id','优惠券ID','int(10) NULL','num','','','1','','0','0','1','1445081094','1445081094','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_coupon_id','代金券ID','int(10) NULL','num','','','1','','0','0','1','1445081136','1445081136','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','返现金额','decimal(11,2) NULL','num','','','1','','0','0','1','1445081198','1445081198','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否删除','int(10) NULL','num','0','','0','','0','0','1','1448857481','1448857481','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_wuguai` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`headface`  varchar(255) NULL  COMMENT '近期正面清晰照片',
`truename`  varchar(50) NULL  COMMENT '宝宝姓名',
`age`  int(10) NULL  COMMENT '年龄',
`sex`  tinyint(2) NULL  DEFAULT 1 COMMENT '性别',
`lose_time`  int(10) NULL  COMMENT '丢失时间',
`lose_address`  varchar(255) NULL  COMMENT '丢失地址',
`mobile`  varchar(30) NULL  COMMENT '联系电话',
`content`  text NULL  COMMENT '宝宝特征',
`money`  int(10) NULL  DEFAULT 100 COMMENT '悬赏金额',
`cTime`  int(10) NULL  COMMENT 'cTime',
`uid`  int(10) NULL  COMMENT 'uid',
`token`  varchar(50) NULL  COMMENT 'token',
`latitude`  varchar(50) NULL  COMMENT '经度',
`longitude`  varchar(50) NULL  COMMENT '纬度',
`person_id`  varchar(100) NULL  COMMENT 'faceapp相应person的id',
`person_name`  varchar(100) NULL  COMMENT 'faceapp相应person的name',
`tag`  varchar(255) NULL  COMMENT 'person相关的tag',
`face_id`  varchar(255) NULL  COMMENT 'person相关的face_id',
`session_id`  varchar(100) NULL  COMMENT 'facepp的session_id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('wuguai','天下无拐','0','','1','["headface","truename","age","sex","lose_time","lose_address","mobile","content","money"]','1:基础','','','','','headface|get_img_html:照片\r\ntruename:姓名\r\nmobile:手机号\r\nmoney:金额\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','truename:请输入宝宝姓名搜索','','1441619831','1445142720','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('headface','近期正面清晰照片','varchar(255) NULL','mult_picture','','很重要，用于系统通过人脸识别自动匹配','1','','0','1','1','1445217955','1441619944','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('truename','宝宝姓名','varchar(50) NULL','string','','','1','','0','1','1','1441620009','1441620009','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('age','年龄','int(10) NULL','num','','','1','','0','1','1','1441620060','1441620060','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sex','性别','tinyint(2) NULL','bool','1','','1','1:男\r\n2:女','0','0','1','1441620114','1441620114','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('lose_time','丢失时间','int(10) NULL','datetime','','','1','','0','1','1','1441620164','1441620164','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('lose_address','丢失地址','varchar(255) NULL','string','','','1','','0','1','1','1441620242','1441620242','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mobile','联系电话','varchar(30) NULL','string','','很重要，有最新消息时能及时联系到您','1','','0','1','1','1441620348','1441620348','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','宝宝特征','text NULL','textarea','','请尽量描述宝宝丢失时的穿着，打扮等明显的特征','1','','0','0','1','1441620514','1441620514','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','悬赏金额','int(10) NULL','num','100','单位：元，悬赏越高越能激发更多周边志愿者上传可疑照片。孩子寻回前都可以全额退回','1','','0','0','1','1441620971','1441620971','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','cTime','int(10) NULL','datetime','','','0','','0','0','1','1441621004','1441621004','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','0','','0','0','1','1441621032','1441621032','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(50) NULL','string','','','0','','0','0','1','1441621060','1441621060','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('latitude','经度','varchar(50) NULL','string','','','0','','0','0','1','1441624347','1441624347','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('longitude','纬度','varchar(50) NULL','string','','','0','','0','0','1','1441624390','1441624390','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('person_id','faceapp相应person的id','varchar(100) NULL','string','','','0','','0','0','1','1445137032','1445137032','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('person_name','faceapp相应person的name','varchar(100) NULL','string','','','0','','0','0','1','1445137123','1445137123','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tag','person相关的tag','varchar(255) NULL','string','','','0','','0','0','1','1445137149','1445137149','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('face_id','person相关的face_id','varchar(255) NULL','string','','','0','','0','0','1','1445137214','1445137214','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('session_id','facepp的session_id','varchar(100) NULL','string','','','0','','0','0','1','1445143522','1445143522','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_wuguai_group` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`group_name`  varchar(30) NULL  COMMENT 'group_name',
`tag`  varchar(255) NULL  COMMENT 'tag',
`group_id`  varchar(100) NULL  COMMENT 'group_id',
`added_person`  int(10) NULL  DEFAULT 0 COMMENT 'added_person',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('wuguai_group','脸部识别分组','0','','1','','1:基础','','','','','','10','','','1445137309','1445137309','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_name','group_name','varchar(30) NULL','string','','','0','','0','0','1','1445137398','1445137398','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tag','tag','varchar(255) NULL','string','','','0','','0','0','1','1445137423','1445137423','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_id','group_id','varchar(100) NULL','string','','','0','','0','0','1','1445137498','1445137498','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('added_person','added_person','int(10) NULL','num','0','','0','','0','0','1','1445137522','1445137522','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_seckill` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'token',
`title`  varchar(255) NULL  COMMENT '活动名称',
`cover`  int(10) UNSIGNED NULL  COMMENT '活动宣传图',
`start_time`  int(10) NULL  COMMENT '活动开始时间',
`end_time`  int(10) NULL  COMMENT '活动结束时间',
`content`  text  NULL  COMMENT '活动描述',
`is_subcribe`  char(10) NULL  COMMENT '是否需要关注公众号才能参加',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('seckill','秒杀活动','0','','1','["title","cover","start_time","end_time","is_subcribe","content"]','1:基础','','','','','title:活动标题\r\nstart_time:活动时间\r\ncount:商品数量\r\norder_count:订单数量\r\nstatus:状态\r\nid:操作:add_goods&id=[id]|管理秒杀商品,preview&id=[id]|预览,index&_addons=Seckill&_controller=Wap&id=[id]|复制链接,[EDIT]|编辑,[DELETE]|删除','10','','','1445223289','1445481849','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1445223330','1445223330','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(255) NULL','string','','','1','','0','0','1','1445223374','1445223374','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','活动宣传图','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1445223410','1445223410','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','活动开始时间','int(10) NULL','datetime','','','1','','0','0','1','1445223455','1445223455','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','活动结束时间','int(10) NULL','datetime','','','1','','0','0','1','1445223479','1445223479','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','活动描述','text  NULL','editor','','','1','','0','0','1','1445223539','1445223539','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_subcribe','是否需要关注公众号才能参加','char(10) NULL','radio','','','1','0:不需要关注\r\n1:需要关注','0','0','1','1445223919','1445223919','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_seckill_goods` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`goods_id`  int(10) NULL  COMMENT '商品Id',
`seckill_id`  int(10) NULL  COMMENT '秒杀活动Id',
`seckill_price`  int(10) NULL  COMMENT '秒杀价',
`seckill_count`  int(10) NULL  COMMENT '秒杀数量',
`seckill_title`  varchar(255) NULL  COMMENT '秒杀商品名称',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('seckill_goods','秒杀活动商品','0','','1','["seckill_price","seckill_title","seckill_count"]','1:基础','','','','','title:商品信息\r\nseckill_count:秒杀价\r\nseckill_count:描述数量\r\nseckill_title:自定义商品标题','10','','','1445225061','1445225542','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品Id','int(10) NULL','num','','','0','','0','0','1','1445225185','1445225185','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_id','秒杀活动Id','int(10) NULL','num','','','0','','0','0','1','1445225218','1445225218','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_price','秒杀价','int(10) NULL','num','','','1','','0','0','1','1445225251','1445225251','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_count','秒杀数量','int(10) NULL','num','','','1','','0','0','1','1445225276','1445225276','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_title','秒杀商品名称','varchar(255) NULL','string','','不填写将使用商品的默认标题','1','','0','0','1','1445225344','1445225344','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_seckill_order` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`seckill_id`  int(10) NULL  COMMENT '活动Id',
`order_id`  int(10) NULL  COMMENT '订单Id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('seckill_order','秒杀订单表','0','','1','','1:基础','','','','','','10','','','1445323068','1445323068','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_id','活动Id','int(10) NULL','num','','','1','','0','0','1','1445323107','1445323107','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_id','订单Id','int(10) NULL','num','','','1','','0','0','1','1445323145','1445323145','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_extensions` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword_type`  tinyint(2) NULL  DEFAULT 0 COMMENT '关键词匹配类型',
`api_token`  varchar(255) NOT NULL  COMMENT 'Token',
`cTime`  int(10) NOT NULL  COMMENT '创建时间',
`api_url`  varchar(255) NOT NULL  COMMENT '第三方URL',
`output_format`  tinyint(1) NULL  DEFAULT 0 COMMENT '数据输出格式',
`keyword_filter`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '关键词过滤',
`keyword`  varchar(255) NOT NULL  COMMENT '关键词',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('extensions','融合第三方','0','','1','','1:基础','','','','','keyword:关键词\r\nkeyword_filter|get_name_by_status:关键词过滤\r\noutput_format|get_name_by_status:数据输出格式\r\napi_url:第三方地址\r\napi_token:Token\r\ncTime|time_format:增加时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','keyword','','1393911774','1394267850','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词匹配类型','tinyint(2) NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配','0','0','1','1394268247','1393921586','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('api_token','Token','varchar(255) NOT NULL','string','','','1','','0','0','1','1393922455','1393912408','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NOT NULL','datetime','','','0','','0','0','1','1393913608','1393913608','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('api_url','第三方URL','varchar(255) NOT NULL','string','','','1','','0','0','1','1393912354','1393912354','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('output_format','数据输出格式','tinyint(1) NULL','select','0','','1','0:标准微信xml\r\n1:json格式','0','0','1','1394268422','1393912288','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_filter','关键词过滤','tinyint(2) NOT NULL','bool','0','如设置电影为触发词,用户输入 电影 美国派 时，如果启用过滤只将美国派这个词发送到的你的接口，如果不过滤 就是整个 电影 美国派全部发送到的接口','1','0:不过滤\r\n1:过滤','0','0','1','1394268410','1393912057','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(255) NOT NULL','string','','多个关键词请用空格格开','1','','0','1','1','1393912492','1393911842','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1402454223','1402454223','','3','','regex','get_token','1','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_custom_sendall` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`ToUserName`  varchar(255) NULL  COMMENT 'token',
`FromUserName`  varchar(255) NULL  COMMENT 'openid',
`cTime`  int(10) NULL  COMMENT '创建时间',
`msgType`  varchar(255) NULL  COMMENT '消息类型',
`manager_id`  int(10) NULL  COMMENT '管理员id',
`content`  text NULL  COMMENT '内容',
`media_id`  varchar(255) NULL  COMMENT '多媒体文件id',
`is_send`  int(10) NULL  COMMENT '是否已经发送',
`uid`  int(10) NULL  COMMENT '粉丝uid',
`news_group_id`  varchar(10) NULL  COMMENT '图文组id',
`video_title`  varchar(255) NULL  COMMENT '视频标题',
`video_description`  text NULL  COMMENT '视频描述',
`video_thumb`  varchar(255) NULL  COMMENT '视频缩略图',
`voice_id`  int(10) NULL  COMMENT '语音id',
`image_id`  int(10) NULL  COMMENT '图片id',
`video_id`  int(10) NULL  COMMENT '视频id',
`send_type`  int(10) NULL  COMMENT '发送方式',
`send_opends`  text NULL  COMMENT '指定用户',
`group_id`  int(10) NULL  COMMENT '分组id',
`diff`  int(10) NULL  DEFAULT 0 COMMENT '区分消息标识',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('custom_sendall','客服群发消息','0','','1','','1:基础','','','','','','10','','','1445581508','1445581508','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ToUserName','token','varchar(255) NULL','string','','','1','','0','0','1','1445581587','1445581587','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('FromUserName','openid','varchar(255) NULL','string','','','1','','0','0','1','1445581615','1445581615','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','1','','0','0','1','1445581644','1445581644','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgType','消息类型','varchar(255) NULL','string','','','1','','0','0','1','1445581672','1445581672','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员id','int(10) NULL','num','','','1','','0','0','1','1445581718','1445581718','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','text NULL','textarea','','','1','','0','0','1','1445581737','1445581737','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','多媒体文件id','varchar(255) NULL','string','','','1','','0','0','1','1445582721','1445582721','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_send','是否已经发送','int(10) NULL','num','','','1','0:未发\r\n1:已发','0','0','1','1445582773','1445582773','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','粉丝uid','int(10) NULL','num','','','1','','0','0','1','1445592920','1445592920','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('news_group_id','图文组id','varchar(10) NULL','string','','','1','','0','0','1','1445598286','1445596916','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('video_title','视频标题','varchar(255) NULL','string','','','1','','0','0','1','1445682506','1445682506','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('video_description','视频描述','text NULL','textarea','','','1','','0','0','1','1445682610','1445682610','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('video_thumb','视频缩略图','varchar(255) NULL','string','','','1','','0','0','1','1445683008','1445683008','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('voice_id','语音id','int(10) NULL','num','','','1','','0','0','1','1445841174','1445841174','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('image_id','图片id','int(10) NULL','num','','','1','','0','0','1','1445841192','1445841192','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('video_id','视频id','int(10) NULL','num','','','1','','0','0','1','1445841214','1445841214','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_type','发送方式','int(10) NULL','num','','','1','0:分组\r\n1:指定用户','0','0','1','1445845420','1445845420','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('send_opends','指定用户','text NULL','textarea','','','1','','0','0','1','1445845456','1445845456','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('group_id','分组id','int(10) NULL','num','','','1','','0','0','1','1445845501','1445845501','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('diff','区分消息标识','int(10) NULL','num','0','','1','','0','0','1','1445849529','1445849529','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_sms` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`from_type`  varchar(255) NULL  COMMENT '用途',
`code`  varchar(255) NULL  COMMENT '验证码',
`smsId`  varchar(255) NULL  COMMENT '短信唯一标识',
`phone`  varchar(255) NULL  COMMENT '手机号',
`cTime`  int(10) NULL  COMMENT '创建时间',
`status`  int(10) NULL  COMMENT '使用状态',
`plat_type`  int(10) NULL  COMMENT '平台标识',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('sms','短信记录','0','','1','','1:基础','','','','','','10','','','1446107661','1446107661','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('from_type','用途','varchar(255) NULL','string','','','1','','0','0','1','1446107717','1446107717','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('code','验证码','varchar(255) NULL','string','','','1','','0','0','1','1446110095','1446110095','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('smsId','短信唯一标识','varchar(255) NULL','string','','','1','','0','0','1','1446110244','1446110244','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('phone','手机号','varchar(255) NULL','string','','','1','','0','0','1','1446110276','1446110276','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1446110405','1446110405','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','使用状态','int(10) NULL','num','','','1','','0','0','1','1446110690','1446110690','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('plat_type','平台标识','int(10) NULL','num','','','1','','0','0','1','1446110716','1446110716','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_msgwall` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '标题',
`number`  int(10) NULL  DEFAULT 0 COMMENT '每人上墙次数',
`frequency`  char(50) NULL  DEFAULT 0 COMMENT '每人上墙频率',
`more_screen`  char(10) NULL  DEFAULT 0 COMMENT '是否多屏幕',
`logo_img`  int(10) UNSIGNED NULL  COMMENT '微上墙LOGO',
`bg_img`  int(10) UNSIGNED NULL  COMMENT '上墙背景图片',
`gallery_pic`  varchar(255) NULL  COMMENT '相册图',
`music`  int(10) UNSIGNED NULL  COMMENT '上墙音乐地址',
`token`  varchar(255) NULL  COMMENT 'token',
`cTime`  int(10) NULL  COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_msgwall','微上墙','0','','1','["title","number","frequency","more_screen","logo_img","bg_img","gallery_pic","music"]','1:基础','','','','','id:序号\r\ntitle:名称\r\nlogo_img|get_img_html:LOGO图片\r\ncTime|time_format:创建时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1449475310','1449490668','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NULL','string','','','1','','0','1','1','1449475378','1449475378','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('number','每人上墙次数','int(10) NULL','num','0','设置为0或不设置则表示不限制','1','','0','0','1','1449475439','1449475439','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('frequency','每人上墙频率','char(50) NULL','select','0','','1','0:--不限制--\r\n30000:30秒\r\n60000:1分钟\r\n120000:2分钟\r\n180000:3分钟\r\n300000:5分钟','0','0','1','1449478239','1449475586','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('more_screen','是否多屏幕','char(10) NULL','radio','0','选多屏幕后，上墙留言与上墙二维码将在不同的页面展示','1','0:否\r\n1:是','0','0','1','1449475667','1449475667','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('logo_img','微上墙LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为382*52像素，不上传则使用默认LOGO','1','','0','0','1','1449475754','1449475754','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bg_img','上墙背景图片','int(10) UNSIGNED NULL','picture','','上传的图片尺寸不小于800*600像素，大小不能超过2M，不上传则使用默认图片','1','','0','0','1','1449475809','1449475809','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gallery_pic','相册图','varchar(255) NULL','mult_picture','','图片大小为600x600像素，体积不超过200K','1','','0','0','1','1449475881','1449475881','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('music','上墙音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','0','1','1449475937','1449475937','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1449476242','1449476242','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1449476751','1449476751','','3','','regex','time','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_sponsor` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`msgwall_id`  int(10) NULL  COMMENT '微上墙编号',
`token`  varchar(255) NULL  COMMENT 'token',
`name`  varchar(255) NULL  COMMENT '名称',
`img`  int(10) UNSIGNED NULL  COMMENT '图片',
`sort`  int(10) NULL  DEFAULT 0 COMMENT '排序',
`is_del`  int(10) NULL  DEFAULT 0 COMMENT '是否删除',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_sponsor','赞助商','0','','1','["name","img","is_del"]','1:基础','','','','','','10','','','1449476134','1449490684','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_id','微上墙编号','int(10) NULL','num','','','4','','0','0','1','1449476186','1449476186','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1449476316','1449476316','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','名称','varchar(255) NULL','string','','','1','','0','0','1','1449476365','1449476365','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','图片','int(10) UNSIGNED NULL','picture','','','1','','0','0','1','1449476389','1449476389','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序','int(10) NULL','num','0','','0','','0','0','1','1449486537','1449479299','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否删除','int(10) NULL','num','0','','1','0:未删除\r\n1:删除','0','0','1','1449479337','1449479337','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_shake` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '标题',
`company_logo`  int(10) UNSIGNED NULL  COMMENT '商家LOGO',
`shake_logo`  int(10) UNSIGNED NULL  COMMENT '摇一摇LOGO',
`bg_img`  int(10) UNSIGNED NULL  COMMENT '摇一摇背景图片',
`times`  char(50) NULL  COMMENT '摇动次数',
`once`  char(10) NULL  COMMENT '单轮/多轮',
`warm_sec`  char(50) NULL  DEFAULT 30 COMMENT '开始倒计时',
`prize_message`  text NULL  COMMENT '获奖后推送信息',
`repeat`  char(10) NULL  DEFAULT 1 COMMENT '允许重复中奖',
`shake_music`  int(10) UNSIGNED NULL  COMMENT '摇一摇音乐地址',
`award_music`  int(10) UNSIGNED NULL  COMMENT '颁奖音乐地址',
`token`  varchar(255) NULL  COMMENT 'token',
`cTime`  int(10) NULL  COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_shake','摇一摇游戏','0','','1','["title","company_logo","shake_logo","bg_img","times","once","warm_sec","prize_message","repeat","shake_music","award_music"]','1:基础','','','','','id:序号\r\ntitle:名称\r\ntimes:摇动次数上限\r\nonce|get_name_by_status:轮数\r\ncTime|time_format:创建时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1449539020','1449542648','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NULL','string','','','1','','0','1','1','1449539134','1449539134','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('company_logo','商家LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为300*220像素，透明png图片','1','','0','1','1','1449539228','1449539181','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_logo','摇一摇LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为382*52像素，不上传则使用默认LOGO','1','','0','0','1','1449539268','1449539268','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bg_img','摇一摇背景图片','int(10) UNSIGNED NULL','picture','','上传的图片尺寸不小于800*600像素，大小不能超过2M，不上传则使用默认图片','1','','0','0','1','1449539314','1449539314','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('times','摇动次数','char(50) NULL','select','','','1','100:100次（约20秒）\r\n200:200次（约40秒）\r\n300:300次（约60秒）\r\n400:400次（约80秒）\r\n500:500次（约100秒）\r\n600:600次（约120秒）','0','1','1','1449539483','1449539483','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('once','单轮/多轮','char(10) NULL','radio','','','1','0:多轮游戏\r\n1:单轮游戏','0','0','1','1449539596','1449539596','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('warm_sec','开始倒计时','char(50) NULL','select','30','进入游戏后倒计时多长时间开始游戏，不设置默认30秒','1','30:--请选择--\r\n60:1分钟\r\n120:2分钟\r\n180:3分钟\r\n300:5分钟','0','0','1','1449545117','1449539806','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_message','获奖后推送信息','text NULL','textarea','','','1','','0','0','1','1449540174','1449540174','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('repeat','允许重复中奖','char(10) NULL','radio','1','说明：多轮游戏时，当前轮的中奖人在接下来的轮数中能否中奖','1','1:允许\r\n0:不允许','0','0','1','1449540275','1449540251','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_music','摇一摇音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','0','1','1449540311','1449540311','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_music','颁奖音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','0','1','1449540352','1449540352','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1449540516','1449540516','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1449540546','1449540546','','3','','regex','time','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_shake_award` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'token',
`shake_id`  int(10) NULL  COMMENT '摇一摇编号',
`award_id`  int(10) NULL  COMMENT '奖品编号',
`order`  int(10) NULL  DEFAULT 1 COMMENT '排序',
`prize_level`  varchar(255) NULL  COMMENT '奖项等级',
`number`  int(10) NULL  COMMENT '获奖人数',
`is_del`  int(10) NULL  DEFAULT 0 COMMENT '是否删除',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_shake_award','摇一摇奖项设置','0','','1','','1:基础','','','','','','10','','','1449540463','1449540463','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1449540618','1449540618','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_id','摇一摇编号','int(10) NULL','num','','','4','','0','0','1','1449540651','1449540651','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_id','奖品编号','int(10) NULL','num','','','4','','0','0','1','1449540708','1449540708','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order','排序','int(10) NULL','num','1','','1','','0','0','1','1449540771','1449540771','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_level','奖项等级','varchar(255) NULL','string','','','1','','0','0','1','1449540872','1449540872','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('number','获奖人数','int(10) NULL','num','','','1','','0','0','1','1449540943','1449540943','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否删除','int(10) NULL','num','0','','0','0:否\r\n1:是','0','0','1','1449547977','1449547977','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_game_live_pick` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NULL  COMMENT '名称',
`company_logo`  int(10) UNSIGNED NULL  COMMENT '商家LOGO',
`game_logo`  int(10) UNSIGNED NULL  COMMENT '游戏LOGO',
`bg_img`  int(10) UNSIGNED NULL  COMMENT '游戏背景图片',
`prize_msg`  text NULL  COMMENT '获奖后推送信息',
`limit`  int(10) NULL  DEFAULT 100 COMMENT '中奖人数上限',
`token`  varchar(255) NULL  COMMENT 'token',
`cTime`  int(10) NULL  COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_game_live_pick','现场抽奖游戏','0','','1','["title","company_logo","game_logo","bg_img","prize_msg","limit"]','1:基础','','','','','id:序号\r\ntitle:名称\r\nlimit:人数上限\r\ncTime|time_format:创建时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1449541145','1449542703','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','名称','varchar(255) NULL','string','','','1','','0','1','1','1449541228','1449541228','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('company_logo','商家LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为300*220像素，透明png图片','1','','0','1','1','1449541988','1449541896','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_logo','游戏LOGO','int(10) UNSIGNED NULL','picture','','显示于页面左上角，图片尺寸为382*52像素，不上传则使用默认LOGO','1','','0','0','1','1449541936','1449541936','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bg_img','游戏背景图片','int(10) UNSIGNED NULL','picture','','上传的图片尺寸不小于800*600像素，大小不能超过2M，不上传则使用默认图片','1','','0','0','1','1449542027','1449542027','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_msg','获奖后推送信息','text NULL','textarea','','说明：在用户获奖后，该信息将会推送给用户。','1','','0','0','1','1449542083','1449542083','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('limit','中奖人数上限','int(10) NULL','num','100','','1','','0','0','1','1449542132','1449542132','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1449542177','1449542177','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1449559746','1449559746','','3','','regex','time','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_live` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'token',
`cTime`  int(10) NULL  COMMENT '创建时间',
`title`  varchar(255) NULL  COMMENT '微现场名称',
`qrcode`  varchar(255) NULL  COMMENT '商家微信二维码',
`msgwall_id`  varchar(255) NULL  COMMENT '微上墙',
`shake_id`  varchar(255) NULL  COMMENT '摇一摇',
`start_time`  int(10) NULL  COMMENT '摇一摇开始时间',
`live_id`  varchar(255) NULL  COMMENT '现场抽奖',
`start_pwd`  varchar(255) NULL  COMMENT '遥控器密码',
`pic_pwd`  varchar(255) NULL  COMMENT '上传图片密码',
`up_push`  varchar(255) NULL  COMMENT 'up上墙回复文字',
`success_push`  varchar(255) NULL  COMMENT '上墙成功回复文字',
`game_msg_title`  varchar(255) NULL  COMMENT '游戏开始图文标题',
`game_msg_intro`  varchar(255) NULL  COMMENT '游戏开始图文介绍',
`game_msg_img`  int(10) UNSIGNED NULL  COMMENT '游戏开始图文图片',
`review_msg_title`  varchar(255) NULL  COMMENT '精彩回放图文标题',
`review_msg_intro`  varchar(255) NULL  COMMENT '精彩回放图文介绍',
`review_music`  int(10) UNSIGNED NULL  COMMENT '精彩回放音乐地址',
`album_cover`  int(10) UNSIGNED NULL  COMMENT '相册封面设置',
`water_marker`  int(10) UNSIGNED NULL  COMMENT '相册封面水印',
`status`  char(10) NULL  DEFAULT 0 COMMENT '是否启用',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_live','微现场','0','','1','["title","msgwall_id","shake_id","start_time","live_id","start_pwd","pic_pwd","up_push","success_push","game_msg_title","game_msg_intro","game_msg_img","review_msg_title","review_msg_intro","review_music","album_cover","water_marker"]','1:基础','','','','','title:8%名称\r\nmsgwall_id:8%上墙名称\r\nshake_id:8%摇一摇名称\r\nlive_id:8%微现场抽奖\r\nstart_pwd:8%遥控器密码\r\npic_pwd:8%上传图片密码\r\nstart_time|time_format:10%摇一摇开始时间\r\nqrcode:8%二维码\r\nstatus|get_name_by_status:5%是否启用\r\nlinks:25%常用链接\r\nid:5%操作:[EDIT]|编辑','10','title:请输入名称搜索','','1449542782','1449570563','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1449542821','1449542821','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','0','1','1449560865','1449543151','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','微现场名称','varchar(255) NULL','string','','','1','','0','1','1','1449543177','1449543177','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('qrcode','商家微信二维码','varchar(255) NULL','string','','','0','','0','0','1','1449543352','1449543352','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_id','微上墙','varchar(255) NULL','dynamic_select','','','1','type=db&table=mini_msgwall&msgwall_id=id','0','0','1','1449560689','1449543521','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_id','摇一摇','varchar(255) NULL','dynamic_select','','','1','type=db&table=mini_shake&shake_id=id','0','0','1','1449560768','1449543571','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','摇一摇开始时间','int(10) NULL','datetime','','','1','','0','0','1','1449543616','1449543616','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场抽奖','varchar(255) NULL','dynamic_select','','','1','type=db&table=mini_game_live_pick&live_id=id','0','0','1','1449560728','1449543678','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_pwd','遥控器密码','varchar(255) NULL','string','','设置密码后，在手机端微信发送“遥控器”或“ykq”进入遥控器界面,并通过此密码验证后方能使用微现场遥控器','1','','0','0','1','1449543808','1449543787','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pic_pwd','上传图片密码','varchar(255) NULL','string','','设置密码后，在手机端微信发送“pic”进入上传图片模式,通过此密码验证后方能上传活动现场图片','1','','0','0','1','1449543841','1449543841','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('up_push','up上墙回复文字','varchar(255) NULL','string','','设置后,用户发送up，或扫描上墙的回复信息！','1','','0','0','1','1449543886','1449543886','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('success_push','上墙成功回复文字','varchar(255) NULL','string','','设置后,用户上墙留言成功后的回复信息！{userName}为用户的微信名。','1','','0','0','1','1449543955','1449543955','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_msg_title','游戏开始图文标题','varchar(255) NULL','string','','设置后,游戏开始时推送的图文标题。','1','','0','0','1','1449544017','1449544017','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_msg_intro','游戏开始图文介绍','varchar(255) NULL','string','','设置后,游戏开始时推送的图文介绍文字。','1','','0','0','1','1449544242','1449544242','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_msg_img','游戏开始图文图片','int(10) UNSIGNED NULL','picture','','此为游戏开始图文图片，尺寸为540*300像素','1','','0','0','1','1449544325','1449544325','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('review_msg_title','精彩回放图文标题','varchar(255) NULL','string','','设置后,游戏开始时推送的图文介绍文字。','1','','0','0','1','1449544377','1449544377','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('review_msg_intro','精彩回放图文介绍','varchar(255) NULL','string','','设置后,游戏开始时推送的图文介绍文字。','1','','0','0','1','1449544416','1449544416','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('review_music','精彩回放音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','0','1','1449544465','1449544465','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('album_cover','相册封面设置','int(10) UNSIGNED NULL','picture','','此为精彩回放相册封面图片，尺寸为640*1008像素','1','','0','0','1','1449544507','1449544507','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('water_marker','相册封面水印','int(10) UNSIGNED NULL','picture','','此为精彩回放相册水印图片，尺寸为230*60像素','1','','0','0','1','1449544547','1449544547','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','是否启用','char(10) NULL','radio','0','','0','0:已禁用\r\n1:已启用','0','0','1','1449746518','1449560283','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_monitor` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`live_id`  int(10) NULL  COMMENT '现场编号',
`token`  varchar(255) NULL  COMMENT 'token',
`msgwall_state`  int(10) NULL  DEFAULT 0 COMMENT '上墙状态',
`wecome_state`  int(10) NULL  DEFAULT 0 COMMENT '开场欢迎状态',
`game_state`  int(10) NULL  DEFAULT 0 COMMENT '进入游戏状态',
`playback_state`  int(10) NULL  DEFAULT 0 COMMENT '精彩回放状态',
`music_state`  int(10) NULL  DEFAULT 1 COMMENT '音乐播放状态',
`music_size`  int(10) NULL  DEFAULT 5 COMMENT '音乐大小',
`winner_next`  int(10) NULL  DEFAULT 0 COMMENT '获奖人下一页',
`is_end`  int(10) NULL  DEFAULT 0 COMMENT '是否已结束',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_monitor','摇控器','0','','1','','1:基础','','','','','','10','','','1449739986','1449739986','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','0','1','1449740020','1449740020','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','0','1','1449740060','1449740060','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_state','上墙状态','int(10) NULL','num','0','','1','0:未启动\r\n1:启动','0','0','1','1449740215','1449740215','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wecome_state','开场欢迎状态','int(10) NULL','num','0','','1','0:未启动\r\n1:启动','0','0','1','1449740393','1449740393','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_state','进入游戏状态','int(10) NULL','num','0','','1','0:结束游戏\r\n1:进入游戏','0','0','1','1449740466','1449740466','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('playback_state','精彩回放状态','int(10) NULL','num','0','','1','0:未进入\r\n1:进入','0','0','1','1449740695','1449740695','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('music_state','音乐播放状态','int(10) NULL','num','1','','1','0:暂停\r\n1:开始','0','0','1','1449740778','1449740778','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('music_size','音乐大小','int(10) NULL','num','5','数值越大，声音越大','1','','0','0','1','1449740844','1449740844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('winner_next','获奖人下一页','int(10) NULL','num','0','','1','0:下一页\r\n1:上一页','0','0','1','1449740988','1449740988','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_end','是否已结束','int(10) NULL','num','0','','1','1:结束\r\n0:未结束','0','0','1','1449801349','1449801349','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_upwall_user` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`uid`  int(10) NULL  COMMENT '用户uid ',
`live_id`  int(10) NULL  COMMENT '现场编号',
`state`  int(10) NULL  DEFAULT 0 COMMENT '状态',
`cTime`  int(10) NULL  COMMENT '加入时间',
`is_black`  int(10) NULL  DEFAULT 0 COMMENT '黑名单',
`openid`  varchar(255) NULL  COMMENT 'openid',
`is_pic`  int(10) NULL  DEFAULT 0 COMMENT '是否上传照片',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('upwall_user','可上墙用户','0','','1','','1:基础','','','','','','10','','','1449801549','1449801549','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户uid ','int(10) NULL','num','','','1','','0','0','1','1449801576','1449801576','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','0','1','1449801595','1449801595','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','状态','int(10) NULL','num','0','','1','0:不能上场\r\n1:可上场','0','0','1','1449801647','1449801647','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','加入时间','int(10) NULL','datetime','','','1','','0','0','1','1449801666','1449801666','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_black','黑名单','int(10) NULL','num','0','','1','','0','0','1','1449805299','1449805299','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','openid','varchar(255) NULL','string','','','1','','0','0','1','1449807405','1449807405','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_pic','是否上传照片','int(10) NULL','num','0','','1','0:正常\r\n1:等待输入密码\r\n2:可上传图片','0','0','1','1449825872','1449823542','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_msgwall_content` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cTime`  int(10) NULL  COMMENT '留言时间',
`live_id`  int(10) NULL  COMMENT '现场编号',
`content`  text NULL  COMMENT '内容',
`openid`  varchar(255) NULL  COMMENT 'openid',
`msgwall_id`  int(10) NULL  COMMENT '上墙编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('msgwall_content','上墙留言','0','','1','','1:基础','','','','','','10','','','1449803523','1449803523','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','留言时间','int(10) NULL','datetime','','','1','','0','0','1','1449803554','1449803554','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','0','1','1449803589','1449803589','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','text NULL','textarea','','','1','','0','0','1','1449803609','1449803609','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','openid','varchar(255) NULL','string','','','1','','0','0','1','1449815078','1449815078','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_id','上墙编号','int(10) NULL','num','','','1','','0','0','1','1449820392','1449820392','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_live_pic` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`live_id`  int(10) NULL  COMMENT '现场编号',
`cTime`  int(10) NULL  COMMENT '创建时间',
`pic_url`  varchar(255) NULL  COMMENT '图片链接',
`openid`  varchar(255) NULL  COMMENT '上传用户',
`media_id`  varchar(255) NULL  COMMENT '微信图片id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_live_pic','精彩回放图片','0','','1','','1:基础','','','','','','10','','','1449827763','1449827763','1','MyISAM','');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','0','1','1449827787','1449827787','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','1','','0','0','1','1449827819','1449827819','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pic_url','图片链接','varchar(255) NULL','string','','','1','','0','0','1','1449827858','1449827858','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','上传用户','varchar(255) NULL','string','','','1','','0','0','1','1449828109','1449828051','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','微信图片id','varchar(255) NULL','string','','','1','','0','0','1','1449828327','1449828327','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


