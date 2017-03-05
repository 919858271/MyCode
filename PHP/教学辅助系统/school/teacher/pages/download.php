<?php 
require_once "../../database/config.inc.php";
session_start();
if(!isset($_SESSION['tnumber'])){//判断是否非法访问
	header("location:../../index.php");
}
db_connect();
$action = $_GET['action'];
switch($action){
	case "1" ://资源文件下载
		$file_id = $_GET['id'];
		/****查询下载文件信息*****/
		$sql = "select * from file_list where id='$file_id'";
		$data = db_query($sql);

		if(!empty($data)){
			$rel_name = $data[0][1];
			$file_name = $data[0][2];
			$file_dir = "../../upload/".$file_name;	//文件路径
			if(file_exists($file_dir))   {   //检查文件是否存在
				$type = end(explode(".",$file_name));//文件的类型
				$type_url= "Content-type: application/".$type;
				header('$type_url');
				//下载显示的名字
				$down_name = "Content-Disposition: attachment; filename='".$rel_name.".".$type."'";
				header($down_name);
				//开始下载
				readfile($file_dir);
				exit();
			}else{
				echo   "文件找不到";
				exit();
			}	
		}
		else{
			
			
		}
		break;
	case "2" ://实验报告下载
		$file_id = $_GET['id'];
		/****查询下载文件信息*****/
		$sql = "select * from report where pace_id='$file_id'";
		$data = db_query($sql);
		if(!empty($data)){
			$rel_name = $data[0][8];//原文件名
			$file_name = $data[0][9];//重命名后的文件名
			$s_id=$_SESSION['ss_id'];
			$file_dir = "../../upload/".$file_name;	//文件路径
			if(file_exists($file_dir))   {   //检查文件是否存在
				$type = end(explode(".",$file_name));//文件的类型
				$type_url= "Content-type: application/".$type;
				header('$type_url');
				//下载显示的名字
				$down_name = "Content-Disposition: attachment; filename='".$rel_name.".".$type."'";
				header($down_name);
				//开始下载
				readfile($file_dir);
				exit();
			}else{
				echo  "<script>					
						window.location.href='exp_list.php?action=report_detial&&pid=".$file_id."&&sid=".$s_id."';
							 alert('实验报告不存在，可能已被管理员删除');
							</script>"
																		;
			}	
		}
		else{
			echo  "<script>					
						window.location.href='exp_list.php?action=report_detial&&pid=".$file_id."&&sid=".$s_id."';
							 alert('实验报告不存在，可能已被管理员删除');
							</script>";
			
		}

	break;
}
db_close();
?>