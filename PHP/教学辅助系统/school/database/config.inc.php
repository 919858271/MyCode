<?php
/////数据库的连接参数
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_HOST', 'localhost');
define('DB_NAME', 'school');
define('DB_PCONNECT',true);

/////页面的记录数目参数
define('PAGE_NUM_TEACHER',25);
define('PAGE_NUM_RECORD',25);

require_once('mysqlutil.php');
?>