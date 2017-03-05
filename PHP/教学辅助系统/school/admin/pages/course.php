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
	case "list" :
		$_SESSION['dept_id']= $_GET['id'];
		$dept_id = $_GET['id'];
		$pageNum = $_GET['pageNum'];//分页编号
		$pageSize=9;//分页大小
		$mark = mark($pageNum,$pageSize);//获取分页标示
		$sql1 = "select count(class_id) from classes where  dept_id='$dept_id'";//获取总数据量
		$pageSum=(int)db_count($sql1,$pageSize);//获取总页数
		if($pageSum==0){
			$pageSum=1;
		}
		$sty=sty2($pageNum,$pageSum);//分页链接样式
		$sql = "select * from classes where dept_id='$dept_id' limit $mark[0],$pageSize";
		$data=db_query($sql);
		if(!empty($data)){
			if($dept_id=="101"){
				$dept="数学系";
			}
			if($dept_id=="102"){
				$dept="物理系" ;
			}
			if($dept_id=="103"){
				$dept="化学系";
			}
			$smarty->assign("data",$data);
			$smarty->assign("dept",$dept);
			$smarty->assign("dept_id",$dept_id);
			$smarty->assign("class_id",$data[0][0]);			
			$smarty->assign("sty",$sty);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);				
			$smarty->display("templates/course.tpl");
		}else{
			if($dept_id=="101"){
				$dept="数学系";
			}
			if($dept_id=="102"){
				$dept="物理系" ;
			}
			if($dept_id=="103"){
				$dept="化学系";
			}
			$sty1=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");
			$smarty->assign("data",null);
			$smarty->assign("dept",$dept);
			$smarty->assign("dept_id",$dept_id);			
			$smarty->assign("sty",$sty1);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);				
			$smarty->display("templates/course.tpl");		
		}
	break;
	case "course_list" :
				$dept_id = $_GET['id'];
			    $class_id=$_GET['cid'];
				$pageNum = $_GET['pageNum'];//分页编号
				$pageSize=9;//分页大小
				$mark = mark($pageNum,$pageSize);//获取分页标示
				$sql1 = "select count(c_id) from course where  class_id='$class_id'";//获取总数据量
				$pageSum=(int)db_count($sql1,$pageSize);//获取总页数
				if($pageSum==0){
					$pageSum=1;
				}
				$sty=sty2($pageNum,$pageSum);//分页链接样式
				$sql = "select * from course where class_id='$class_id' limit $mark[0],$pageSize";
				$data=db_query($sql);
				$sql3= "select tname,tnumber from teacher where tdept='$dept_id'";
				$data1=db_query($sql3);
				if(!empty($data)){
					if($dept_id=="101"){
						$dept="数学系";
					}
					if($dept_id=="102"){
						$dept="物理系" ;
					}
					if($dept_id=="103"){
						$dept="化学系";
					}
					$smarty->assign("data",$data);
					$smarty->assign("data1",$data1);
					$smarty->assign("class",$data[0][3]);
					$smarty->assign("class_id", $class_id);
					$smarty->assign("dept",$dept);
					$smarty->assign("dept_id",$dept_id);			
					$smarty->assign("sty",$sty);
					$smarty->assign("left",$mark[1]);
					$smarty->assign("pageNum",$pageNum);
					$smarty->assign("last",$pageSum);				
					$smarty->display("templates/course_detial.tpl");
				}else{
					if($dept_id=="101"){
						$dept="数学系";
					}
					if($dept_id=="102"){
						$dept="物理系" ;
					}
					if($dept_id=="103"){
						$dept="化学系";
					}
					
					$sql2="select  class_name from classes where class_id='$class_id'";
					$data2=db_query($sql2);
					$sty1=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");
					$smarty->assign("data",null);
					$smarty->assign("data1",$data1);
					$smarty->assign("dept",$dept);
					$smarty->assign("class",$data2[0][0]);
					$smarty->assign("class_id", $class_id);
					$smarty->assign("dept_id",$dept_id);			
					$smarty->assign("sty",$sty1);
					$smarty->assign("left",$mark[1]);
					$smarty->assign("pageNum",$pageNum);
					$smarty->assign("last",$pageSum);				
					$smarty->display("templates/course_detial.tpl");	
			}
	 break;
	 case "add" :
				$dept_id=trim($_POST['dept_id']);//系别编号
				$class_name=trim($_POST['class_name']);//班级名称
				$class_id=trim($_POST['class_id']);//班级编号
				$c_number=trim($_POST['c_number']);//课程编号
				$c_name=trim($_POST['c_name']);//课程名称
				$teacher=trim($_POST['teacher']);//授课教师
				$t_inf= explode('+',$teacher);
				$term=trim($_POST['term']);//授课学期
				$state="../../tools/images/open.png";
				//添加课程信息
				$sql = "insert into course (c_id,c_name,which_term,class,who_teach,c_state,class_id,dept_id,teacher_name) values
						('$c_number','$c_name','$term','$class_name','$t_inf[0]','$state','$class_id','$dept_id','$t_inf[1]')"; 
				$isADD = db_update($sql);
				if($isADD){
					echo  "<script>					
							window.location.href='course.php?pageNum=1&&action=course_list&&id=".$dept_id."&&cid=".$class_id."';
							alert('添加成功');
							</script>";							
							;
				}else{
					echo  "<script>					
							window.location.href='course.php?pageNum=1&&action=course_list&&id=".$dept_id."&&cid=".$class_id."';
							alert('添加失败');
							</script>";							
							;
				}
				
				
	 break;
	 case "delete" :
			$idf = $_GET['id'];//课程编号在数据库中的标识符
			$dept_id = $_GET['dept_id'];//系别编号
			$class_id = $_GET['cid'];//系别编号
			$sql = "delete from course where id='$idf'";
			$isDelete =  db_update($sql);
			if($isDelete){
				echo  "<script>					
							window.location.href='course.php?pageNum=1&&action=course_list&&id=".$dept_id."&&cid=".$class_id."';
							alert('删除成功');
							</script>";							
							;
			}else{
				echo  "<script>					
							window.location.href='course.php?pageNum=1&&action=course_list&&id=".$dept_id."&&cid=".$class_id."';
							alert('删除失败');
							</script>";							
							;
							
			}
	 break;
	 case "close" :
		$dept_id = $_GET['id'];
		$id =  $_GET['course'];
		$idf =  $_GET['idf'];
		$class_id =  $_GET['class_id'];
		if($idf=="1"){
			$state="../../tools/images/close2.png";
			$c_sid=0;
		}else{
			$state ="../../tools/images/open.png";
			$c_sid=1;
		}
		$sql = "update course set c_state='$state',c_sid='$c_sid' where id='$id'";
		$isClose=db_update($sql);
		if($isClose){
			echo  "<script>					
							window.location.href='course.php?pageNum=1&&action=course_list&&id=".$dept_id."&&cid=".$class_id."';
							alert('设置成功');
							</script>";							
							;
		}else{
			echo  "<script>					
							window.location.href='course.php?pageNum=1&&action=course_list&&id=".$dept_id."&&cid=".$class_id."';
							alert('设置失败');
							</script>";							
							;
		}
	 break;
}
db_close();
?>