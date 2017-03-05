<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../tools/js/jquery.js"></script>
<script type="text/javascript" src="../../tools/js/tijiao.js"></script>
<link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />
	  <link rel="stylesheet" href="../../tools/css/bbs.min.css" type="text/css"/>
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
			width : 180			  
		});
	});
	</script>
</head>


<body style="background-color:#F2F0F1; ">
<div class="xline"></div>
 <div class="mainindex" >   
		<div class="welinfo">
			<b style="margin-left:8px">
				<ul class="placeul3" style="margin-top:12px;margin-left:5px">
				 <li><a href="exp_list.php?action=list&&pageNum=1&&course_id={$course_id}&&tab=1" >教学实验</a></li>
				 <li> <a href="exp_list.php?action=report&&course_id={$course_id}&&paceNum={$pace_id}" title="点击返回当前阶段实验报告列表">实验报告管理</a> </li>	 
			   </ul>
			</b>
		</div>
</div>
	<table width="80%" border="1" align="center" class="tableinf tablelist" >
      <tr>
        <td width="17%" scope="row"><div align="center"><strong>实验课程</strong></div></td>
        <td width="41%"><span class="STYLE1">{$c_name}</span></td>
        <td width="19%"><div align="center"><strong>当前实验阶段</strong></div></td>
        <td width="23%"><div align="center"><p class="STYLE1">{$p_name}</p></div></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>提交时间</strong></div></td>
        <td><span class="STYLE1">{$data[0][7]}</span></td>
        <td><div align="center"><strong>批阅状态</strong></div></td>
        <td><div align="center"> {$data[0][10]}&nbsp;</div></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>小结标题</strong></div></td>
        <td colspan="3"><span class="STYLE1">{$data[0][5]}</span></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>实验心得</strong></div></td>
        <td colspan="3">{$data[0][6]}
        
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>实验报告</strong></div></td>
        <td colspan="3"><a href="download.php?action=2&&id={$data[0][0]}" >{$data[0][8]}&nbsp;(点击下载实验报告)</a></td>
      </tr>
    </table>
	<div class="xline"></div>
    </div>
	
	<ul class="forminfo" style="margin-top:10px">
			<form id="publish_form" name="publish_form" method="post" action="exp_list.php?action=marking&&course_id={$course_id}&&s_id={$s_id}">
			<input name="pace_id" id="pace_id" type="hidden"  value="{$data[0][0]}" />
				<li><label style="width:130px"><b>请评价当前实验报告:</b></label>		
					<div class="vocation" style="margin-left:8px">
					<select class="select1" name="mark" id="mark">
						<option value="">---请选择评价等级---</option>
						<option value="优">优</option>
						<option value="良">良</option>
						<option value="中">中</option>
						<option value="及格">及格</option>
						<option value="不及格">不及格</option>
					</select>
					</div>&nbsp;&nbsp;&nbsp;<b style="margin-left:30px">评语:	</b>
					<input name="content" id="content" type="text" class="dfinput" value="" title="100个字符以内" style="width:518px;margin-left:5px"/>
					<input name="check" id="check" type="submit" class="btn1" value="马上评价" style="margin-left:20px"/>
				</li>	   	
		</form>
			</ul>    
</body>
</html>
<script type="text/javascript">
	var send=document.getElementById("check");
	send.onclick=function(){
	var mark=document.getElementById("mark").value.trim();	
	var content=document.getElementById("content").value.trim();	
		if(mark.length<1){
			alert("请选择评价等级");
				return false;
			}
		if(content.length<5){
			alert("评价内容不小于5个字符");
				return false;
			}
		if (confirm("请务必下载实验报后，再提交，如未下载，请取消！"))  {
				 return true;
		 }else{
			 return  false;
		 }		
	}
</script> 