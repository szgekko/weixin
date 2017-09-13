<?php
$feed ['content'] = '123123[ciya][ciya][ciya]66666666[haha][liuhan]';
preg_match_all ( '/\[\w+\]/i', $feed ['content'], $matches );
$matches = array_unique ( $matches[0] );
print_r ( $matches );