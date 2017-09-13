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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_msgwall','微上墙','0','','1','["title","number","frequency","more_screen","logo_img","bg_img","gallery_pic","music"]','1:基础','','','','','id:序号\r\ntitle:名称\r\nlogo_img|get_img_html:LOGO图片\r\ncTime|time_format:创建时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1449475310','1449490668','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NULL','string','','','1','','0','mini_msgwall','1','1','1449475378','1449475378','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('number','每人上墙次数','int(10) NULL','num','0','设置为0或不设置则表示不限制','1','','0','mini_msgwall','0','1','1449475439','1449475439','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('frequency','每人上墙频率','char(50) NULL','select','0','','1','0:--不限制--\r\n30000:30秒\r\n60000:1分钟\r\n120000:2分钟\r\n180000:3分钟\r\n300000:5分钟','0','mini_msgwall','0','1','1449478239','1449475586','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('more_screen','是否多屏幕','char(10) NULL','radio','0','选多屏幕后，上墙留言与上墙二维码将在不同的页面展示','0','0:否\r\n1:是','0','mini_msgwall','0','1','1451111967','1449475667','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('logo_img','微上墙LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为382*52像素，不上传则使用默认LOGO','1','','0','mini_msgwall','0','1','1449475754','1449475754','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bg_img','上墙背景图片','int(10) UNSIGNED NULL','picture','','上传的图片尺寸不小于800*600像素，大小不能超过2M，不上传则使用默认图片','1','','0','mini_msgwall','0','1','1449475809','1449475809','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gallery_pic','相册图','varchar(255) NULL','mult_picture','','图片大小为600x600像素，体积不超过200K','1','','0','mini_msgwall','0','1','1449475881','1449475881','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('music','上墙音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','mini_msgwall','0','1','1449475937','1449475937','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','mini_msgwall','0','1','1449476242','1449476242','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','mini_msgwall','0','1','1449476751','1449476751','','3','','regex','time','3','function');
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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_sponsor','赞助商','0','','1','["name","img","is_del"]','1:基础','','','','','','10','','','1449476134','1449490684','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_id','微上墙编号','int(10) NULL','num','','','4','','0','mini_sponsor','0','1','1449476186','1449476186','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','mini_sponsor','0','1','1449476316','1449476316','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','名称','varchar(255) NULL','string','','','1','','0','mini_sponsor','0','1','1449476365','1449476365','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('img','图片','int(10) UNSIGNED NULL','picture','','','1','','0','mini_sponsor','0','1','1449476389','1449476389','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序','int(10) NULL','num','0','','0','','0','mini_sponsor','0','1','1449486537','1449479299','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否删除','int(10) NULL','num','0','','1','0:未删除\r\n1:删除','0','mini_sponsor','0','1','1449479337','1449479337','','3','','regex','','3','function');
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
`cTime`  int(10) NULL  DEFAULT 100 COMMENT '创建时间',
`join_count`  int(10) NULL  DEFAULT 0 COMMENT '参与摇次数',
`attent_order`  int(10) NULL  DEFAULT 0 COMMENT '参与排序',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_shake','摇一摇游戏','0','','1','["title","company_logo","shake_logo","bg_img","times","once","warm_sec","prize_message","repeat","shake_music","award_music"]','1:基础','','','','','id:序号\r\ntitle:名称\r\ntimes:摇动次数上限\r\nonce|get_name_by_status:轮数\r\ncTime|time_format:创建时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,prize_lists?id=[id]|中奖列表','10','','','1449539020','1452058671','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NULL','string','','','1','','0','mini_shake','1','1','1449539134','1449539134','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('company_logo','商家LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为300*220像素，透明png图片','1','','0','mini_shake','1','1','1449539228','1449539181','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_logo','摇一摇LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为382*52像素，不上传则使用默认LOGO','1','','0','mini_shake','0','1','1449539268','1449539268','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bg_img','摇一摇背景图片','int(10) UNSIGNED NULL','picture','','上传的图片尺寸不小于800*600像素，大小不能超过2M，不上传则使用默认图片','1','','0','mini_shake','0','1','1449539314','1449539314','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('times','摇动次数','char(50) NULL','select','','','1','100:100次（约20秒）\r\n200:200次（约40秒）\r\n300:300次（约60秒）\r\n400:400次（约80秒）\r\n500:500次（约100秒）\r\n600:600次（约120秒）','0','mini_shake','1','1','1449539483','1449539483','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('once','单轮/多轮','char(10) NULL','radio','','','1','0:多轮游戏\r\n1:单轮游戏','0','mini_shake','0','1','1449539596','1449539596','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('warm_sec','开始倒计时','char(50) NULL','select','30','进入游戏后倒计时多长时间开始游戏，不设置默认30秒','1','30:--请选择--\r\n60:1分钟\r\n120:2分钟\r\n180:3分钟\r\n300:5分钟','0','mini_shake','0','1','1449545117','1449539806','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_message','获奖后推送信息','text NULL','textarea','','','1','','0','mini_shake','0','1','1449540174','1449540174','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('repeat','允许重复中奖','char(10) NULL','radio','1','说明：多轮游戏时，当前轮的中奖人在接下来的轮数中能否中奖','1','1:允许\r\n0:不允许','0','mini_shake','0','1','1449540275','1449540251','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_music','摇一摇音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','mini_shake','0','1','1449540311','1449540311','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_music','颁奖音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','mini_shake','0','1','1449540352','1449540352','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','mini_shake','0','1','1449540516','1449540516','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','100','','0','','0','mini_shake','0','1','1450942577','1449540546','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('join_count','参与摇次数','int(10) NULL','num','0','','0','','0','mini_shake','0','1','1450941525','1450941525','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attent_order','参与排序','int(10) NULL','num','0','','0','','0','mini_shake','0','1','1450947804','1450947804','','3','','regex','','3','function');
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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_shake_award','摇一摇奖项设置','0','','1','','1:基础','','','','','','10','','','1449540463','1449540463','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','mini_shake_award','0','1','1449540618','1449540618','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_id','摇一摇编号','int(10) NULL','num','','','4','','0','mini_shake_award','0','1','1449540651','1449540651','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_id','奖品编号','int(10) NULL','num','','','4','','0','mini_shake_award','0','1','1449540708','1449540708','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('order','排序','int(10) NULL','num','1','','1','','0','mini_shake_award','0','1','1449540771','1449540771','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_level','奖项等级','varchar(255) NULL','string','','','1','','0','mini_shake_award','0','1','1449540872','1449540872','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('number','获奖人数','int(10) NULL','num','','','1','','0','mini_shake_award','0','1','1449540943','1449540943','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_del','是否删除','int(10) NULL','num','0','','0','0:否\r\n1:是','0','mini_shake_award','0','1','1449547977','1449547977','','3','','regex','','3','function');
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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_game_live_pick','现场抽奖游戏','0','','1','["title","company_logo","game_logo","bg_img","prize_msg","limit"]','1:基础','','','','','id:序号\r\ntitle:名称\r\nlimit:人数上限\r\ncTime|time_format:创建时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','','','1449541145','1449542703','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','名称','varchar(255) NULL','string','','','1','','0','mini_game_live_pick','1','1','1449541228','1449541228','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('company_logo','商家LOGO','int(10) UNSIGNED NULL','picture','','上传的图片尺寸为300*220像素，透明png图片','1','','0','mini_game_live_pick','1','1','1449541988','1449541896','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_logo','游戏LOGO','int(10) UNSIGNED NULL','picture','','显示于页面左上角，图片尺寸为382*52像素，不上传则使用默认LOGO','1','','0','mini_game_live_pick','0','1','1449541936','1449541936','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bg_img','游戏背景图片','int(10) UNSIGNED NULL','picture','','上传的图片尺寸不小于800*600像素，大小不能超过2M，不上传则使用默认图片','1','','0','mini_game_live_pick','0','1','1449542027','1449542027','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_msg','获奖后推送信息','text NULL','textarea','','说明：在用户获奖后，该信息将会推送给用户。','1','','0','mini_game_live_pick','0','1','1449542083','1449542083','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('limit','中奖人数上限','int(10) NULL','num','100','','1','','0','mini_game_live_pick','0','1','1449542132','1449542132','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','mini_game_live_pick','0','1','1449542177','1449542177','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','mini_game_live_pick','0','1','1449559746','1449559746','','3','','regex','time','3','function');
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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_live','微现场','0','','1','["title","msgwall_id","shake_id","start_pwd","pic_pwd","up_push","success_push","game_msg_title","game_msg_intro","game_msg_img","review_msg_title","review_msg_intro","review_music","album_cover"]','1:基础','','','','','id:4%编号\r\ntitle:8%名称\r\nmsgwall_id:8%上墙名称\r\nshake_id:8%摇一摇名称\r\nstart_pwd:5%遥控器密码\r\npic_pwd:8%上传图片密码\r\nqrcode:8%二维码\r\nstatus|get_name_by_status:5%是否启用\r\nlinks:28%常用链接\r\nids:8%操作:[EDIT]|编辑','10','title:请输入名称搜索','','1449542782','1452589189','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','mini_live','0','1','1449542821','1449542821','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','0','','0','mini_live','0','1','1449560865','1449543151','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','微现场名称','varchar(255) NULL','string','','','1','','0','mini_live','1','1','1449543177','1449543177','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('qrcode','商家微信二维码','varchar(255) NULL','string','','','0','','0','mini_live','0','1','1449543352','1449543352','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_id','微上墙','varchar(255) NULL','dynamic_select','','','1','type=db&table=mini_msgwall&msgwall_id=id','0','mini_live','0','1','1449560689','1449543521','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_id','摇一摇','varchar(255) NULL','dynamic_select','','','1','type=db&table=mini_shake&shake_id=id','0','mini_live','0','1','1449560768','1449543571','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','摇一摇开始时间','int(10) NULL','datetime','','','0','','0','mini_live','0','1','1451269362','1449543616','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场抽奖','varchar(255) NULL','dynamic_select','','','0','type=db&table=mini_game_live_pick&live_id=id','0','mini_live','0','1','1451268584','1449543678','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_pwd','遥控器密码','varchar(255) NULL','string','','设置密码后，在手机端微信发送 "ykq" 进入遥控器界面,并通过此密码验证后方能使用微现场遥控器','1','','0','mini_live','0','1','1452584167','1449543787','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pic_pwd','上传图片密码','varchar(255) NULL','string','','设置密码后，在手机端微信发送“pic”进入上传图片模式,通过此密码验证后方能上传活动现场图片','1','','0','mini_live','0','1','1449543841','1449543841','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('up_push','up上墙回复文字','varchar(255) NULL','string','','设置后,用户发送up，或扫描上墙的回复信息！','1','','0','mini_live','0','1','1449543886','1449543886','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('success_push','上墙成功回复文字','varchar(255) NULL','string','','设置后,用户上墙留言成功后的回复信息！{userName}为用户的微信名。','1','','0','mini_live','0','1','1449543955','1449543955','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_msg_title','游戏开始图文标题','varchar(255) NULL','string','','设置后,游戏开始时推送的图文标题。','1','','0','mini_live','0','1','1449544017','1449544017','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_msg_intro','游戏开始图文介绍','varchar(255) NULL','string','','设置后,游戏开始时推送的图文介绍文字。','1','','0','mini_live','0','1','1449544242','1449544242','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_msg_img','游戏开始图文图片','int(10) UNSIGNED NULL','picture','','此为游戏开始图文图片，尺寸为540*300像素','1','','0','mini_live','0','1','1449544325','1449544325','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('review_msg_title','精彩回放图文标题','varchar(255) NULL','string','','设置后,游戏开始时推送的图文介绍文字。','1','','0','mini_live','0','1','1449544377','1449544377','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('review_msg_intro','精彩回放图文介绍','varchar(255) NULL','string','','设置后,游戏开始时推送的图文介绍文字。','1','','0','mini_live','0','1','1449544416','1449544416','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('review_music','精彩回放音乐地址','int(10) UNSIGNED NULL','file','','mp3格式的音乐,不上传则使用默认音乐','1','','0','mini_live','0','1','1449544465','1449544465','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('album_cover','相册封面设置','int(10) UNSIGNED NULL','picture','','此为精彩回放相册封面图片，尺寸为640*1008像素','1','','0','mini_live','0','1','1449544507','1449544507','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('water_marker','相册封面水印','int(10) UNSIGNED NULL','picture','','此为精彩回放相册水印图片，尺寸为230*60像素','0','','0','mini_live','0','1','1451268636','1449544547','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('status','是否启用','char(10) NULL','radio','0','','0','0:已禁用\r\n1:已启用','0','mini_live','0','1','1449746518','1449560283','','3','','regex','','3','function');
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
`winner_page`  int(10) NULL  DEFAULT 1 COMMENT '获奖人页数',
`shake_count`  int(10) NULL  DEFAULT 0 COMMENT '摇一摇轮数',
`is_speech`  int(10) NULL  DEFAULT 0 COMMENT '是否进行获奖感言',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_monitor','摇控器','0','','1','','1:基础','','','','','','10','','','1449739986','1449739986','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','mini_monitor','0','1','1449740020','1449740020','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','mini_monitor','0','1','1449740060','1449740060','','3','','regex','get_token','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_state','上墙状态','int(10) NULL','num','0','','1','0:未启动\r\n1:启动\r\n2:暂停\r\n3:关闭','0','mini_monitor','0','1','1450755837','1449740215','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('wecome_state','开场欢迎状态','int(10) NULL','num','0','','1','0:未启动\r\n1:启动\r\n3:关闭','0','mini_monitor','0','1','1450755986','1449740393','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('game_state','进入游戏状态','int(10) NULL','num','0','','1','0:结束游戏\r\n1:进入游戏\r\n2:开始游戏\r\n3:关闭\r\n4:倒计时','0','mini_monitor','0','1','1451378983','1449740466','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('playback_state','精彩回放状态','int(10) NULL','num','0','','1','0:未进入\r\n1:进入','0','mini_monitor','0','1','1449740695','1449740695','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('music_state','音乐播放状态','int(10) NULL','num','1','','1','0:暂停\r\n1:开始','0','mini_monitor','0','1','1449740778','1449740778','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('music_size','音乐大小','int(10) NULL','num','5','数值越大，声音越大','1','','0','mini_monitor','0','1','1449740844','1449740844','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('winner_page','获奖人页数','int(10) NULL','num','1','','1','','0','mini_monitor','0','1','1451099089','1449740988','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_count','摇一摇轮数','int(10) NULL','num','0','','1','','0','mini_monitor','0','1','1450777250','1450777250','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_speech','是否进行获奖感言','int(10) NULL','num','0','','1','0:关闭\r\n1:进行','0','mini_monitor','0','1','1451121204','1451121204','','3','','regex','','3','function');
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
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('upwall_user','可上墙用户','0','','1','','1:基础','','','','','','10','','','1449801549','1449801549','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户uid ','int(10) NULL','num','','','1','','0','upwall_user','0','1','1449801576','1449801576','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','upwall_user','0','1','1449801595','1449801595','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','状态','int(10) NULL','num','0','','1','0:不能上场\r\n1:可上场','0','upwall_user','0','1','1449801647','1449801647','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','加入时间','int(10) NULL','datetime','','','1','','0','upwall_user','0','1','1449801666','1449801666','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_black','黑名单','int(10) NULL','num','0','','1','','0','upwall_user','0','1','1449805299','1449805299','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','openid','varchar(255) NULL','string','','','1','','0','upwall_user','0','1','1449807405','1449807405','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_pic','是否上传照片','int(10) NULL','num','0','','1','0:正常\r\n1:等待输入密码\r\n2:可上传图片','0','upwall_user','0','1','1449825872','1449823542','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_msgwall_content` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cTime`  int(10) NULL  COMMENT '留言时间',
`live_id`  int(10) NULL  COMMENT '现场编号',
`content`  text NULL  COMMENT '内容',
`openid`  varchar(255) NULL  COMMENT 'openid',
`msgwall_id`  int(10) NULL  COMMENT '上墙编号',
`shake_count`  int(10) NULL  DEFAULT 0 COMMENT '摇一摇轮数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('msgwall_content','上墙留言','0','','1','','1:基础','','','','','','10','','','1449803523','1449803523','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','留言时间','int(10) NULL','datetime','','','1','','0','msgwall_content','0','1','1449803554','1449803554','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','msgwall_content','0','1','1449803589','1449803589','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','text NULL','textarea','','','1','','0','msgwall_content','0','1','1449803609','1449803609','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','openid','varchar(255) NULL','string','','','1','','0','msgwall_content','0','1','1449815078','1449815078','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('msgwall_id','上墙编号','int(10) NULL','num','','','1','','0','msgwall_content','0','1','1449820392','1449820392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_count','摇一摇轮数','int(10) NULL','num','0','','1','','0','msgwall_content','0','1','1451126138','1451126138','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_mini_live_pic` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`live_id`  int(10) NULL  COMMENT '现场编号',
`cTime`  int(10) NULL  COMMENT '创建时间',
`pic_url`  varchar(255) NULL  COMMENT '图片链接',
`openid`  varchar(255) NULL  COMMENT '上传用户',
`media_id`  varchar(255) NULL  COMMENT '微信图片id',
`cover_id`  int(10) NULL  COMMENT '本地图片id',
`shake_count`  int(10) NULL  DEFAULT 0 COMMENT '摇一摇游戏轮数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('mini_live_pic','精彩回放图片','0','','1','','1:基础','','','','','','10','','','1449827763','1449827763','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','mini_live_pic','0','1','1449827787','1449827787','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','创建时间','int(10) NULL','datetime','','','1','','0','mini_live_pic','0','1','1449827819','1449827819','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pic_url','图片链接','varchar(255) NULL','string','','','1','','0','mini_live_pic','0','1','1449827858','1449827858','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','上传用户','varchar(255) NULL','string','','','1','','0','mini_live_pic','0','1','1449828109','1449828051','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('media_id','微信图片id','varchar(255) NULL','string','','','1','','0','mini_live_pic','0','1','1449828327','1449828327','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover_id','本地图片id','int(10) NULL','num','','','0','','0','mini_live_pic','0','1','1450928276','1450928276','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_count','摇一摇游戏轮数','int(10) NULL','num','0','','1','','0','mini_live_pic','0','1','1451126560','1451126560','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shake_prize_user` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cTime`  int(10) NULL  COMMENT '中奖时间',
`live_id`  int(10) NULL  COMMENT '微现场编号',
`shake_id`  int(10) NULL  COMMENT '摇摇游戏编号',
`award_id`  int(10) NULL  COMMENT '奖品',
`uid`  int(10) NULL  COMMENT '中奖人',
`num`  int(10) NULL  DEFAULT 0 COMMENT '获奖数',
`state`  int(10) NULL  DEFAULT 0 COMMENT '兑奖状态',
`djtime`  int(10) NULL  COMMENT '兑奖时间',
`token`  varchar(255) NULL  COMMENT 'token',
`remark`  varchar(255) NULL  COMMENT '备注',
`scan_code`  varchar(255) NULL  COMMENT '核销码',
`ranking`  int(10) NULL  DEFAULT 0 COMMENT '中奖排名',
`shake_count`  int(10) NULL  DEFAULT 0 COMMENT '摇一摇游戏第几轮',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shake_prize_user','摇一摇游戏中奖表','0','','1','','1:基础','','','','','','10','','','1450952440','1450952459','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','中奖时间','int(10) NULL','datetime','','','0','','0','shake_prize_user','0','1','1450955039','1450955039','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','微现场编号','int(10) NULL','num','','','4','','0','shake_prize_user','0','1','1450955109','1450955109','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_id','摇摇游戏编号','int(10) NULL','num','','','4','','0','shake_prize_user','0','1','1450955135','1450955135','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('award_id','奖品','int(10) NULL','num','','','1','','0','shake_prize_user','0','1','1450955159','1450955159','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','中奖人','int(10) NULL','num','','','1','','0','shake_prize_user','0','1','1450955176','1450955176','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','获奖数','int(10) NULL','num','0','','1','','0','shake_prize_user','0','1','1450955272','1450955272','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','兑奖状态','int(10) NULL','num','0','','1','0:未兑奖\r\n1:已兑奖','0','shake_prize_user','0','1','1450955307','1450955307','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('djtime','兑奖时间','int(10) NULL','datetime','','','1','','0','shake_prize_user','0','1','1450955331','1450955331','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','shake_prize_user','0','1','1450955341','1450955341','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('remark','备注','varchar(255) NULL','string','','','1','','0','shake_prize_user','0','1','1450955365','1450955365','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('scan_code','核销码','varchar(255) NULL','string','','','1','','0','shake_prize_user','0','1','1450955381','1450955381','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ranking','中奖排名','int(10) NULL','num','0','','1','','0','shake_prize_user','0','1','1450959457','1450959457','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_count','摇一摇游戏第几轮','int(10) NULL','num','0','','1','','0','shake_prize_user','0','1','1451128120','1451128120','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shake_prize_content` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'token',
`uid`  int(10) NULL  COMMENT 'uid',
`content`  varchar(255) NULL  COMMENT '内容',
`cTime`  int(10) NULL  COMMENT '发表感言时间',
`live_id`  int(10) NULL  COMMENT '现场编号',
`prize_id`  int(10) NULL  COMMENT '中奖编号',
`shake_count`  int(10) NULL  DEFAULT 0 COMMENT '摇一摇游戏第几轮',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shake_prize_content','获奖感言','0','','1','','1:基础','','','','','','10','','','1451034305','1451034305','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','1','','0','shake_prize_content','0','1','1451034457','1451034457','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','uid','int(10) NULL','num','','','1','','0','shake_prize_content','0','1','1451034472','1451034472','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('content','内容','varchar(255) NULL','string','','','1','','0','shake_prize_content','0','1','1451034531','1451034531','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发表感言时间','int(10) NULL','datetime','','','1','','0','shake_prize_content','0','1','1451034600','1451034600','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','shake_prize_content','0','1','1451034629','1451034629','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('prize_id','中奖编号','int(10) NULL','num','','','1','','0','shake_prize_content','0','1','1451035324','1451034689','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_count','摇一摇游戏第几轮','int(10) NULL','num','0','','1','','0','shake_prize_content','0','1','1451126950','1451126950','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_shake_user_attend` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NULL  COMMENT 'token',
`live_id`  int(10) NULL  COMMENT '现场编号',
`shake_count`  int(10) NULL  DEFAULT 0 COMMENT '摇摇游戏轮数',
`uid`  int(10) NULL  COMMENT '用户',
`join_count`  int(10) NULL  DEFAULT 0 COMMENT '参与次数',
`shake_id`  int(10) NULL  COMMENT '摇摇游戏编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('shake_user_attend','微现场参与人数','0','','1','["live_id","shake_count","uid","join_count","shake_id"]','1:基础','','','','','','10','','','1451272170','1452045713','1','MyISAM','MiniLive');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','token','varchar(255) NULL','string','','','0','','0','shake_user_attend','0','1','1451272230','1451272230','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('live_id','现场编号','int(10) NULL','num','','','1','','0','shake_user_attend','0','1','1451272251','1451272251','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_count','摇摇游戏轮数','int(10) NULL','num','0','','1','','0','shake_user_attend','0','1','1451272287','1451272287','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户','int(10) NULL','num','','','1','','0','shake_user_attend','0','1','1451272336','1451272336','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('join_count','参与次数','int(10) NULL','num','0','','1','','0','shake_user_attend','0','1','1451365629','1451272401','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`model_name`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('shake_id','摇摇游戏编号','int(10) NULL','num','','','1','','0','shake_user_attend','0','1','1451272772','1451272772','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


