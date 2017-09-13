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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('seckill','秒杀活动','0','','1','["title","cover","start_time","end_time","is_subcribe","content"]','1:基础','','','','','title:活动标题\r\nstart_time:活动时间\r\ncount:商品数量\r\norder_count:订单数量\r\nstatus:状态\r\nid:操作:add_goods&id=[id]|管理秒杀商品,preview&id=[id]|预览,index&_addons=Seckill&_controller=Wap&id=[id]|复制链接,[EDIT]|编辑,[DELETE]|删除','10','','','1445223289','1445481849','1','MyISAM','Seckill');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','seckill','0','1','1445223330','1445223330','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','活动名称','varchar(255) NULL','string','','','1','','0','seckill','0','1','1445223374','1445223374','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','活动宣传图','int(10) UNSIGNED NULL','picture','','最佳尺寸为640*320','1','','0','seckill','0','1','1476362635','1445223410','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','活动开始时间','int(10) NULL','datetime','','','1','','0','seckill','0','1','1445223455','1445223455','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','活动结束时间','int(10) NULL','datetime','','','1','','0','seckill','0','1','1445223479','1445223479','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','活动描述','text  NULL','editor','','','1','','0','seckill','0','1','1445223539','1445223539','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_subcribe','是否需要关注公众号才能参加','char(10) NULL','radio','','','1','0:不需要关注\r\n1:需要关注','0','seckill','0','1','1445223919','1445223919','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_seckill_goods` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`goods_id`  int(10) NULL  COMMENT '商品Id',
`seckill_id`  int(10) NULL  COMMENT '秒杀活动Id',
`seckill_price`  float(10) NULL  COMMENT '秒杀价',
`seckill_count`  int(10) NULL  COMMENT '秒杀数量',
`seckill_title`  varchar(255) NULL  COMMENT '秒杀商品名称',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('seckill_goods','秒杀活动商品','0','','1','["seckill_price","seckill_title","seckill_count"]','1:基础','','','','','title:商品信息\r\nseckill_count:秒杀价\r\nseckill_count:描述数量\r\nseckill_title:自定义商品标题','10','','','1445225061','1445225542','1','MyISAM','Seckill');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('goods_id','商品Id','int(10) NULL','num','','','0','','0','seckill_goods','0','1','1445225185','1445225185','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_id','秒杀活动Id','int(10) NULL','num','','','0','','0','seckill_goods','0','1','1445225218','1445225218','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_price','秒杀价','float(10) NULL','num','','','1','','0','seckill_goods','0','1','1457351116','1445225251','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_count','秒杀数量','int(10) NULL','num','','','1','','0','seckill_goods','0','1','1445225276','1445225276','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_title','秒杀商品名称','varchar(255) NULL','string','','不填写将使用商品的默认标题','1','','0','seckill_goods','0','1','1445225344','1445225344','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_seckill_order` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`seckill_id`  int(10) NULL  COMMENT '活动Id',
`order_id`  int(10) NULL  COMMENT '订单Id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('seckill_order','秒杀订单表','0','','1','','1:基础','','','','','','10','','','1445323068','1445323068','1','MyISAM','Seckill');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('seckill_id','活动Id','int(10) NULL','num','','','1','','0','seckill_order','0','1','1445323107','1445323107','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order_id','订单Id','int(10) NULL','num','','','1','','0','seckill_order','0','1','1445323145','1445323145','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


