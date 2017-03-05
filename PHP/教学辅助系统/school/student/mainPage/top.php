<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
$smarty = new Smarty;
session_start();
if(!isset($_SESSION['snumber'])){//判断是否非法访问
	header("location:../../index.php");
}

db_connect();
$c_id = $_GET['course_id'];//课程编号
$snumber = $_GET['snumber'];//学号

$sql ="select sname,class_id from student where snumber='$snumber'";
$data=db_query($sql);
$username = $data[0][0];//学生姓名
$class_id=$data[0][1];//班级编号

$sqlt="select c_name from course where c_id='$c_id'";
$cn=db_query($sqlt);
$c_name = $cn[0][0];//课程名称


$smarty->assign("course_id",$c_id );
$smarty->assign("c_name",$c_name );
$smarty->assign("snumber",$snumber );
$smarty->assign("clsss_id",$class_id );
$smarty->assign("name",$username);
$smarty->display("templates/top.tpl");
db_close();
?>