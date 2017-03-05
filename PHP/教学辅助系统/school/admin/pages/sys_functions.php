<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
require_once "../../phpBean/ActionService.php";
session_start();
if(!isset($_SESSION['anumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();
$action = $_GET['action'];
switch($action){
	case "smang" ://学生用户管理
			$idf = $_GET['idf'];
			if($idf=="ser"){//查询菜单
				$sql = "select distinct sclass from student ";
				$classes=db_query($sql);
					if(!empty($classes)){
						$smarty->assign("acte","smang");
						$smarty->assign("data",null);
						$smarty->assign("class",null);
						$smarty->assign("class_id",null);
						$smarty->assign("inf","学生用户管理");
						$smarty->assign("classes",$classes);
						$smarty->display("templates/sys_function.tpl");
					}
			}
			if($idf=="act"){//提交查询
				$s_number=trim($_POST['number']);
				$s_class=trim($_POST['dept']);
				if($s_number==null||$s_number==""){//班级查询
					$sql1 = "select distinct sclass from student ";
				    $classes=db_query($sql1);
					$sql2 = "select * from student where sclass='$s_class'";
					$data=db_query($sql2);
					if(!empty($data)){	
						$smarty->assign("acte","smang");
						$smarty->assign("inf","学生用户管理");
						$smarty->assign("class",$s_class);	
						$smarty->assign("class_id",$data[0][5]);							
						$smarty->assign("data",$data);
						$smarty->assign("classes",$classes);
						$smarty->display("templates/sys_function.tpl");
					}
				}
				else{//学号查询
					$sql = "select * from student where snumber='$s_number'";
					$data=db_query($sql);
					$sql1 = "select distinct sclass from student ";
				    $classes=db_query($sql1);
					if(!empty($data)){
						$smarty->assign("acte","smang");
						$smarty->assign("class",$data[0][1]);	
						$smarty->assign("class_id",null);
						$smarty->assign("data",$data);
						$smarty->assign("inf","学生用户管理");
						$smarty->assign("classes",$classes);
						$smarty->display("templates/sys_function.tpl");
					}else{
						$smarty->assign("acte","smang");
						$smarty->assign("class",null);	
						$smarty->assign("class_id",null);
						$smarty->assign("data",null);
						$smarty->assign("inf","学生用户管理");
						$smarty->assign("classes",$classes);
						$smarty->display("templates/sys_function.tpl");
					}
				}				
			}
			if($idf=="update"){//重置一个学生登陆口令
				$snumber= $_GET['id'];
				$sql = "update student set password='123456' where snumber='$snumber'";
				$isUp =  db_update($sql);
				if($isUp){
					echo  "<script>												
							alert('重置成功');
							window.location.href='sys_functions.php?action=smang&&idf=ser';
							</script>";							
							;
				}else{
					echo  "<script>												
							alert('重置失败');
							window.location.href='sys_functions.php?action=smang&&idf=ser';
							</script>";							
							;
				}
			}
			if($idf=="resetall"){//重置一个班级学生登陆口令
				$class_id= $_GET['id'];
				$sql = "update student set password='123456' where class_id='$class_id'";
				$isUp =  db_update($sql);
				if($isUp){
					echo  "<script>												
							alert('重置成功');
							window.location.href='sys_functions.php?action=smang&&idf=ser';
							</script>";							
							;
				}else{
					echo  "<script>												
							alert('重置失败');
							window.location.href='sys_functions.php?action=smang&&idf=ser';
							</script>";							
							;
				}
			}
	break;
	case "tmang" :
			$idf = $_GET['idf'];
			if($idf=="ser"){//查询菜单
				$sql = "select distinct dept_name from teacher ";
				$dept=db_query($sql);
					if(!empty($dept)){
						$smarty->assign("acte","tmang");
						$smarty->assign("data",null);
						$smarty->assign("class",null);
						$smarty->assign("class_id",null);
						$smarty->assign("inf","教师用户管理");
						$smarty->assign("classes",$dept);
						$smarty->display("templates/sys_function.tpl");
					
					}
			}
			if($idf=="act"){
				$t_number=trim($_POST['number']);
				$t_dept=trim($_POST['dept']);
				if($t_number==null||$t_number==""){//系别查询
					$sql1 = "select distinct dept_name from teacher ";//查询系别
				    $dept=db_query($sql1);
					$sql2 = "select * from teacher where dept_name='$t_dept'";//查询该系别所有信息
					$data=db_query($sql2);
					if(!empty($data)){	
						$smarty->assign("acte","tmang");
						$smarty->assign("class",$t_dept);
						$smarty->assign("inf","教师用户管理");
						$smarty->assign("class_id",$data[0][4]);							
						$smarty->assign("data",$data);
						$smarty->assign("classes",$dept);
						$smarty->display("templates/sys_function.tpl");
					}
				}
				else{//教师编号查询
					$sql = "select * from teacher where tnumber='$t_number'";
					$data=db_query($sql);
					$sql1 = "select distinct dept_name from teacher ";//查询系别
				    $dept=db_query($sql1);
					if(!empty($data)){
						$smarty->assign("acte","tmang");
						$smarty->assign("class",$data[0][1]);	
						$smarty->assign("class_id",null);
						$smarty->assign("data",$data);
						$smarty->assign("classes",$dept);
						$smarty->assign("inf","教师用户管理");
						$smarty->display("templates/sys_function.tpl");
					}else{
						$smarty->assign("acte","tmang");
						$smarty->assign("class",null);
						$smarty->assign("class_id",null);						
						$smarty->assign("data",null);
						$smarty->assign("classes",$dept);
						$smarty->assign("inf","教师用户管理");
						$smarty->display("templates/sys_function.tpl");
					}
				}				
			}
			if($idf=="update"){//重置一教师登陆口令
				$tnumber= $_GET['id'];
				$sql = "update teacher set password='123456' where tnumber='$tnumber'";
				$isUp =  db_update($sql);
				if($isUp){
					echo  "<script>												
							alert('重置成功');
							window.location.href='sys_functions.php?action=tmang&&idf=ser';
							</script>";							
							;
				}else{
					echo  "<script>												
							alert('重置失败');
							window.location.href='sys_functions.php?action=tmang&&idf=ser';
							</script>";							
							;
				}
			}
			if($idf=="resetall"){//重置一个系别教师的登陆口令
				$dept_id= $_GET['id'];
				$sql = "update teacher set password='123456' where tdept='$dept_id'";
				$isUp =  db_update($sql);
				if($isUp){
					echo  "<script>												
							alert('重置成功');
							window.location.href='sys_functions.php?action=tmang&&idf=ser';
							</script>";							
							;
				}else{
					echo  "<script>												
							alert('重置失败');
							window.location.href='sys_functions.php?action=tmang&&idf=ser';
							</script>";							
							;
				}
			}		
	break;
}
db_close();
?>