<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
  <link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="../../tools/js/relTime.js"></script>
<script type="text/javascript" src="../../tools/js/tijiao.js"></script>
<script type="text/javascript" src="../../tools/js/jquery.js"></script>
 <script type="text/javascript"src="../../tools/js/jquery.min.js"></script>

<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />	
	  
	

<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
});
</script>

</head>
<body onLoad="showNowTime()" style="background-color:#F2F0F1; ">


 <table width="100%" border="0">
  <tr style="background:url(../../tools/images/topbg.gif) repeat-x;">
    <td><div class="topleft">
    <a href="#" target="_parent"><img src="../../tools/images/loginlogo2.png" title="系统首页" />  </a>
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
   <b >&nbsp;欢迎使用辅助教学系统 &nbsp;现在是<label id="nowTime"></label> </b>
	
  
    </div></td>
  </tr>
</table>
    
 <div class="xline"></div>
<div class="welinfo">
    <span><img src="../../tools/images/dp.png"  /></span>
    <b>请选择课程</b>
</div>	
<table style="width:60%;margin-left:0%">
<div class="nav2" style="width:100%;margin-left:0%">
<!---循环开始-{section name=i loop=$data}---->	

<li> <a href="main.php?tnumber={$tnumber}&&course_id={$data[i][0]}" ><img src="../../tools/images/course.png" /><h2>{$data[i][1]}</h2></a></li>
 <!---循环结束- {/section}---->
</div>		
 </table>
	<div class="xline" style="margin-top:30px"></div>
	
<div class="welinfo" style="margin-top:10px">
</div> 

<!--[if lt IE 9]>
<script src="assets/js/jquery1.11.1.min.js"></script>
<script src="assets/js/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->

<!--<![endif]-->

</body>
</html>
