DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='yaotv' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='yaotv' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_yaotv`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='yaotv_activities' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='yaotv_activities' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_yaotv_activities`;


