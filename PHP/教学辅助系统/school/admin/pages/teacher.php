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
		$dept_id = $_GET['id'];//系别编号
		$pageNum = $_GET['pageNum'];//分页编号
		$pageSize=9;//分页大小
		$mark = mark($pageNum,$pageSize);//获取分页标示
		$sql1 = "select count(tnumber) from teacher where  tdept='$dept_id'";//获取总数据量
		$pageSum=(int)db_count($sql1,$pageSize);//获取总页数
		if($pageSum==0){
			$pageSum=1;
		}
		$sty=sty2($pageNum,$pageSum);//分页链接样式
		$sql = "select * from teacher where tdept='$dept_id' ORDER BY tnumber limit $mark[0],$pageSize";
		$data=db_query($sql);
		$sql2 = "select class_name from classes where dept_id='$dept_id'";
		$data1=db_query($sql2);
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
			$smarty->assign("dept",$dept);
			$smarty->assign("dept_id",$dept_id);	
			$smarty->assign("data",$data);	
			$smarty->assign("data1",$data1);	
			$smarty->assign("sty",$sty);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);			
			$smarty->display("templates/teacher.tpl");			
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
			$smarty->assign("dept",$dept);
			$smarty->assign("dept_id",$dept_id);
			$smarty->assign("data",null);
			$smarty->assign("data1",$data1);			
			$smarty->assign("sty",$sty1);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);				
			$smarty->display("templates/teacher.tpl");				
		}
		break;
	case "add" :
				$dept_id = trim($_POST['dept_id']);
				$t_number=trim($_POST['t_number']);
				$t_name=trim($_POST['t_name']);
				$t_sex=trim($_POST['t_sex']);
				$t_pass = "123456";
				if($dept_id=="101"){
				$dept="数学系";
				}
				if($dept_id=="102"){
					$dept="物理系" ;
				}
				if($dept_id=="103"){
					$dept="化学系";
				}
				
				$sql = "insert into teacher (tnumber,tname,password,tsex,tdept,dept_name) values ('$t_number','$t_name','$t_pass',
						'$t_sex','$dept_id','$dept')";
				$isADD = db_update($sql);
				if($isADD){
					echo  "<script>					
							window.location.href='teacher.php?pageNum=1&&action=list&&id=".$dept_id."';
							alert('添加成功');
							</script>";							
							;
				}else{
					echo  "<script>					
							window.location.href='teacher.php?pageNum=1&&action=list&&id=".$dept_id."';
							alert('添加失败');
							</script>";							
							;
				}
		break;		
	case "delete" :
			$t_number = $_GET['id'];
			$dept_id = $_GET['dept_id'];
			$sql = "delete from teacher where tnumber='$t_number'";
			$isDelete =  db_update($sql);
			if($isDelete){
				echo  "<script>					
							window.location.href='teacher.php?pageNum=1&&action=list&&id=".$dept_id."';
							alert('删除成功');
							</script>";							
							;
			}else{
				echo  "<script>					
							window.location.href='student.php?pageNum=1&&action=list&&id=".$dept_id."';
							alert('删除失败');
							</script>";							
							;
							
			}
		break;		
}
db_close();
?>