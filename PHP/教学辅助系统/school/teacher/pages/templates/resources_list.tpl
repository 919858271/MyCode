<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
	<link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />
	  <link rel="stylesheet" href="../../tools/css/bbs.min.css" type="text/css"/>
	  <link href="../../tools/css/up_file.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../tools/js/up_file.js"></script>
	<link href="../../tools/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../tools/js/jquery.js"></script>
	
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
			width : 145			  
		});
	});
	</script>
	
	
	
</head>
<body style="background-color:#F2F0F1; ">
	<div class="xline"></div>
	 <div class="mainindex">   
    <div class="welinfo">
    <span><img src="../../tools/images/dp.png"  /></span>
    <b>共享资源</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 
		
			<div class="itab">
				<ul> 
				<li><a href="#tab1" class="selected ">资源列表</a></li> 
				<li><a href="#tab2">我要分享</a></li> 
				</ul>
			</div>    
			<div id="tab1" class="tabson">	
					<table width="80%" border="1" align="center"  class="expinf tablelist">	
					  <tr><td><div align="center"><strong>文件名称</div></td>
						<td><div align="center"><strong>文件描述</div></td>
						<td><div align="center"><strong>发布时间</div></td>
						<td><div align="center"><strong>发布者</div></td>
						<td><div align="center"><strong>操作</div></td>
						</td>
					   </tr>	
					{section name=i loop=$data}	
					<tr>
					<td width="15%" align="center">{$data[i][1]}</td>
					<td width="32%" align="left" style="padding-left:8px">{$data[i][6]}</td>
					<td width="8%" align="center">{$data[i][3]}</td>
					<td width="8%" align="center">{$data[i][4]}</td>
					<td width="10%" align="center">
					<ul class="toolbar5">
						<li class="click"><a href="download.php?action=1&&id={$data[i][0]}" title="点击下载"><span>
						<img src="../../tools/images/download.png" /></span></a></li>
						</ul>   
					</td>
					</tr>
					{/section}
					</table>  
				
					<ul class="am-pagination am-fr admin-content-pagination">
			   <li class="{$sty[0]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum=1">首页</a></li>
			  <li class="{$sty[0]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$left}">&laquo;</a></li>
			  <li class="{$sty[6]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$pageNum}">{$pageNum}</a></li>
			  <li class="{$sty[1]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$pageNum+1}">{$pageNum+1}</a></li>
			  <li class="{$sty[2]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$pageNum+2}">{$pageNum+2}</a></li>
			  <li class="{$sty[3]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$pageNum+3}">{$pageNum+3}</a></li>
			  <li class="{$sty[4]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$pageNum+4}">{$pageNum+4}</a></li>
			  <li class="{$sty[1]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$pageNum+1}">&raquo;</a></li>
			  <li class="{$sty[5]}"><a href="resources.php?tnumber={$tnumber}&&course_id={$course_id}&&action=list&&pageNum={$last}">最后一页</a></li>
            </ul> 
				
			</div>
        </div> 
			
			<!------------选项卡2------------------------>
			<div id="tab2" class="tabson">  
			<ul class="forminfo">
			<form id="fileUp_form" name="fileUp_form" method="post" action="resources.php?action=upload&&course_id={$course_id}&&tnumber={$tnumber}" enctype="multipart/form-data">	
				
				<li><label  style="margin-top:20px"><b>选择文件</b></label>		
					<div class="vocation">		
					<div class="file-uploader-wrap">
						<input type="file" class="file-uploader dfinput"  name="file" id="FileUploader" />
					<div class="file-uploader-wrap-fake">
					<input type="text" id="PathDisplayer" value="文件类型/大小:rar,zip <10M 请选择文件..."class="input-text dfinput" style="width:518px;height:32px;" disabled />					
					</div>	
					
				</li>
				<li ><label  style="margin-top:20px"><b>文件描述</b></label>		
					<div class="vocation" >					
					</div>	
					<input name="file_detial" id="file_detial" type="text" class="dfinput" value=""  style="width:518px;margin-top:20px"/>
				</li>	   	
				<li><label>&nbsp;</label>
				<input name="fileUp" id="fileUp" type="submit" class="btn1" value="马上分享" /></li>
		</form>
			</ul>    
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
	var send=document.getElementById("fileUp");
	send.onclick=function(){
	var file=document.getElementById("FileUploader").value.trim();
	var detial=document.getElementById("file_detial").value.trim();
	if(file.length<1){
		alert("请选择文件");
			return false;
		}
	if(detial.length<20){
		alert("文件描述不小于20个字符");
			return false;
		}
	}
</script>
 
</body>

</html>
