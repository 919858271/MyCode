

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
		 <li> <a href="#">课程管理</a></li>
		 <li> <a href="course.php?action=list&&pageNum=1&&id={$dept_id}">{$dept}</a></li>
		  <li> <a href="#">{$class}</a></li>
    </ul>
	</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 
		
			<div class="itab">
				<ul> 
				<li><a href="#tab1" class="selected ">课程列表</a></li> 
				<li><a href="#tab2">添加课程</a></li> 
				</ul>
			</div>    
			<div id="tab1" class="tabson">	
					<table  width="100%" border="1" align="center"  class="expinf tablelist">
						  <tr>
							<td><div align="center"><strong>课程编号</div></td>
							<td><div align="center"><strong>课程名称</div></td>
							<td><div align="center"><strong>授课教师</div></td>
							<td><div align="center"><strong>课程状态</div></td>
							<td><div align="center"><strong>操作</div></th>
						  </tr>
			  <!---循环开始-{section name=i loop=$data}---->
						  <tr>
							<td width="8%" align="center">{$data[i][0]}</td>
							<td width="28%" align="center">{$data[i][1]}</td>	
							<td width="28%" align="center">{$data[i][12]}</td>
							<td width="28%" align="center">
							<ul class="toolbar5" style="margin-left:10px">
									<li class="click">									 
										 <a href="course.php?action=close&&id={$dept_id}&&course={$data[i][11]}&&idf={$data[i][6]}&&class_id={$data[i][8]}" title="点击开启/关闭课程"><img src="{$data[i][5]}" /></a>  												
									</li>		
								</ul> 
							</td>									
						  <td width="16%" align="center">
								<ul class="toolbar5" style="margin-left:0px">
									<li class="click">
										<input name="idf" type="hidden" id="{$data[i][11]}" value="{$data[i][11]}" />
										<input name="c_id" type="hidden" id="{$data[i][8]}" value="{$data[i][8]}" />
										<input name="submit" type="image" src="../../tools/images/delete.png" title="点击删除" onclick="det{$data[i][11]}()"/></a></li>
												
									</li>
		
								</ul>  
							</td>					 
						  </tr>
			  <!---循环结束- {/section}---->
					</table>
				<ul class="am-pagination am-fr admin-content-pagination">
			  <li class="{$sty[0]}"><a href="course.php?action=course_list&&pageNum=1&&cid={$class_id}&&id={$dept_id}">首页</a></li>
              <li class="{$sty[0]}"><a href="course.php?action=course_list&&pageNum={$left}&&cid={$class_id}&&id={$dept_id}">&laquo;</a></li>
              <li class="{$sty[6]}"><a href="course.php?action=course_list&&pageNum={$pageNum}&&cid={$class_id}&&id={$dept_id}">{$pageNum}</a></li>
              <li class="{$sty[1]}"><a href="course.php?action=course_list&&pageNum={$pageNum+1}&&cid={$class_id}&&id={$dept_id}">{$pageNum+1}</a></li>
              <li class="{$sty[2]}"><a href="course.php?action=course_list&&pageNum={$pageNum+2}&&cid={$class_id}&&id={$dept_id}">{$pageNum+2}</a></li>
              <li class="{$sty[3]}"><a href="course.php?action=course_list&&pageNum={$pageNum+3}&&cid={$class_id}&&id={$dept_id}">{$pageNum+3}</a></li>
              <li class="{$sty[4]}"><a href="course.php?action=course_list&&pageNum={$pageNum+4}&&cid={$class_id}&&id={$dept_id}">{$pageNum+4}</a></li>
              <li class="{$sty[1]}"><a href="course.php?action=course_list&&pageNum={$pageNum+1}&&cid={$class_id}&&id={$dept_id}">&raquo;</a></li>
			  <li class="{$sty[5]}"><a href="course.php?action=course_list&&pageNum={$last}&&cid={$class_id}&&id={$dept_id}">最后页</a></li>
            </ul> 
				
			</div>
        </div> 	

			<div id="tab2" class="tabson">  
			<ul class="forminfo">
			<form id="add_form" name="add_form" method="post" action="course.php?action=add">
				<input name="dept_id" id="dept_id" type="hidden" class="dfinput" value="{$dept_id}" />
				<input name="class_name" id="class_name" type="hidden" class="dfinput" value="{$class}" />
				<input name="class_id" id="class_id" type="hidden" class="dfinput" value="{$class_id}" />
				<li><label style="width :100px"><b >课  程  编  号</b></label>
						<input name="c_number" id="c_number" type="text" class="dfinput" value="" title="请填写课程编号" style="width:418px;"/>
						
				</li>
				<li><label style="width :100px"><b>课  程  名  称</b></label>
						<input name="c_name" id="c_name" type="text" class="dfinput" value="" title="请填写课程名称" style="width:418px;"/>					
				</li>
				<li><label style="width :100px"><b>授课教师、学期</b></label>
				<div class="vocation">					
					<select class="select1" name="teacher" id="teacher">
						<option name="pace_name1" value="" selected="selected" class="dfinput">请选择授课教师</option>
						<!--------开始循环------------->
						{section name=i loop=$data1}
						<option name="pace_name1" value="{$data1[i][1]}+{$data1[i][0]}"  class="dfinput">{$data1[i][0]}</option>
						{/section}
						<!----------循环结束------------>
						</select>
					</div>&nbsp;
					<div class="vocation" style="margin-left:10px">					
					<select class="select1" name="term" id="term">
						<option name="pace_name1" value="" selected="selected" class="dfinput">请选择授课学期</option>
						<option name="pace_name1" value="1"  class="dfinput">第一学期</option>
						<option name="pace_name1" value="2"  class="dfinput">第二学期</option>
						</select>
					</div>&nbsp;
					</li>
				<li><label>&nbsp;</label><input name="add" id="add" type="submit" class="btn1" value="马上添加"/></li>
		</form>
			</ul>    
		</div>    
</body>

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
	var c_num=document.getElementById("c_number").value.trim();
	var c_name=document.getElementById("c_name").value.trim();
	var teacher=document.getElementById("teacher").value.trim();
	var term=document.getElementById("term").value.trim();
		
		if(c_num.length<8){
			alert("课程编号不小于8位字符");
				return false;
			}
		if(c_name.length<1){
			alert("请输入课程名称");
			return false;
		}
		if(teacher.length<1){
			alert("请选择授课教师");
			return false;
		}
		if(term.length<1){
			alert("请选择授课学期");
			return false;
		}
	}
</script>
<script  language="javascript" type="text/javascript" >
<!---循环开始-{section name=i loop=$data}---->	
function det{$data[i][11]}(){   		
		 var idf=document.getElementById("{$data[i][11]}").value.trim();
		  var class_id=document.getElementById("{$data[i][8]}").value.trim();
  		 if (confirm("是否删除！！！"))  {
				if(confirm("请再次确认，是否删除！！！")){
					location.href="course.php?action=delete&&id="+idf+"&&dept_id="+{$dept_id}+"&&cid="+class_id;
				}else{
					return  false;
				}		 
		 }else{
			 return  false;
		 }		
}
<!---循环结束- {/section}---->		
</script>

</html>
