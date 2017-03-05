<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
session_start();
if(!isset($_SESSION['tnumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();
$tnumber = $_GET['tnumber'];//教师编号
$dept_id= $_GET['dept_id'];//用户所在系别编号
$inf="select tname from teacher where tnumber='$tnumber'";
$infs=db_query($inf);
$username=$infs[0][0];//教师姓名
$sql = "select distinct c_id, c_name from course where dept_id='$dept_id' and who_teach='$tnumber' and c_sid='1'";
$data = db_query($sql);
	$smarty->assign("name",$username);
	$smarty->assign("tnumber",$tnumber);
	$smarty->assign("data",$data);
	$smarty->display("templates/select.tpl");

db_close();
?>