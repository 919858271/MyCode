<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../tools/js/jquery.js"></script>
<script language="JavaScript" src="../../tools/js/relTime.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>
<body onload="showNowTime()">
   
    <table width="100%" border="0">
  <tr style="background:url(../../tools/images/topbg.gif) repeat-x;">
    <td><div class="topleft">
    <a href="../mainPage/select.php?tnumber={$tnumber }&&course_id={$c_id}&&dept_id={$tdept}" target="_parent"><img src="../../tools/images/loginlogo2.png" title="系统首页" />  </a>
    </div>      
    <div class="topleft">
    <a><img src="../../tools/images/logo_jw.png" /></a>
    </div>
	
	<div class="nav">	
		<li> <a href="content.php?course_id={$c_id}&&tnumber={$tnumber}"  target="mainFrame"><img src="../../tools/images/ico011.png" /><h2>公告通知</h2></a></li>
		<li> <a href="../pages/introduce.php?action=intr&&course_id={$c_id}&&tnumber={$tnumber}"  target="mainFrame"><img src="../../tools/images/ico02.png" /><h2>课程介绍</h2></a></li>
		<li> <a href="../pages/exp_list.php?tnumber={$tnumber }&&course_id={$c_id}&&action=list&&pageNum=1&&tab=1" target="mainFrame"><img src="../../tools/images/ico03.png" /><h2>教学实验</h2></a></li>
		<li> <a href="../pages/bbs_list.php?tnumber={$tnumber }&&course_id={$c_id}&&action=list&&pageNum=1" target="mainFrame"><img src="../../tools/images/ico05.png" /><h2>在线答疑</h2></a></li>
	<li> <a href="../pages/resources.php?tnumber={$tnumber }&&course_id={$c_id}&&action=list&&pageNum=1" target="mainFrame"><img src="../../tools/images/disk.png" /><h2>共享资源</h2></a></li>
	</div>           
    <div class="topright">    
    <ul>
    <li><span></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
   <li><a href="../../index.php" target="_parent">退出</a></li>
    </ul>    
    <div class="user">
    <span>{$name}</span>
    <i>&nbsp;&nbsp;</i>
    </div>    
    </div>
	</td>
  </tr>
  <tr style="background:url(../../tools/images/righttop.gif) repeat-x;">
    <td><div class="place1">
    <b >&nbsp;当前课程：{$c_name} &nbsp;现在是<label id="nowTime"></label> </b>
	
   &nbsp; <a href="../pages/system_action.php?action=list&&tnumber={$tnumber}" target="mainFrame"">帐号设置</a>  </span>
    </div></td>
  </tr>
</table>
</body>
</html>
