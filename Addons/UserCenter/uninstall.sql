DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='user_tag' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='user_tag' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_user_tag`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='user_tag_link' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='user_tag_link' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_user_tag_link`;


