<?php
require_once "../database/config.inc.php";
		
//学生用户登陆
 function checkStudent($userName,$passWord){ 
 	       db_connect();
			$sql = "select * from student where snumber='$userName'";
			$data=db_query($sql);
			db_close();
			return $data; 
 }			
//教师用户登陆
function checkTeacher($userName,$passWord){
			$sql = "select * from teacher where tnumber='$userName'";	
			db_connect();
			$data=db_query($sql);	
			db_close();
			return $data; 
}		 				
//管理员用户登陆
 function checkAdmin($userName,$passWord){
			$sql = "select * from admin where anumber='$userName'";	
			db_connect();
			$data=db_query($sql);	
			db_close();
			return $data; 
 }
?>