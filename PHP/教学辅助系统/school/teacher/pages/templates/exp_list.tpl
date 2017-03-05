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
			id : 'detial',
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
				<li><a href="#tab1" class="{$tab[0]} ">实验进度</a></li> 
				<li><a href="#tab2" class="{$tab[1]} ">实验安排</a></li> 
				
				</ul>
			</div>    
			<div id="tab1" class="tabson">	
					<table  width="100%" border="1" align="center"  class="expinf tablelist">
						  <tr>
							<td><div align="center"><strong>步骤编号</div></td>
							<td><div align="center"><strong>步骤名称</div></td>
							<td><div align="center"><strong>实验任务</div></td>
							<td><div align="center"><strong>学生实验报告</div></td>
							<td><div align="center"><strong>操作</div></td>
						  </tr>
			  <!---循环开始-{section name=i loop=$data}---->
						  <tr>
							<td width="12%" align="center">{$data[i][1]}</td>
							<td width="17%" align="center" >{$data[i][2]}</td>
							<td width="40%" align="left" style="padding-left:14px">{$data[i][5]}</td>
							<td width="15%" align="center">
								<ul class="toolbar3" style="margin-left:70px">
									<li class="click">
										 <a href="exp_list.php?action=report&&paceNum={$data[i][1]}&&course_id={$course_id}" title="点击查看实验报告"><span>
										 <img src="../../tools/images/detial.png" /></span></a>  
												
									</li>
		
								</ul> 
							</td></a>
							<td width="16%" >
								<ul class="toolbar3" style="margin-left:100px">
									<li class="click">
										 <input name="snumber" type="hidden" id="{$data[i][1]}" value="{$data[i][1]}" />
										<input name="submit" type="image" src="../../tools/images/delete.png" title="点击删除" onclick="det{$data[i][1]}()"/></a></li>
												
									</li>
		
								</ul>  
							</td>
							
						  </tr>
			  <!---循环结束- {/section}---->
					</table>
				
			<ul class="am-pagination am-fr admin-content-pagination">
			  <li class="{$sty[0]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum=1&&tab=1">首页</a></li>
			  <li class="{$sty[0]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$left}&&tab=1">&laquo;</a></li>
			  <li class="{$sty[6]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$pageNum}&&tab=1">{$pageNum}</a></li>
			  <li class="{$sty[1]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$pageNum+1}&&tab=1">{$pageNum+1}</a></li>
			  <li class="{$sty[2]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$pageNum+2}&&tab=1">{$pageNum+2}</a></li>
			  <li class="{$sty[3]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$pageNum+3}&&tab=1">{$pageNum+3}</a></li>
			  <li class="{$sty[4]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$pageNum+4}&&tab=1">{$pageNum+4}</a></li>
			  <li class="{$sty[1]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$pageNum+1}&&tab=1">&raquo;</a></li>
			  <li class="{$sty[5]}"><a href="exp_list.php?course_id={$course_id}&&action=list&&pageNum={$last}&&tab=1">最后一页</a></li>
            </ul> 
				
			</div>
        </div> 
    
    
		<div id="tab2" class="tabson">  	
			<ul class="forminfo" style="margin-left:20px">
			<form id="report_form" name="report_form" method="post" action="exp_list.php?action=add&&course_id={$course_id}" >
				<li><label  ><b>步骤名称</b></label>						
					<input name="title" id="title" type="text" class="dfinput" value=""  style="width:350px;"/>
				</li>
				<li><label><b>开始时间</b></label>						
					<input size="31" name="start_time" id="start_time" class="Wdate" type="text" onClick="WdatePicker()"  value="" style="margin-top:7px;height:25px"> 
				</li>
				<li><label><b>结束时间</b></label>						
					
					<input size="31" name="end_time" id="end_time" class="Wdate " type="text" onClick="WdatePicker()"   value="" style="margin-top:7px;height:25px" >
				</li>	   			
				<li><label><b>实验任务</b></label>
				   <textarea id="detial" name="detial" style="width:700px;height:250px;visibility:hidden;"></textarea>   
				</li>
				<li><label>&nbsp;</label><input name="add" id="add" type="submit" class="btn1" value="马上提交"/></li>
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
	var send=document.getElementById("add");
	send.onclick=function(){
	var title=document.getElementById("title").value.trim();
	var start_time=document.getElementById("start_time").value.trim();	
	var end_time=document.getElementById("end_time").value.trim();	
	if(title.length<1){
		alert("请填写实验步骤名称");
			return false;
		}
	if(start_time.length<1){
		alert("请选择实验开始时间");
			return false;
		}
	if(end_time.length<1){
		alert("请选择实验结束时间");
			return false;
		}
	}
</script>
<script  language="javascript" type="text/javascript" >
<!---循环开始-{section name=i loop=$data}---->	
function det{$data[i][1]}(){ 
  		
		 var pnumber=document.getElementById("{$data[i][1]}").value.trim();
	   
  		 if (confirm("是否删除！！！"))  {
				if(confirm("警告，删除将无法查看当前阶段的实验报告！！！")){
					location.href="exp_list.php?action=delete&&pace_id="+pnumber+"&&course_id={$course_id}";
				}else{
					return  false;
				}		 
		 }else{
			 return  false;
		 }		
}
<!---循环结束- {/section}---->		
</script>
</body>

</html>
