DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_msgwall' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_msgwall' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_msgwall`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_sponsor' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_sponsor' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_sponsor`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_shake' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_shake' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_shake`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_shake_award' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_shake_award' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_shake_award`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_game_live_pick' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_game_live_pick' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_game_live_pick`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_live' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_live' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_live`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_monitor' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_monitor' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_monitor`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='upwall_user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='upwall_user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_upwall_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='msgwall_content' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='msgwall_content' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_msgwall_content`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='mini_live_pic' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='mini_live_pic' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_mini_live_pic`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shake_prize_user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shake_prize_user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shake_prize_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shake_prize_content' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shake_prize_content' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shake_prize_content`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shake_user_attend' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shake_user_attend' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shake_user_attend`;


