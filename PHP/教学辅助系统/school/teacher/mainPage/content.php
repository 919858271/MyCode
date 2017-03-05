<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
require_once "../../phpBean/ActionService.php";
session_start();
if(!isset($_SESSION['tnumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();
$course_id=$_GET['course_id'];//课程编号

$sql = "select count(*) from experiment where course_id='$course_id'";
$data = db_query($sql);
	if(!empty($data)){
		if($data[0][0]=="0"){
			$mes = "<span style='color: #FF0000'><strong>当前课程未安排实验内容，请尽快安排，便于学生进行实验！！！</strong></span>";
			$smarty->assign("mes",$mes);
			$smarty->display("templates/content.tpl");
		}else{
			$mes = "当前课程已安排实验内容，点击  教学实验 查看学生实验情况。";
			$smarty->assign("mes",$mes);
			$smarty->display("templates/content.tpl");
		}
	}else{
		
	}
 db_close();
?>