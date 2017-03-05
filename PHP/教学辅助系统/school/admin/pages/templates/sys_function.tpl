<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
	<link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />
	  <link rel="stylesheet" href="../../tools/css/bbs.min.css" type="text/css"/>
	<link href="../../tools/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../tools/js/jquery.js"></script>
	<script type="text/javascript" src="../../tools/js/tijiao.js"></script>
	<script type="text/javascript" src="../../tools/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../tools/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="../../tools/js/select-ui.min.js"></script>
	<script type="text/javascript" src="../../tools/editor/kindeditor.js"></script>
	<script type="text/javascript">
		KE.show({
			id : 'que_content',
			cssPath : './index.css'
		});
	  </script>
	<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 230		  
		});
	});
	</script>
</head>
<body style="background-color:#F2F0F1; ">
	 <div class="mainindex">   
    <div class="welinfo">
    <b style="margin-left:8px">
	<ul class="placeul3" style="margin-top:10px">
         <li><a href="../main.php" target="_parent">首页</a></li>
		 <li> <a href="#">系统管理</a></li>
		  <li> <a href="#">{$inf}</a></li>
		 <li> <a href="#">{$class}</a></li>
    </ul>
	</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 
		<ul class="forminfo">
		<form id="ser_form" name="ser_form" method="post" action="sys_functions.php?action={$acte}&&idf=act">
				<li><label style="width:100px;margin-top:10px"><b>选择查询方式：</b></label>
				<div class="vocation" style="margin-top:10px">	
					<input name="number" id="number" type="text" class="dfinput" value="" title="编号查询" style="width:230px;"/>
					
				</div>&nbsp;
				<div class="vocation" style="margin-left:10px;margin-top:10px">					
						<select class="select1" name="dept" id="dept" title="班级、系别查询">
						<option name="pace_name1" value="" selected="selected" class="dfinput"></option>
							<!--------开始循环------------->
						{section name=i loop=$classes}
						<option name="pace_name1" value="{$classes[i][0]}"  class="dfinput">{$classes[i][0]}</option>
						{/section}
						<!----------循环结束------------>
						</select>
				</div>&nbsp;<label style="margin-left:60px;margin-top:10px"><input name="add" id="add" type="submit" class="btn2" value="马上查询"/></label>				
					</li>
		</form>
		<table  width="100%" border="1" align="center"  class="expinf tablelist">
						  <tr>
							<td width="10%">
								<ul class="toolbar3" style="margin-left:30px">
									<li class="click">									
										<input name="submit" type="image" src="../../tools/images/reset.png" title="初始当前所有用户登陆口令" onclick="resetall()" /></a>  												
									</li>
		
								</ul> 
							</td>
							<td width="35%><div align="center"></div></td>
							<td width="35%"><div align="center"></div></td>
							<td width="16%">							</td>
						  </tr>
						  <tr>
							<td><div align="center"><strong>登陆账户</div></td>
							<td><div align="center"><strong>用户姓名</div></td>
							<td><div align="center"><strong>登陆口令</div></td>
							<td><div align="center"><strong>账户操作</div></td>
						  </tr>
			  <!---循环开始-{section name=i loop=$data}---->
						  <tr>
							<td width="10%" align="center">{$data[i][0]}</td>
							<td width="35%" align="center">{$data[i][1]}</td>
							<td width="35%" align="center">*********</td>								
						  <td width="16%" >
								<ul class="toolbar3" style="margin-left:80px">
									<li class="click">
										<input name="act" type="hidden" id="act" value="{$data[i][0]}" />
										 <input name="snumber" type="hidden" id="{$data[i][0]}" value="{$data[i][0]}" />
										<input name="class_name" type="hidden" id="{$class}" value="{$class}" />
										<input name="submit" type="image" src="../../tools/images/reset.png" title="初始用户登陆口令" onclick="det{$data[i][0]}()"/></a>  
												
									</li>
		
								</ul>  
							</td>					 
						  </tr>
			  <!---循环结束- {/section}---->
				
					</table>
		</ul>   
		</div>
</div>		
			
</body>
<script type="text/javascript">
	var send=document.getElementById("add");
	send.onclick=function(){
	var number=document.getElementById("number").value.trim();
	var dept=document.getElementById("dept").value.trim();
		if((number=="")&&(dept=="")){
			alert("请选择至少一种查询方式");
				return false;
			}
	}
</script>
<script  language="javascript" type="text/javascript" >

function resetall(){  
  		 if (confirm("是否全部初始化！！！"))  {
				if (confirm("重要,是否全部初始化！！！")){
					location.href="sys_functions.php?action={$acte}&&idf=resetall&&id="+{$class_id};
					}else{
						return  false;
					}				
		 }else{
			 return  false;
		 }		
}
	
</script>
<script  language="javascript" type="text/javascript" >
<!---循环开始-{section name=i loop=$data}---->	
function det{$data[i][0]}(){  		
		 var number=document.getElementById("{$data[i][0]}").value.trim();
	    
  		 if (confirm("是否初始化！！！"))  {				
					location.href="sys_functions.php?action={$acte}&&idf=update&&id="+ number;				
		 }else{
			 return  false;
		 }		
}
<!---循环结束- {/section}---->		
</script>