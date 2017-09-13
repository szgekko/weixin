<?php
return array (
		'need_distribution' => array (
				'title' => '是否开启分销制度:',
				'type' => 'radio',
    		    'options' => array (
    		        '1' => '是',
    		        '0' => '否'
    		    ),
				'value' => '0',
		),
		/* 'need_sem' => array (
				'title' => '开启全员微营销:',
				'type' => 'radio',
				'options' => array (
						'1' => '是',
						'0' => '否'
				),
				'value' => '1',
		), */
    'is_fixed_shopper' => array (
    		'title' => '分销商与购买用户是否固定关系:',
    		'type' => 'hidden',
    		'options' => array (
    				'1' => '是',
    				'0' => '否'
    		),
    		'value' => '1',
    ),
    
        'level' => array (
            'title' => '分销层次:',
            'type' => 'radio',
            'options' => array (
                '1' => '一级',
                '2' => '二级',
                '3' => '三级'
            ),
            'value' => '1',
        ),
    'level_name_1' => array (
    		'title' => '一级分销商名:',
    		'type' => 'text',
    		'value' => '代理商',
    		'tip' => '仅用于显示，为空则显示为 一级分销商',
    ),
    'level_name_2' => array (
    		'title' => '二级分销商名:',
    		'type' => 'text',
    		'value' => '门店',
    		'tip' => '仅用于显示，为空则显示为 二级分销商',
    ),
    'level_name_3' => array (
    		'title' => '三级分销商名:',
    		'type' => 'text',
    		'value' => '员工',
    		'tip' => '仅用于显示，为空则显示为 三级分销商',
    ),

//     'flevel' => array (
//     		'title' => '第一种分佣比例类型:',
//     		'type' => 'hidden',
//     		'value' => '非金',
//     		'tip' => '',
//     ),
//     'slevel' => array (
//     		'title' => '第二种分佣比例类型:',
//     		'type' => 'hidden',
//     		'value' => '全金',
//     		'tip' => '',
//     ),
//     'tlevel' => array (
//     		'title' => '第三种分佣比例类型:',
//     		'type' => 'hidden',
//     		'value' => '特价',
//     		'tip' => '',
//     ),
    
//     'flevel1' => array (
//             'title' => '非金一级分佣比例:',
//             'type' => 'hidden',
//             'value' => '3%',
//             'tip' => '非金一级分销用户可获得佣金百分比',
//      ),
//     'flevel2' => array (
//     		'title' => '非金二级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '2%',
//     		'tip' => '非金二级分销用户可获得佣金百分比',
//     ),
//     'flevel3' => array (
//     		'title' => '非金三级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '1%',
//     		'tip' => '非金三级分销用户可获得佣金百分比',
//     ),
//     'slevel1' => array (
//     		'title' => '全金一级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '3%',
//     		'tip' => '全金一级分销用户可获得佣金百分比',
//     ),
//     'slevel2' => array (
//     		'title' => '全金二级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '2%',
//     		'tip' => '全金三级分销用户可获得佣金百分比',
//     ),
//     'slevel3' => array (
//     		'title' => '全金三级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '1%',
//     		'tip' => '全金三级分销用户可获得佣金百分比',
//     ),
//     'tlevel1' => array (
//     		'title' => '特价一级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '3%',
//     		'tip' => '特价一级分销用户可获得佣金百分比',
//     ),
//     'tlevel2' => array (
//     		'title' => '特价二级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '2%',
//     		'tip' => '特价二级分销用户可获得佣金百分比',
//     ),
//     'tlevel3' => array (
//     		'title' => '特价三级分佣比例:',
//     		'type' => 'hidden',
//     		'value' => '1%',
//     		'tip' => '特价三级分销用户可获得佣金百分比',
//     ),
        'level1' => array (
            'title' => '一级分佣比例:',
            'type' => 'text',
            'value' => '5%',
            'tip' => '一级分销用户可获得佣金百分比',
        ),
        'level2' => array (
            'title' => '二级分佣比例:',
            'type' => 'text',
            'value' => '1%',
            'tip' => '二级分销用户可获得佣金百分比',
        ),
        'level3' => array (
            'title' => '三级分佣比例:',
            'type' => 'text',
            'value' => '0.5%',
            'tip' => '三级分销用户可获得佣金百分比',
        ),
		'is_audit' => array (
				'title' => '分销用户是否审核:',
				'type' => 'hidden',
				'options' => array (
						'1' => '是',
						'0' => '否'
				),
				'value' => '1',
		),
		
        'max_money'=>array(
            'title'=>'设置最高分佣金额（元）：',
            'type'=>'text',
            'value'=>0,
            
        ),
//      'set_turn_fans_gift'=>array(
//             'title'=>'转发增粉奖品设置：',
//             'type'=>'radio',
//             'options'=>array(
//                 '0'=>'关闭',
//                 '1'=>'开启'
//             ),
//             'value'=>0,
//             'tip'=>'一级分销才有增粉设置'
//         ),
//     'add_new_fans'=>array(
//             'title'=>'累计增粉人数：',
//             'type'=>'text',
//             'value'=>0,
//         ),
//     'gift_money'=>array(
//         'title'=>'奖励金额：',
//         'type'=>'text',
//         'value'=>0,
//     ),
//     'gift_score'=>array(
//         'title'=>'奖励积分：',
//         'type'=>'text',
//         'value'=>0,
//     ),
//     'gift_shop_coupon'=>array(
//         'title'=>'奖励代金券：',
//         'type'=>'select',
//         'options'=>array(
//             '0'=>'请选择代金券'
//         ),
//         'value'=>0,
//     ),
//     'gift_coupon'=>array(
//         'title'=>'奖励优惠券：',
//         'type'=>'select',
//         'options'=>array(
//             '0'=>'请选择优惠券'
//         ),
//         'value'=>0,
//     ),
    
//         'set_require'=>array(
//             'title'=>'设置分销授权条件：',
//             'type'=>'radio',
//             'options'=>array(
//                 '0'=>'手工授权',
//                 '1'=>'满足条件自动授权'
//             ),
//             'value'=>0,
//         ),
//         'add_conditon'=>array(
//             'title'=>'选择条件',
//             'type'=>'checkbox',
//             'options'=>array(
//                 'count'=>'购买商品数量',
//                 'money'=>'消费金额',
//                 'score'=>'积分数'
//             ),
//             'value'=>"count,money",
//         ),
        
//         'is_all_goods' => array (
//             'title' => '指定活动商品 ',
//             'type' => 'radio',
//             'value' => '1',
//             'options'=>array(
//                '0'=>'全部商品参与',
//                '1'=>'指定商品参与',  
//             ),
//         ),
//         'buy_num' => array (
//             'title' => '购买数量:',
//             'type' => 'hidden',
//             'value' => '',
//             'tip' => '填写达到分销条件的商品数量',
//         ),
//         'count_value' => array (
//             'title' => '购买商品数量:',
//             'type' => 'text',
//             'value' => '100',
//             'tip' => '填写达到分销条件的购买总商品数量',
//         ),
//         'money_value' => array (
//             'title' => '消费金额:',
//             'type' => 'text',
//             'value' => '200',
//             'tip' => '填写达到分销条件的消费金额',
//         ), 
//         'score_value' => array (
//                 'title' => '用户积分数:',
//                 'type' => 'text',
//                 'value' => '1000',
//                 'tip' => '填写达到分销条件的用户积分数',
//             ),
        'lock_num_time' => array (
            'title' => '商品库存锁定时间:',
            'type' => 'text',
            'value' => '3600',
            'tip' => '用户将商品加入购物车或下订单 未支付时，将商品数量锁定的时间（单位：秒）',
        ),
//         'need_membership' => array (
//             'title' => '是否开启会员制:',
//             'type' => 'radio',
//             'options' => array (
//                 '1' => '是',
//                 '0' => '否'
//             ),
//             'value' => '1',
//         )
		'is_mail' => array (
				'title' => '是否包邮:',
				'type' => 'radio',
				'options'=>array(
						'1'=>'是',
						'0'=>'否'
				),
				'value'=>1,
				'tip' => '若选择否， 请填写邮费',
		),
		'mail_money' => array (
				'title' => '邮费:',
				'type' => 'text',
				'value' => '10',
				'tip' => '默认为10 （单位：元）',
		),
);
					