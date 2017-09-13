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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_reward','促销活动','0','','1','["title","start_time","end_time","is_mult","is_all_goods"]','1:基础','','','','','title:活动名称\r\nstart_time:有效期\r\nstatus:活动状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除','10','title:请输入活动名称搜索','','1442457808','1442544407','1','MyISAM','ShopReward');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(100) NULL','string','','','1','','0','shop_reward','1','1','1442457852','1442457852','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NULL','datetime','','','1','','0','shop_reward','1','1','1442457879','1442457879','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','过期时间','int(10) NULL','datetime','','','1','','0','shop_reward','1','1','1442457902','1442457902','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_mult','多级优惠','tinyint(2) NULL','bool','0','多级情况下每级优惠不累积叠加','1','0:否\r\n1:是','0','shop_reward','0','1','1442458033','1442458011','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_all_goods','适用的活动商品','tinyint(2) NULL','bool','0','','1','0:全部商品参与\r\n1:指定商品参与','0','shop_reward','0','1','1442458365','1442458365','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_ids','指定商品ID串','text NULL','textarea','','','0','','0','shop_reward','0','1','1442540989','1442458406','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','shop_reward','0','1','1442458439','1442458439','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(50) NULL','string','','','0','','0','shop_reward','0','1','1442458480','1442458480','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('manager_id','管理员ID','int(10) NULL','num','','','0','','0','shop_reward','0','1','1442458516','1442458516','','3','','regex','get_mid','1','function');
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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shop_reward_condition','优惠条件','0','','1','','1:基础','','','','','','10','','','1442458767','1442458767','1','MyISAM','ShopReward');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('condition','条件','decimal(11,2) NULL','num','','满多少元','1','','0','shop_reward_condition','1','1','1442458834','1442458834','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('reward_id','活动ID','int(10) NULL','num','','','0','','0','shop_reward_condition','0','1','1442458906','1442458906','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money','现在开关','tinyint(2) NULL','bool','','','0','0:关\r\n1:开','0','shop_reward_condition','0','1','1442542127','1442542127','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('money_param','现金参数','decimal(11,2) NULL','num','','','1','','0','shop_reward_condition','0','1','1442542160','1442542160','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('postage','免邮','tinyint(2) NULL','bool','0','','1','0:否\r\n1:是','0','shop_reward_condition','0','1','1442542224','1442542224','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','积分开关','tinyint(2) NULL','bool','0','','1','0:关\r\n1:开','0','shop_reward_condition','0','1','1442542268','1442542268','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score_param','积分参数','int(10) NULL','num','','','1','','0','shop_reward_condition','0','1','1442542292','1442542292','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_coupon','优惠券开关','tinyint(2) NULL','bool','0','','1','0:关\r\n1:开','0','shop_reward_condition','0','1','1442542329','1442542329','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shop_coupon_param','优惠券ID','int(10) NULL','num','','','1','','0','shop_reward_condition','0','1','1442542366','1442542366','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) NULL','num','0','','1','','0','shop_reward_condition','0','1','1442544909','1442544909','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


