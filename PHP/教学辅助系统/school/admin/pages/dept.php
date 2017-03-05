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
			$smarty->assign("sty",$sty);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);				
			$smarty->display("templates/dept.tpl");
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
			$smarty->display("templates/dept.tpl");		
		}
	break;
	case "add" :
			    $dept_id=trim($_POST['dept_id']);
				$c_number=trim($_POST['c_number']);
				$c_name=trim($_POST['c_name']);
				$sql = "insert into classes values ('$c_number','$c_name','$dept_id')";
				$isADD = db_update($sql);
				if($isADD){
					echo  "<script>					
							window.location.href='dept.php?pageNum=1&&action=list&&id=". $dept_id."';
							alert('添加成功');
							</script>";							
							;
				}else{
					echo  "<script>					
							window.location.href='dept.php.php?pageNum=1&&action=list&&id=". $dept_id."';
							alert('添加失败');
							</script>";							
							;
				}
	 break;
}
db_close();
?>