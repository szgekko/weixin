DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='we_media' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='we_media' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_we_media`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='we_media_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='we_media_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_we_media_category`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='we_media_digg' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='we_media_digg' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_we_media_digg`;


