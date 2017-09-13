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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('analysis','统计分析','0','','1','','1:基础','','','','','','20','','','1432806941','1432806941','1','MyISAM','Analysis');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sports_id','sports_id','int(10) NULL','num','','','0','','0','0','1','1432806979','1432806979','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','type','varchar(30) NULL','string','','','0','','0','0','1','1432807001','1432807001','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('time','time','varchar(50) NULL','string','','','0','','0','0','1','1432807028','1432807028','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('total_count','total_count','int(10) NULL','num','0','','0','','0','0','1','1432807049','1432807049','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follow_count','follow_count','int(10) NULL','num','0','','0','','0','0','1','1432807063','1432807063','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aver_count','aver_count','int(10) NULL','num','0','','0','','0','0','1','1432807079','1432807079','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;
