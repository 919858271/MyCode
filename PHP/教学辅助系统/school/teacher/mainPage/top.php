<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
session_start();
if(!isset($_SESSION['tnumber'])){//判断是否非法访问
	header("location:../../index.php");
}
db_connect();
$smarty = new Smarty;
$c_id = $_GET['course_id'];//课程编号
$tnumber = $_GET['tnumber'];//教师编号
$sql ="select tname,tdept from teacher where tnumber='$tnumber'";
$data=db_query($sql);
$username = $data[0][0];//教师姓名
$tdept=$data[0][1];//教师所在的系
$sqlt="select c_name from course where c_id='$c_id'";
$cn=db_query($sqlt);
$c_name = $cn[0][0];//课程名称

$smarty->assign("c_id",$c_id );
$smarty->assign("tdept",$tdept );
$smarty->assign("tnumber",$tnumber);
$smarty->assign("c_name",$c_name );
$smarty->assign("name",$username);
$smarty->display("templates/top.tpl");
db_close();
?>