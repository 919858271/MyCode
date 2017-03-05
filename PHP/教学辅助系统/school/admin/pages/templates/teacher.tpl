

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
			width : 470			  
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
		 <li> <a href="#">教师管理</a></li>
		 <li> <a href="#">{$dept}</a></li>
    </ul>
	</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 
		
			<div class="itab">
				<ul> 
				<li><a href="#tab1" class="selected ">教师列表</a></li> 
				<li><a href="#tab2">添加教师</a></li> 
				</ul>
			</div>    
			<div id="tab1" class="tabson">	
					<table  width="100%" border="1" align="center"  class="expinf tablelist">
						  <tr>
							<td><div align="center"><strong>教师编号</div></td>
							<td><div align="center"><strong>教师姓名</div></td>
							<td><div align="center"><strong>教师性别</div></td>
							
							<td><div align="center"><strong>操     作</div></td>
						  </tr>
			  <!---循环开始-{section name=i loop=$data}---->
						  <tr>
							<td width="8%" align="center">{$data[i][0]}</td>
							<td width="46%" align="center">{$data[i][1]}</td>
							<td width="9%" align="center">{$data[i][3]}</td>
							
							 <td width="11%" align="center">
								<ul class="toolbar5">
								<li class="click"><span>
								<input name="snumber" type="hidden" id="{$data[i][0]}" value="{$data[i][0]}" />
								<input name="classnumber" type="hidden" id="{$dept_id}" value="{$dept_id}" />
								<input name="submit" type="image" src="../../tools/images/delete.png" title="点击删除" onclick="det{$data[i][0]}()"/></a></li>
								
								
								</ul> 
							 </td>
						  </tr>
			  <!---循环结束- {/section}---->
					</table>
				<ul class="am-pagination am-fr admin-content-pagination">
			  <li class="{$sty[0]}"><a href="teacher.php?pageNum=1&&action=list&&id={$dept_id}">首页</a></li>
              <li class="{$sty[0]}"><a href="teacher.php?pageNum={$left}&&action=list&&id={$dept_id}">&laquo;</a></li>
              <li class="{$sty[6]}"><a href="teacher.php?pageNum={$pageNum}&&action=list&&id={$dept_id}">{$pageNum}</a></li>
              <li class="{$sty[1]}"><a href="teacher.php?pageNum={$pageNum+1}&&action=list&&id={$dept_id}">{$pageNum+1}</a></li>
              <li class="{$sty[2]}"><a href="teacher.php?pageNum={$pageNum+2}&&action=list&&id={$dept_id}">{$pageNum+2}</a></li>
              <li class="{$sty[3]}"><a href="teacher.php?pageNum={$pageNum+3}&&action=list&&id={$dept_id}">{$pageNum+3}</a></li>
              <li class="{$sty[4]}"><a href="teacher.php?pageNum={$pageNum+4}&&action=list&&id={$dept_id}">{$pageNum+4}</a></li>
              <li class="{$sty[1]}"><a href="teacher.php?pageNum={$pageNum+1}&&action=list&&id={$dept_id}">&raquo;</a></li>
			  <li class="{$sty[5]}"><a href="teacher.php?pageNum={$last}&&action=list&&id={$dept_id}">最后页</a></li>
            </ul> 
				
			</div>
        </div> 	 
		<div id="tab2" class="tabson">  
			<ul class="forminfo">
			<form id="add_form" name="add_form" method="post" action="teacher.php?action=add">
				<input name="dept_id" id="dept_id" type="hidden" class="dfinput" value="{$dept_id}"  />
				<li><label style="width:150px"><b>教师编号、教师姓名</b></label>
						<input name="t_number" id="t_number" type="text" class="dfinput" value="" title="教师编号" style="width:218px;"/>
						&nbsp;&nbsp;<input name="t_name" id="t_name" type="text" class="dfinput" value="" title="教师姓名" style="width:218px;"/>
				</li>
				<li><label><b style="margin-left:25px">教师性别</b></label>						
					<div class="vocation" style="margin-left:65px">
						<select class="select1" name="t_sex" id="t_sex">
						<option name="pace_name1" value="" selected="selected" class="dfinput">---请选择性别---</option>
						<option name="pace_name1" value="男"  class="dfinput">男</option>
						<option name="pace_name1" value="女"  class="dfinput">女</option>
						</select>
					</div>
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
	var t_num=document.getElementById("t_number").value.trim();
	var t_name=document.getElementById("t_name").value.trim();
	var t_class=document.getElementById("t_class").value.trim();
	var t_sex=document.getElementById("t_sex").value.trim();
		if(t_num.length<5){
			alert("请输入正确的教师编号！！！");
				return false;
			}
		if(t_name.length<1){
			alert("请输入教师姓名！！！");
			return false;
		}
		if(t_class.length<1){
			alert("请选择授课班级！！！");
			return false;
		}
		if(t_sex.length<1){
			alert("请选择性别！！！");
			return false;
		}
	}
</script>
<script  language="javascript" type="text/javascript" >
<!---循环开始-{section name=i loop=$data}---->	
function det{$data[i][0]}(){ 
  		
		 var tnumber=document.getElementById("{$data[i][0]}").value.trim();
	     var dept_id=document.getElementById("{$dept_id}").value.trim();
  		 if (confirm("是否删除！！！"))  {
				if(confirm("请再次确认，是否删除！！！")){
					location.href="teacher.php?action=delete&&id="+tnumber+"&&dept_id="+dept_id;
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
