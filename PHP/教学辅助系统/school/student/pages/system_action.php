<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
$smarty = new Smarty;
session_start();
if(!isset($_SESSION['snumber'])){//判断是否非法访问
	header("location:../../index.php");
}
db_connect();
$action = $_GET['action'];
switch($action){
	case "list" :
		//接收用户名、密码、用户、类型
		$snumber=$_GET['snumber'];//学号
		$smarty->assign("snumber",$snumber);
		$smarty->display("templates/system_action.tpl");
	break;
	case "change" :
			$snumber=trim($_POST['s_xh']);//学号
			$old_pass=trim($_POST['old_pass']);//旧密码
			$new_pass=trim($_POST['new_pass']);//新密码
			$sql="select password from student where snumber='$snumber' and password='$old_pass'";
			$check=db_query($sql);
			if(!empty($check)){
				$sql = "update student set password='$new_pass' where snumber='$snumber'";
				$isUp = db_update($sql) ;
				if($isUp){
					echo  "<script>					
									window.location.href='system_action.php?action=list&&snumber=".$snumber."';											
									alert('密码修改成功！');								
									</script>"
											;
				}else{
					echo  "<script>					
								window.location.href='system_action.php?action=list&&snumber=".$snumber."';		
									alert('密码修改失败！');								
									</script>"
											;
				}
			}else{
				echo  "<script>					
								window.location.href='system_action.php?action=list&&snumber=".$snumber."';		
									alert('旧密码输入错误！');								
									</script>"
											;
			}
	break;
}
db_close();
?>