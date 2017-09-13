CREATE TABLE `wp_cate` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`title`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`value`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' ,
`create_time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`sort`  tinyint(3) UNSIGNED NOT NULL DEFAULT 99 ,
`rank`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;

CREATE TABLE `wp_mytpl` (
`id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
`userid_int`  int(50) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Fixed
DELAY_KEY_WRITE=0
;

CREATE TABLE `wp_scene` (
`sceneid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`scenecode_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`scenename_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`scenetype_int`  int(11) NOT NULL DEFAULT 0 ,
`userid_int`  int(50) NOT NULL ,
`hitcount_int`  int(11) NOT NULL DEFAULT 0 ,
`createtime_time`  datetime NULL DEFAULT NULL ,
`musicurl_varchar`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`videocode_varchar`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`showstatus_int`  int(11) NOT NULL DEFAULT 1 COMMENT '显示状态1显示,2关闭' ,
`thumbnail_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图' ,
`movietype_int`  int(11) NULL DEFAULT 0 COMMENT '翻页方式' ,
`desc_varchar`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场景描述' ,
`ip_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`delete_int`  int(11) NOT NULL DEFAULT 0 COMMENT '0未删,1已经删除 ' ,
`tagid_int`  int(11) NOT NULL DEFAULT 0 ,
`sourceId_int`  int(11) NOT NULL DEFAULT 0 ,
`biztype_int`  int(11) NOT NULL DEFAULT 1 ,
`eqid_int`  int(11) NULL DEFAULT NULL ,
`eqcode`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`datacount_int`  int(11) NOT NULL DEFAULT 0 ,
`musictype_int`  int(11) NOT NULL DEFAULT 3 ,
`usecount_int`  int(11) NOT NULL DEFAULT 0 ,
`fromsceneid_bigint`  bigint(20) NOT NULL DEFAULT 0 ,
`publishTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`updateTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`shenhe`  tinyint(1) UNSIGNED NULL DEFAULT 1 ,
`rank`  bigint(20) UNSIGNED NULL DEFAULT 0 ,
`isadvanceduser`  tinyint(1) UNSIGNED NULL DEFAULT 0 ,
`hideeqad`  int(8) UNSIGNED NULL DEFAULT 0 ,
`lastpageid`  bigint(20) UNSIGNED NULL DEFAULT NULL ,
`is_tpl`  tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是模板' ,
`is_public`  tinyint(1) UNSIGNED NULL DEFAULT 1 ,
`is_payxd`  tinyint(1) UNSIGNED NULL DEFAULT 0 ,
`property`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`sceneid_bigint`),
UNIQUE INDEX `scenecode` (`scenecode_varchar`) USING BTREE ,
INDEX `userid` (`userid_int`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
CREATE TABLE `wp_scenedata` (
`dataid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`sceneid_bigint`  bigint(20) NOT NULL DEFAULT 0 ,
`pageid_bigint`  bigint(20) NOT NULL DEFAULT 0 ,
`elementid_int`  bigint(20) NULL DEFAULT 0 ,
`elementtitle_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`elementtype_int`  int(11) NOT NULL DEFAULT 5 ,
`userid_int`  int(11) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`dataid_bigint`),
INDEX `sceneid` (`sceneid_bigint`, `userid_int`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
CREATE TABLE `wp_scenedatadetail` (
`detailid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`sceneid_bigint`  bigint(20) NOT NULL DEFAULT 0 ,
`pageid_bigint`  bigint(20) NOT NULL DEFAULT 0 ,
`createtime_time`  datetime NULL DEFAULT NULL ,
`ip_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content_varchar`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`is_import`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`userid`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`detailid_bigint`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
CREATE TABLE `wp_scenedatasys` (
`dataid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`sceneid_bigint`  bigint(20) NOT NULL DEFAULT 0 ,
`pageid_bigint`  bigint(20) NOT NULL DEFAULT 0 ,
`elementid_int`  int(11) NULL DEFAULT 0 ,
`elementtitle_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`elementtype_int`  int(11) NOT NULL DEFAULT 5 ,
`userid_int`  int(11) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`dataid_bigint`),
INDEX `sceneid` (`sceneid_bigint`, `userid_int`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
CREATE TABLE `wp_scenepage` (
`pageid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`sceneid_bigint`  bigint(20) NOT NULL ,
`scenecode_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`pagecurrentnum_int`  int(11) NOT NULL DEFAULT 1 COMMENT '当前页数' ,
`createtime_time`  datetime NULL DEFAULT NULL ,
`content_text`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`pagename_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`userid_int`  int(11) NOT NULL ,
`properties_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`myTypl_id`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`pageid_bigint`),
INDEX `sceneid` (`scenecode_varchar`) USING BTREE ,
INDEX `scenid` (`sceneid_bigint`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
CREATE TABLE `wp_scenepagesys` (
`pageid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`sceneid_bigint`  bigint(20) NOT NULL ,
`scenecode_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`pagecurrentnum_int`  int(11) NOT NULL DEFAULT 1 COMMENT '当前页数' ,
`createtime_time`  datetime NULL DEFAULT NULL ,
`content_text`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`pagename_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`userid_int`  int(11) NOT NULL ,
`biztype_int`  int(11) NULL DEFAULT NULL ,
`tagid_int`  int(11) NULL DEFAULT NULL ,
`thumbsrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eqsrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eqid_int`  int(11) NULL DEFAULT NULL ,
`usecount_int`  int(11) NOT NULL DEFAULT 0 ,
`tagids_int`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签ids' ,
PRIMARY KEY (`pageid_bigint`),
INDEX `sceneid` (`scenecode_varchar`) USING BTREE ,
INDEX `scenid` (`sceneid_bigint`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
ALTER TABLE `wp_seckill_order` ROW_FORMAT=Dynamic;
CREATE TABLE `wp_sys` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`web_title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`web_description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`web_keywords`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`is_open_reg`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`qi_ad_xds`  int(5) UNSIGNED NOT NULL DEFAULT 90 ,
`is_user_anli_shenghe`  tinyint(1) UNSIGNED NULL DEFAULT 0 ,
`get_xd_link`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`web_logo`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_site`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_copyright`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_qq`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_mail`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_address`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_appid`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_appsecret`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_ipc`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`web_muban_status`  tinyint(1) NOT NULL DEFAULT 1 ,
`xiudian_url`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
CREATE TABLE `wp_tag` (
`tagid_int`  int(11) NOT NULL AUTO_INCREMENT ,
`userid_int`  int(11) NOT NULL DEFAULT 0 ,
`name_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type_int`  int(11) NULL DEFAULT NULL COMMENT '背景还是图片0背景,1图片,2音乐,88样例,99用户' ,
`biztype_int`  int(11) NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`sort`  int(11) UNSIGNED NULL DEFAULT 99 ,
PRIMARY KEY (`tagid_int`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;

CREATE TABLE `wp_upfile` (
`fileid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`userid_int`  int(11) NOT NULL ,
`filetype_int`  int(11) NOT NULL DEFAULT 0 COMMENT '0背景,2音乐,1图片' ,
`filesrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`sizekb_int`  decimal(18,2) NULL DEFAULT 0.00 ,
`filethumbsrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`biztype_int`  int(11) NULL DEFAULT 0 ,
`ext_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`filename_varchar`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eqsrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tagid_int`  int(11) NULL DEFAULT 0 ,
`delete_int`  int(11) NOT NULL DEFAULT 0 COMMENT '0正常,1删除' ,
PRIMARY KEY (`fileid_bigint`),
INDEX `userid` (`userid_int`, `filetype_int`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
CREATE TABLE `wp_upfilesys` (
`fileid_bigint`  bigint(20) NOT NULL AUTO_INCREMENT ,
`userid_int`  int(11) NOT NULL ,
`filetype_int`  int(11) NOT NULL DEFAULT 0 COMMENT '0背景,2音乐,1图片' ,
`filesrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`sizekb_int`  decimal(18,2) NULL DEFAULT 0.00 ,
`filethumbsrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`biztype_int`  int(11) NULL DEFAULT 0 ,
`ext_varchar`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`filename_varchar`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eqsrc_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tagid_int`  int(11) NULL DEFAULT 0 ,
`eqsrcthumb_varchar`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`fileid_bigint`),
INDEX `userid` (`userid_int`, `filetype_int`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
