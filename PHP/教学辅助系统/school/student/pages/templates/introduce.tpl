<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
	<link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />
	<link href="../../tools/css/up_file.css" rel="stylesheet" type="text/css" />
	  <link rel="stylesheet" href="../../tools/css/bbs.min.css" type="text/css"/>
	<link href="../../tools/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../tools/js/up_file.js"></script>
	<script type="text/javascript" src="../../tools/js/jquery.js"></script>
	<script type="text/javascript" src="../../tools/js/bootstrap.min.js"></script>
	<script language="javascript" type="text/javascript" src="../../tools/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../../tools/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="../../tools/js/select-ui.min.js"></script>
	<script type="text/javascript" src="../../tools/editor/kindeditor.js"></script>
	<script type="text/javascript">
		KE.show({
			id : 'intr',
			cssPath : './index.css'
			
		});
		KE.show({
			id : 'targ',
			cssPath : './index.css'
			
		});
	  </script>
	<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 190			  
		});
	});
	</script>
</head>
<body style="background-color:#F2F0F1; ">

	<div class="xline"></div>
	 <div class="mainindex">   
    <div class="welinfo">
    <span><img src="../../tools/images/dp.png"  /></span>
    <b>课程介绍</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 
		
			   
			<div id="tab1" class="tabson">	
	<table width="80%" border="1" align="center" class="tableinf tablelist" >
      <tr>
        <td width="17%" scope="row"><div align="center"><strong>课程名称</strong></div></td>
        <td width="41%"><span class="STYLE1">{$data[0]}</span></td>
        <td width="19%"><div align="center"><strong>授课教师</strong></div></td>
        <td width="23%"><div align="center"><p class="STYLE1">{$data[1]}</p></div></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>上课地点</strong></div></td>
        <td><span class="STYLE1">{$data[2]}</span></td>
        <td><div align="center"><strong>上课时间</strong></div></td>
        <td><div align="center"> {$data[3]}&nbsp;</div></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>课程介绍</strong></div></td>
        <td colspan="3"><span class="STYLE1">{$data[4]}</span></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>课程目标</strong></div></td>
        <td colspan="3">{$data[5]}     
      </tr>      
    </table>
</div>
 </div> 
		
		
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>   
 <script type="text/javascript"> 
	var e=document.getElementById( "link1 ") 
	e.removeAttribute( "href ") 
 </script>   
 

 <script type="text/javascript">
	var send=document.getElementById("add");
	send.onclick=function(){
	var where=document.getElementById("where").value.trim();
	var start=document.getElementById("start").value.trim();	
	if(where==""){
		alert("请填写上课地点");
			return false;
		}
	if(start==""){
		alert("请填写上课时间");
			return false;
	}
	}
</script>

</body>

</html>
