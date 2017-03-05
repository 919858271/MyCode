
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
<link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />
<link href="../../tools/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../tools/js/jquery.js"></script>
<script type="text/javascript" src="../../tools/js/tijiao.js"></script>
<script type="text/javascript" src="../../tools/js/jquery.min.js"></script>
<script type="text/javascript" src="../../tools/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../tools/js/jquery.js"></script>
<script type="text/javascript" src="../../tools/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../../tools/js/select-ui.min.js"></script>
<script type="text/javascript" src="../../tools/editor/kindeditor.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>

</head>


<body>

	<div class="xline"></div>
		
    <div class="mainindex">   
			<div class="welinfo">
			<span><img src="../../tools/images/dp.png"  /></span>
			<b>密码修改</b>
			</div>
		<div class="xline"></div>
<form name="xg_form" id="xg_form"  method="post" action="system_action.php?action=change" style="margin-left:350px">
	<table width="70%" border="0"   class="tableinf1 tablelist4">		
	<tr>
  	<td></td>
    <td width="78%"><div align="left"><a href="1.php" ></a></div>
      </td>
    </tr> 
    
	<tr>
		<td width="22%">
			<label style="margin-left:40px">
			<div align="right">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 号</div>
			</label>  
	  </td>  
			
			<td>
		    <div align="left" >
		      <input name="s_xh" id="s_xh" type="text" class="dfinput" value="{$snumber}"  style="width:345px; " readonly />
		   </div>
		
		  
		</td>
  </tr>
	 <tr>
		<td>
			<label style="margin-left:40px">
			<div align="right">旧&nbsp;&nbsp;&nbsp; 密&nbsp;&nbsp;&nbsp; 码</div>
			</label>
	   </td>		
			<td>
		    <div align="left">
		    <input name="old_pass" id="old_pass" type="password" class="dfinput" value=""  style="width:345px;" />
		   </div>
		
		</td>    
    </tr>
	<tr>
		<td>
			<label style="margin-left:40px">
			<div align="right">新&nbsp;&nbsp;&nbsp; 密&nbsp;&nbsp;&nbsp; 码</div>
			</label>
		</td>	
			<td>
		    <div align="left">
		     <input name="new_pass" id="new_pass" type="password" class="dfinput" value=""  style="width:345px;" />
		   </div>
		
		</td>    
    </tr>
	<tr>
	  <td>
		  <label style="margin-left:38px">
		  <div align="right">新密码确认
		  </div>
		  </label>		</td>  
           <td>
		    <div align="left">
		      <input name="conf_pass" id="conf_pass" type="password" class="dfinput" value=""  style="width:345px;" />
		   </div>
		 </td>		
    </tr>	

	<tr>
	  <td>
		 
		</td>  
           <td>
		     <label style="margin-top:10px">
		     <ul class="forminfo">
				<label>&nbsp;</label><input name="sub" id="sub" type="button" class="btn1" value="确定" onclick="xg()"/>
            </ul>	
		   </label>
		 </td>		
    </tr>	
	

  </table>   
	
</form>	
<div class="mainindex">   
			<div class="welinfo">
			<span></span>
			<b></b>
			</div>
		<div class="xline"></div>	
</body>
</html>