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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('yaotv','电视节目','0','','1','','1:基础','','','','','','20','','','1426817666','1426817666','1','MyISAM','YaoTV');
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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('yaotv_activities','活动列表','0','','1','','1:基础','','','','','','20','','','1426819474','1426819474','1','MyISAM','YaoTV');
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


