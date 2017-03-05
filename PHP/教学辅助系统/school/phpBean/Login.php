<?php
require_once "../database/common.php";
//接收用户名、密码、用户类型
$userName=trim($_POST['userName']);//用户名
$passWord=trim($_POST['passWord']);//密码
$userType=trim($_POST['userType']);//用户类型

switch ($userType){
	case "1":
		$student =checkStudent($userName, $passWord);		
		if($student[0][0] == $userName){
			if($student[0][2] == $passWord){
				//合法
				session_start();
				$_SESSION['snumber'] = $student[0][0];
				$url="location:../student/mainPage/select.php?snumber=".$student[0][0]."&&class_id=".$student[0][5];
				header($url);
			}
			else{
				//非法
				header("location:../index.php?errno=2");
			}
		} else {
			//非法
			header("location:../index.php?errno=1");
		}
		break;
		
	case "2":
		$teacher = checkTeacher($userName, $passWord);	
		if($teacher[0][0] == $userName){
			if($teacher[0][2] == $passWord){
				//合法
				session_start();
				$_SESSION['tnumber'] = $teacher[0][0];
				$_SESSION['t_idf'] = "老师";
				$url="location:../teacher/mainPage/select.php?tnumber=".$teacher[0][0]."&&dept_id=".$teacher[0][4];
				header($url);
			}
			else{
				//非法
				header("location:../index.php?errno=2");
			}
		} else {
			//非法
			header("location:../index.php?errno=1");
		}
		break;
		 
	case "3":
		$admin =checkAdmin($userName, $passWord);
		if($admin[0][0] == $userName){
			if($admin[0][2] == $passWord){
				//合法
				session_start();
				$_SESSION['anumber'] = $admin[0][0];
				$_SESSION['aname'] = $admin[0][1];
				$url="location:../admin/main.php?anumber=".$admin[0][0];
				header($url);
			}
			else{
				//非法
				header("location:../index.php?errno=2");
			}
		} else {
			//非法
			header("location:../index.php?errno=1");
		}
		break;		
}
?>