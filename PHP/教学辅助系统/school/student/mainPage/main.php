<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
session_start();
if(!isset($_SESSION['snumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();
$snumber=$_GET['snumber'];//课程编号
$course_id=$_GET['course_id'];//课程编号
$inf="select sname from student where snumber='$snumber'";//查询学生姓名
$infs = db_query($inf);
$sql = "select c_name from course where c_id='$course_id'";
$data = db_query($sql);

db_close();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教务辅助系统</title>
</head>
<frameset rows="125,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.php?snumber=<?php echo $snumber;?>&&course_id=<?php echo $course_id; ?>" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" /> 
    <frame src="content.php?snumber=<?php echo $snumber;?>&&course_id=<?php echo $course_id; ?>" name="mainFrame" id="rightFrame" title="rightFrame" />
</frameset>
<noframes><body>
</body></noframes>
</html>