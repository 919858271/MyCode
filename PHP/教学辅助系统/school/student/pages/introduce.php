<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
require_once "../../phpBean/ActionService.php";
session_start();
if(!isset($_SESSION['snumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();
$action = $_GET['action'];
switch($action){
	case "intr" :
		$course_id=$_GET['course_id'];//课程编号	
		$snumber=$_GET['snumber'];//学号
		$sql = "select distinct course_intr from course where c_id='$course_id'";		
		$intrs = db_query($sql);	
		if(!empty($intrs[0][0])){
			$data= explode('+',$intrs[0][0]);
			$smarty->assign("data",$data);
			$smarty->display("templates/introduce.tpl");			
		}else{
			$smarty->assign("data",null);
			$smarty->display("templates/introduce.tpl");	
		}
	break;
}
db_close();
?>