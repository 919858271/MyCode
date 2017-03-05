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
$action = $_GET['action'];
switch($action){
	case "intr" :
		$course_id=$_GET['course_id'];//课程编号	
		$tnumber=$_GET['tnumber'];//教师编号
		$sqlt="select tname from teacher where tnumber='$tnumber'";
		$tn=db_query($sqlt);
		$tname=$tn[0][0];//教师姓名
		$sqltt="select c_name from course where c_id='$course_id'";
		$cn=db_query($sqltt);
		$cname=$cn[0][0];//课程名称
		$sql = "select distinct course_intr from course  where c_id='$course_id'";
		$intrs = db_query($sql);	
		if(!empty($intrs[0][0])){
			$data= explode('+',$intrs[0][0]);
			$smarty->assign("data",$data);
			$smarty->assign("course_id",$course_id);
			$smarty->assign("tnumber",$tnumber);			
			$smarty->assign("cname",$cname);
			$smarty->assign("tname",$tname);
			$smarty->display("templates/introduce.tpl");			
		}else{
			$smarty->assign("data",null);
			$smarty->assign("course_id",$course_id);
			$smarty->assign("tnumber",$tnumber);			
			$smarty->assign("cname",$cname);
			$smarty->assign("tname",$tname);
			$smarty->display("templates/introduce.tpl");	
		}
	break;
	case "update" :
		$course_id=$_GET['course_id'];//课程编号
		$tnumber=$_GET['tnumber'];//教师编号
		$course_name=trim($_POST['course_name']);//课程名称
		$teacher=trim($_POST['teacher']);//授课教师
		$where=trim($_POST['where']);//上课地点
		$start=trim($_POST['start']);//开课时间
		$intr=trim($_POST['intr']);//课程介绍
		$target=trim($_POST['targ']);//课程目标
		
		$inf=$course_name."+".$teacher."+".$where."+".$start."+".$intr."+".$target;
		$sql = "update course set course_intr='$inf' where c_id='$course_id'";
		$isAdd=db_update($sql);
		if($isAdd){
				echo  "<script>					
						window.location.href='introduce.php?action=intr&&course_id=".$course_id."&&tnumber=".$tnumber."';								
										alert('编辑成功！');								
										</script>"
												;				
																
		}else{
			echo  "<script>					
						window.location.href='introduce.php?action=intr&&course_id=".$course_id."&&tnumber=".$tnumber."';								
										alert('编辑失败！');								
										</script>"
												;
		}
	break;
}
db_close();
?>