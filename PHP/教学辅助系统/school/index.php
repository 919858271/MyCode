<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head> 
  <title>太原科技大学辅助教学系统</title>
  <meta http-equiv="pragma" content="no-cache" /> 
  <meta http-equiv="cache-control" content="no-cache" /> 
  <meta http-equiv="expires" content="0" /> 
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3" /> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="tools/css/style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="tools/images/Sicon.ico" type="image/x-icon" /> 
<script language="JavaScript" src="tools/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="tools/js/login.js"></script>
<script src="tools/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
</head>
<body onkeydown="on_enter()" style="background-color:#1c77ac; background-image:url(tools/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">


    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div> 

<div class="logintop">    
    <span>欢迎使用辅助教学系统</span>    
    <ul>
    <li><a href="#"></a></li>
    <li><a href="#" onclick="help()" name="help">帮助</a></li>
    <li><a href="#" onclick="about()" name="about">关于</a></li>
    </ul>    
 </div>
 
 <form  name="loginForm" method="post" action="phpBean/Login.php" id="login" > 
    <div class="loginbody" > 
    <span class="systemlogo"></span>       
    <div class="loginbox" >   
	 <ul >  	
		<li><input name="userName" id="userName" type="text" class="loginuser" value="201118030221" /></li>
		<li><p><input name="passWord" id="passWord" type="password" class="loginpwd" value="123456"/></p></li>
		<li><p><input name="Button" id="Button" type="button" class="loginbtn" value="登录"  onclick="check()" />
		<label><input name="userType"  id="userType" type="radio" value="1" checked="checked" />学生</label>
		<label><input name="userType"  id="userType" type="radio" value="2"  />教师</label>
		<label><input name="userType"  id="userType" type="radio" value="3"  />管理员</label></p></li>
    </ul>   
    </div>  
    </div>
  </form> 
	<?php  
   //接受errno
	 if (!empty($_GET['errno']))
	 {
		if($_GET['errno']==1)
		{	
			echo"<script>alert('用户不存在！');</script>";
		}
		if($_GET['errno']==2)
		{
			echo"<script>alert('密码错误！');</script>";
		}
	 } 
 ?>  	
</body>

</html>
