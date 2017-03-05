<?php
session_start();
if(!isset($_SESSION['anumber'])){//判断是否非法访问
	header("location:../index.php");
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教务辅助管理系统</title>
</head>
<frameset rows="125,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="mainPage/top.php" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="mainPage/left.html" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="mainPage/welcome.html" name="rightFrame" id="rightFrame" title="rightFrame" />
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>