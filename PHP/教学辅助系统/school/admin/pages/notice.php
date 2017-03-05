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
	case "list" ://查看公告通知
		$pageNum = $_GET['pageNum'];//页号
		$pageSize=9;//分页大小
		$mark = mark($pageNum,$pageSize);//获取分页标示
		$sql1 = "select count(id) from notice";//获取总数据量
		$pageSum=(int)db_count($sql1,$pageSize);//获取总页数
		$sty=sty2($pageNum,$pageSum);//分页链接样式
		$sql = "select * from notice ORDER BY times desc limit $mark[0],$pageSize";
		$data=db_query($sql);
		if(!empty($data)){			
			$smarty->assign("data",$data);		
			$smarty->assign("sty",$sty);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);			
			$smarty->display("templates/notice.tpl");			
		}else{
			$sty1=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");				
			$smarty->assign("data",null);		
			$smarty->assign("sty",$sty1);
			$smarty->assign("left",$mark[1]);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("last",$pageSum);				
			$smarty->display("templates/notice.tpl");				
		}
	break;
	case "add" ://添加公告通知
			$title=trim($_POST['title']);//标题
			$detial=trim($_POST['detial']);//内容
			$sql  = "insert into notice (title,detial,times,idf) values ('$title','$detial',now(),'0')";
			$isADD = db_update($sql);
			if($isADD){
					echo  "<script>					
							window.location.href='notice.php?pageNum=1&&action=list';
							alert('发布成功');
							</script>";							
							;
			}else{
				echo  "<script>					
							window.location.href='notice.php?pageNum=1&&action=list';
							alert('发布失败');
							</script>";							
							;
			}			
	break;
	case "delete" ://删除公告通知
			$id = $_GET['id'];//通知公告编号
			$sql = "delete from notice where id='$id'";
			$isDelete =  db_update($sql);
			if($isDelete){
				echo  "<script>					
							window.location.href='notice.php?pageNum=1&&action=list';
							alert('删除成功');
							</script>";							
							;
			}else{
				echo  "<script>					
							window.location.href='notice.php?pageNum=1&&action=list';
							alert('删除失败');
							</script>";							
							;
			}
	break;
	case "detial_list" ://查看公告通知详细
			$id = $_GET['id'];//通知公告编号
			$sql = "select title,times,detial from notice where id='$id'";
			$data=db_query($sql);
			if(!empty($data)){
				$smarty->assign("data",$data);					
				$smarty->display("templates/notice_detial.tpl");	
			}{
				
			}
	break;
}
db_close();
?>