<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
$smarty = new Smarty;
session_start();
if(!isset($_SESSION['anumber'])){//判断是否非法访问
	header("location:../../index.php");
}
db_connect();
$action = $_GET['action'];
switch($action){
	case "list" :
		//接收用户名、密码、用户、类型
		$snumber=$_GET['anumber'];//学号
		$smarty->assign("anumber",$snumber);
		$smarty->display("templates/passWord.tpl");
	break;
	case "change" :
			$anumber=trim($_POST['count']);//管理员号
			$old_pass=trim($_POST['old_pass']);//旧密码
			$new_pass=trim($_POST['new_pass']);//新密码
			$sql="select password from admin where anumber='$anumber' and password='$old_pass'";
			$check=db_query($sql);
			if(!empty($check)){
				$sql = "update admin set password='$new_pass' where anumber='$anumber'";
				$isUp = db_update($sql) ;
				if($isUp){
					echo  "<script>					
									window.location.href='passWord.php?action=list&&anumber=".$anumber."';											
									alert('密码修改成功！');								
									</script>"
											;
				}else{
					echo  "<script>					
								window.location.href='passWord.php?action=list&&anumber=".$anumber."';				
									alert('密码修改失败！');								
									</script>"
											;
				}
			}else{
				echo  "<script>					
								window.location.href='passWord.php?action=list&&anumber=".$anumber."';			
									alert('旧密码输入错误！');								
									</script>"
											;
			}
	break;
}
db_close();
?>