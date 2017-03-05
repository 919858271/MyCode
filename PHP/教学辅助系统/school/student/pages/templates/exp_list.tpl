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
	<script type="text/javascript" src="../../tools/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="../../tools/js/select-ui.min.js"></script>
	<script type="text/javascript" src="../../tools/editor/kindeditor.js"></script>
	<script type="text/javascript">
		KE.show({
			id : 'report_content',
			cssPath : './index.css'
			
		});
		KE.show({
			id : 'fianl_report',
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
    <b>教学实验</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 
		
			<div class="itab">
				<ul> 
				<li><a href="#tab1" class="{$tab[0]} ">实验安排</a></li> 
				<li><a href="#tab2" class="{$tab[1]} ">实验报告</a></li> 
				
				</ul>
			</div>    
			<div id="tab1" class="tabson">	
					<table  width="100%" border="1" align="center"  class="expinf tablelist">
						  <tr>
							<td><div align="center"><strong>步骤编号</div></td>
							<td><div align="center"><strong>步骤名称</div></td>
							<td><div align="center"><strong>实验时间</div></td>
							<td><div align="center"><strong>实验任务</div></td>
							<td><div align="center"><strong>操作</div></td>
						  </tr>
			  <!---循环开始-{section name=i loop=$data}---->
						  <tr>
							<td width="12%" align="center">{$data[i][1]}</td>
							<td width="17%" align="left" style="padding-left:18px">{$data[i][2]}</td>
							<td width="15%" align="center"><span style="padding-left:8px">{$data[i][3]}至{$data[i][4]}</span></td>
							<td width="40%" align="center"><span style="padding-left:8px">
							<a href="exp_list.php?action=exp_detial&&pace_id={$data[i][1]}&&course_id={$course_id}" title="点击查看实验阶段详细">
							<strong>{$data[i][5]} . . .</strong></span></td></a>
							<td width="16%" align="center">
								<ul class="toolbar3" style="margin-left:85px">
									<li class="click">
										 <a href="exp_list.php?action=detial&&pace_id={$data[i][1]}&&snumber={$snumber}&&course_id={$course_id}" title="点击查看实验报告"><span>
										 <img src="../../tools/images/detial.png" /></span></a>  
												
									</li>
		
								</ul>  
							</td>
							
						  </tr>
			  <!---循环结束- {/section}---->
					</table>
				
			<ul class="am-pagination am-fr admin-content-pagination">
			  <li class="{$sty[0]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum=1&&action=list&&tab=1">首页</a></li>
			  <li class="{$sty[0]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$left}&&action=list&&tab=1">&laquo;</a></li>
			  <li class="am-active"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$pageNum}&&action=list&&tab=1">{$pageNum}</a></li>
			  <li class="{$sty[1]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$pageNum+1}&&action=list&&tab=1">{$pageNum+1}</a></li>
			  <li class="{$sty[2]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$pageNum+2}&&action=list&&tab=1">{$pageNum+2}</a></li>
			  <li class="{$sty[3]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$pageNum+3}&&action=list&&tab=1">{$pageNum+3}</a></li>
			  <li class="{$sty[4]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$pageNum+4}&&action=list&&tab=1">{$pageNum+4}</a></li>
			  <li class="{$sty[1]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$pageNum+1}&&action=list&&tab=1">&raquo;</a></li>
			  <li class="{$sty[5]}"><a href="exp_list.php?snumber={$snumber}&&course_id={$course_id}&&pageNum={$last}&&action=list&&tab=1">最后一页</a></li>
            </ul> 
				
			</div>
        </div> 
    
    
		<div id="tab2" class="tabson">  
		
			<ul class="forminfo">
			<form id="report_form" name="report_form" method="post" action="exp_list.php?action=uoload&&snumber={$snumber}&&course_id={$course_id}" enctype="multipart/form-data">
				<li><label  style="margin-top:20px"><b>选择文件</b></label>		
					<div class="vocation">		
					<div class="file-uploader-wrap">
						<input type="file" class="file-uploader dfinput"  name="file" id="FileUploader" />
					<div class="file-uploader-wrap-fake">
					<input type="text" id="PathDisplayer" value="文件类型/大小:rar,zip <10M  请选择文件..." 
					class="input-text dfinput" style="width:518px;height:32px;" disabled />							
					</div>	
					
				</li>
				<li><label><b>小结标题</b></label>		
					<div class="vocation">
					
					<select class="select1" name="pace_id" id="pace_id" title="已提交的实验步骤无法继续提交">
						<option name="pace_name1" value="" selected="selected" class="dfinput" >---请选择实验步骤---</option>
						<!--------开始循环------------->
						{section name=i loop=$data1}
						<option name="pace_name1" value="{$data1[i][0]}"  class="dfinput">{$data1[i][1]}</option>
						{/section}
						<!----------循环结束------------>
					</select>
					</div>&nbsp;	
					<input name="report_title" id="report_title" type="text" class="dfinput" value=""  style="width:350px;"/>
				</li>	   	
		
				<li><label><b>小结内容</b></label>
				   <textarea id="report_content" name="report_content" style="width:700px;height:250px;visibility:hidden;"></textarea>   
				</li>
				<li><label>&nbsp;</label><input name="upreport" id="upreport" type="submit" class="btn1" value="马上提交"/></li>
			</form>
			</ul>    
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
	var send=document.getElementById("upreport");
	send.onclick=function(){
	var file=document.getElementById("FileUploader").value.trim();
	
	var pace=document.getElementById("pace_id").value.trim();
	var title=document.getElementById("report_title").value.trim();	
	if(file.length<1){
		alert("请选择文件");
			return false;
		}
	if(pace.length<1){
		alert("请选择实验步骤！！！");
			return false;
		}
	if(title.length<10){
		alert("小结标题不得小于10个字符！！！");
			return false;
		}
	}
</script>
</body>

</html>
