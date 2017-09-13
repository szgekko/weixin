DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='seckill' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='seckill' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_seckill`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='seckill_goods' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='seckill_goods' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_seckill_goods`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='seckill_order' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='seckill_order' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_seckill_order`;


