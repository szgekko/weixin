DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reservation' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reservation' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reservation`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reservation_number' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reservation_number' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reservation_number`;


