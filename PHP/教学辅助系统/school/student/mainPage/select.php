<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
session_start();
if(!isset($_SESSION['snumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();
$snumber = $_GET['snumber'];//学号
$class_id= $_GET['class_id'];//用户所在班级编号
$inf="select sname from student where snumber='$snumber'";
$infs=db_query($inf);
$username=$infs[0][0];//学生姓名
$sql = "select c_id, c_name from course where class_id='$class_id' and c_sid='1'";
$data = db_query($sql);
	$smarty->assign("name",$username);
	$smarty->assign("snumber",$snumber);
	$smarty->assign("data",$data);
	$smarty->display("templates/select.tpl");
db_close();
?>