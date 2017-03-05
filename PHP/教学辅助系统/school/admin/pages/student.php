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
		$dept_id = $_SESSION['dept_id'];
		$class_id = $_GET['id'];//班级编号
		$pageNum = $_GET['pageNum'];//分页编号
		$pageSize=9;//分页大小
		$mark = mark($pageNum,$pageSize);//获取分页标示
		$sql1 = "select count(snumber) from student where  class_id='$class_id'";//获取总数据量
		$pageSum=(int)db_count($sql1,$pageSize);//获取总页数
		if($pageSum==0){
			$pageSum=1;
		}
		$sty=sty2($pageNum,$pageSum);//分页链接样式
		$sql = "select * from student where class_id='$class_id' ORDER BY snumber limit $mark[0],$pageSize";
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
			$class_name =$data[0][4] ;
			$smarty->assign("dept_id",$dept_id);
			$smarty->assign("dept",$dept);				
			$smarty->assign("class",$class_name);	
			$smarty->assign("class_id",$class_id);	
			$smarty->assign("data",$data);	
			$smarty->assign("sty",$sty);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);			
			$smarty->display("templates/student.tpl");			
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
			$sql3 = "select class_name from classes where class_id='$class_id'" ;
			$data3=db_query($sql3);
			$class_name =$data3[0][0] ;
			$sty1=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");
			$smarty->assign("dept_id",$dept_id);
			$smarty->assign("dept",$dept);
			$smarty->assign("class",$class_name);	
			$smarty->assign("class_id",$class_id);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("last",$pageSum);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("sty",$sty1);
			$smarty->assign("data",null);			
			$smarty->display("templates/student.tpl");	
		}
		break;
	case "add" :
				$dept_id = $_SESSION['dept_id'];
				$class_id=trim($_POST['class_id']);
				$s_class=trim($_POST['class_name']);
				$s_number=trim($_POST['s_number']);
				$s_name=trim($_POST['s_name']);
				$s_sex=trim($_POST['s_sex']);
				$s_pass = "123456";
				$sql = "insert into student values ('$s_number','$s_name','$s_pass',
						'$s_sex','$s_class','$class_id','$dept_id')";
				$isADD = db_update($sql);
				if($isADD){
					echo  "<script>					
							window.location.href='student.php?pageNum=1&&action=list&&id=".$class_id."';
							alert('添加成功');
							</script>";							
							;
				}else{
					echo  "<script>					
							window.location.href='student.php?pageNum=1&&action=list&&id=".$class_id."';
							alert('添加失败');
							</script>";							
							;
				}
		break;		
	case "delete" :
			$s_number = $_GET['id'];
			$class_id = $_GET['classid'];
			$sql = "delete from student where snumber='$s_number'";
			$isDelete =  db_update($sql);
			if($isDelete){
				echo  "<script>					
							window.location.href='student.php?pageNum=1&&action=list&&id=".$class_id."';
							alert('删除成功');
							</script>";							
							;
			}else{
				echo  "<script>					
							window.location.href='student.php?pageNum=1&&action=list&&id=".$class_id."';
							alert('删除失败');
							</script>";							
							;
							
			}
		break;		
}
db_close();
?>