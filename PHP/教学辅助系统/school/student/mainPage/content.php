<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../phpBean/ActionService.php";
require_once "../../database/config.inc.php";
session_start();
if(!isset($_SESSION['snumber'])){//判断是否非法访问
	header("location:../../index.php");
}
db_connect();
$smarty = new Smarty;
$course_id=$_GET['course_id'];//课程编号
$sql = "select count(*) from experiment where course_id='$course_id'";
$data = db_query($sql);
	if(!empty($data)){
		if($data[0][0]=="0"){
			$mes = "<span style='color: #FF0000'><strong>当前课程尚未安排实验内容！！！</strong></span>";
			$smarty->assign("mes",$mes);
			$smarty->display("templates/content.tpl");
		}else{
			$mes = "当前课程已安排实验内容，点击  教学实验 查看实验信息。";
			$smarty->assign("mes",$mes);
			$smarty->display("templates/content.tpl");
		}
	}else{
	}		
 db_close();
?>