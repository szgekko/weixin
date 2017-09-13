DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='manager' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='manager' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_manager`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='manager_menu' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='manager_menu' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_manager_menu`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='keyword' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='keyword' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_keyword`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='qr_code' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='qr_code' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_qr_code`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='public' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='public' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_public`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='public_group' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='public_group' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_public_group`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='public_link' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='public_link' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_public_link`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='import' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='import' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_import`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='addon_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='addon_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_addon_category`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='auto_reply' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='auto_reply' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_auto_reply`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='common_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='common_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_common_category`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='common_category_group' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='common_category_group' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_common_category_group`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='credit_config' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='credit_config' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_credit_config`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='credit_data' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='credit_data' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_credit_data`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='material_image' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='material_image' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_material_image`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='material_news' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='material_news' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_material_news`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='message' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='message' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_message`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='visit_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='visit_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_visit_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='auth_group' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='auth_group' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_auth_group`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='analysis' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='analysis' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_analysis`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='article_style' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='article_style' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_article_style`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='article_style_group' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='article_style_group' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_article_style_group`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='ask' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='ask' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_ask`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='ask_answer' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='ask_answer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_ask_answer`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='ask_question' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='ask_question' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_ask_question`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='business_card' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='business_card' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_business_card`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='business_card_collect' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='business_card_collect' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_business_card_collect`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_vouchers' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_vouchers' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_vouchers`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='custom_menu' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='custom_menu' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_custom_menu`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='custom_reply_mult' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='custom_reply_mult' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_custom_reply_mult`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='custom_reply_news' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='custom_reply_news' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_custom_reply_news`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='custom_reply_text' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='custom_reply_text' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_custom_reply_text`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='draw_follow_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='draw_follow_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_draw_follow_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='forms' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='forms' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_forms`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='forms_attribute' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='forms_attribute' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_forms_attribute`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='forms_value' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='forms_value' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_forms_value`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='guess' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='guess' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_guess`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='guess_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='guess_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_guess_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='guess_option' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='guess_option' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_guess_option`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='invite' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='invite' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_invite`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='invite_user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='invite_user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_invite_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lottery_prize_list' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lottery_prize_list' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lottery_prize_list`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lucky_follow' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lucky_follow' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lucky_follow`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_activities' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_activities' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_activities`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_activities_vote' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_activities_vote' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_activities_vote`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_coupon' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_coupon' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_coupon`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_coupon_receive' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_coupon_receive' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_coupon_receive`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_coupon_sn' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_coupon_sn' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_coupon_sn`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_vote' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_vote' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_vote`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_vote_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_vote_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_vote_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='payment_order' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='payment_order' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_payment_order`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='payment_set' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='payment_set' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_payment_set`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='prize' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='prize' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_prize`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='prize_address' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='prize_address' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_prize_address`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='real_prize' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='real_prize' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_real_prize`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='redbag' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='redbag' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_redbag`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='redbag_follow' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='redbag_follow' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_redbag_follow`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reservation' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reservation' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reservation`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reservation_number' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reservation_number' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reservation_number`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='scratch' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='scratch' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_scratch`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_address' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_address' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_address`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_cart' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_cart' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_cart`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_collect' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_collect' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_collect`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_goods' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_goods' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_goods`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_goods_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_goods_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_goods_category`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_goods_score' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_goods_score' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_goods_score`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_order' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_order' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_order`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_order_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_order_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_order_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_slideshow' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_slideshow' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_slideshow`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='smalltools' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='smalltools' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_smalltools`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sn_code' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sn_code' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sn_code`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sport_award' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sport_award' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sport_award`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sports' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sports' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sports`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sports_drum' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sports_drum' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sports_drum`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sports_support' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sports_support' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sports_support`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sports_team' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sports_team' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sports_team`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='store' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='store' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_store`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sucai' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sucai' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sucai`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sucai_template' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sucai_template' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sucai_template`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='survey' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='survey' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_survey`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='survey_answer' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='survey_answer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_survey_answer`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='survey_question' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='survey_question' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_survey_question`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='system_notice' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='system_notice' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_system_notice`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='update_version' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='update_version' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_update_version`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='vote' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='vote' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_vote`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='vote_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='vote_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_vote_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='weisite_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='weisite_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_weisite_category`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='weisite_cms' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='weisite_cms' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_weisite_cms`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='weisite_footer' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='weisite_footer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_weisite_footer`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='weisite_slideshow' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='weisite_slideshow' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_weisite_slideshow`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='weixin_message' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='weixin_message' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_weixin_message`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='wish_card' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='wish_card' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_wish_card`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='wish_card_content' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='wish_card_content' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_wish_card_content`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='wish_card_content_cate' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='wish_card_content_cate' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_wish_card_content_cate`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='xydzp' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='xydzp' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_xydzp`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='xydzp_jplist' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='xydzp_jplist' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_xydzp_jplist`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='xydzp_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='xydzp_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_xydzp_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='xydzp_option' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='xydzp_option' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_xydzp_option`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='xydzp_userlog' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='xydzp_userlog' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_xydzp_userlog`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='yaotv' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='yaotv' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_yaotv`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='yaotv_activities' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='yaotv_activities' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_yaotv_activities`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_behavior' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_behavior' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_behavior`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_group' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_group' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_group`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_keyword' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_keyword' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_keyword`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_logs' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_logs' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_logs`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_wechat_enddate' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_wechat_enddate' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_wechat_enddate`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_wechat_grouplist' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_wechat_grouplist' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_wechat_grouplist`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='youaskservice_wxlogs' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='youaskservice_wxlogs' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_youaskservice_wxlogs`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lzwg_vote_option' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lzwg_vote_option' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lzwg_vote_option`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='vote_option' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='vote_option' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_vote_option`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_virtual' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_virtual' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_virtual`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='we_media' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='we_media' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_we_media`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='we_media_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='we_media_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_we_media_category`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='we_media_digg' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='we_media_digg' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_we_media_digg`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='business_card_column' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='business_card_column' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_business_card_column`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='comment' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='comment' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_comment`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_goods_downshelf_user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_goods_downshelf_user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_goods_downshelf_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_membership' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_membership' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_membership`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_spec' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_spec' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_spec`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_spec_option' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_spec_option' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_spec_option`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_distribution_profit' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_distribution_profit' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_distribution_profit`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_attribute' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_attribute' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_attribute`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_value' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_value' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_value`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_page' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_page' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_page`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_goods_sku_data' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_goods_sku_data' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_goods_sku_data`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_goods_sku_config' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_goods_sku_config' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_goods_sku_config`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_cashout_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_cashout_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_cashout_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_coupon' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_coupon' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_coupon`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_cashout_account' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_cashout_account' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_cashout_account`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_reward' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_reward' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_reward`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_reward_condition' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_reward_condition' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_reward_condition`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_distribution_user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_distribution_user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_distribution_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='material_text' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='material_text' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_material_text`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='material_file' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='material_file' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_material_file`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_statistics_follow' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_statistics_follow' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_statistics_follow`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='servicer' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='servicer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_servicer`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='coupon' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='coupon' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_coupon`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='coupon_shop' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='coupon_shop' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_coupon_shop`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='coupon_shop_link' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='coupon_shop_link' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_coupon_shop_link`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='help_open' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='help_open' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_help_open`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='help_open_user' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='help_open_user' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_help_open_user`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_vote' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_vote' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_vote`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_vote_option' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_vote_option' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_vote_option`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_vote_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_vote_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_vote_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_privilege' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_privilege' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_privilege`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_level' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_level' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_level`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_coupons' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_coupons' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_coupons`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_notice' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_notice' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_notice`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_member' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_member' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_member`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='recharge_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='recharge_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_recharge_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='buy_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='buy_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_buy_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='update_score_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='update_score_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_update_score_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='SignIn_Log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='SignIn_Log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_signin_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='shop_card_member' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='shop_card_member' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_shop_card_member`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_marketing' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_marketing' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_marketing`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_reward' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_reward' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_reward`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_score' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_score' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_score`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_recharge' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_recharge' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_recharge`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_recharge_condition' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_recharge_condition' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_recharge_condition`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='card_custom' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='card_custom' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_card_custom`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='score_exchange_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='score_exchange_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_score_exchange_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='share_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='share_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_share_log`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lottery_games' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lottery_games' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lottery_games`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='lottery_games_award_link' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='lottery_games_award_link' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_lottery_games_award_link`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reserve' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reserve' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reserve`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reserve_attribute' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reserve_attribute' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reserve_attribute`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reserve_value' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reserve_value' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reserve_value`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='reserve_option' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='reserve_option' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_reserve_option`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='help_open_prize' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='help_open_prize' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_help_open_prize`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='wuguai' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='wuguai' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_wuguai`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='wuguai_group' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='wuguai_group' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_wuguai_group`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='seckill' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='seckill' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_seckill`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='seckill_goods' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='seckill_goods' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_seckill_goods`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='seckill_order' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='seckill_order' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_seckill_order`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='extensions' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='extensions' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_extensions`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='custom_sendall' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='custom_sendall' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_custom_sendall`;


DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='sms' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='sms' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_sms`;


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


