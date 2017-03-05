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
    <a href="../main.php" target="_parent"><img src="../../tools/images/loginlogo2.png" title="系统首页" />  
    </div>      
    <div class="topleft">
    <a><img src="../../tools/images/logo_jw.png" /></a>
    </div>
	
	<div class="nav">
		
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
    <b >现在是<label id="nowTime"></label> </b>	
   &nbsp; <a href="../pages/passWord.php?action=list&&anumber={$anumber}" target="rightFrame"">帐号设置</a>  </span>
    </div></td>
  </tr>
</table>
</body>
</html>
