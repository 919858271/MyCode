

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
			width : 473			  
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
		 <li> <a href="#">{$dept}</a></li>
    </ul>
	</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 
		
			<div class="itab">
				<ul> 
				<li><a href="#tab1" class="selected ">班级列表</a></li> 
				</ul>
			</div>    
			<div id="tab1" class="tabson">	
					<table  width="100%" border="1" align="center"  class="expinf tablelist">
						  <tr>
							<td><div align="center"><strong>班级编号</div></td>
							<td><div align="center"><strong>班级名称</div></td>
							<td><div align="center"><strong>班级课程信息</div></td>
						  </tr>
			  <!---循环开始-{section name=i loop=$data}---->
						  <tr>
							<td width="8%" align="center">{$data[i][0]}</td>
							<td width="38%" align="center">{$data[i][1]}</td>												
						  <td width="16%" >
								<ul class="toolbar3" style="margin-left:127px">
									<li class="click">
										 <a href="course.php?action=course_list&&pageNum=1&&id={$dept_id}&&cid={$data[i][0]}" title="点击查看班级课程"><span>
										 <img src="../../tools/images/detial.png" /></span></a>  
												
									</li>
		
								</ul>  
							</td>					 
						  </tr>
			  <!---循环结束- {/section}---->
					</table>
				<ul class="am-pagination am-fr admin-content-pagination">
			  <li class="{$sty[0]}"><a href="dept.php?pageNum=1&&action=list&&id={$dept_id}">首页</a></li>
              <li class="{$sty[0]}"><a href="dept.php?pageNum={$left}&&action=list&&id={$dept_id}">&laquo;</a></li>
              <li class="{$sty[6]}"><a href="dept.php?pageNum={$pageNum}&&action=list&&id={$dept_id}">{$pageNum}</a></li>
              <li class="{$sty[1]}"><a href="dept.php?pageNum={$pageNum+1}&&action=list&&id={$dept_id}">{$pageNum+1}</a></li>
              <li class="{$sty[2]}"><a href="dept.php?pageNum={$pageNum+2}&&action=list&&id={$dept_id}">{$pageNum+2}</a></li>
              <li class="{$sty[3]}"><a href="dept.php?pageNum={$pageNum+3}&&action=list&&id={$dept_id}">{$pageNum+3}</a></li>
              <li class="{$sty[4]}"><a href="dept.php?pageNum={$pageNum+4}&&action=list&&id={$dept_id}">{$pageNum+4}</a></li>
              <li class="{$sty[1]}"><a href="dept.php?pageNum={$pageNum+1}&&action=list&&id={$dept_id}">&raquo;</a></li>
			  <li class="{$sty[5]}"><a href="dept.php?pageNum={$last}&&action=list&&id={$dept_id}">最后页</a></li>
            </ul> 
				
			</div>
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
		if(c_num.length<8){
			alert("班级编号不小于8位字符");
				return false;
			}
		if(c_name.length<1){
			alert("请输入班级名称");
			return false;
		}
	}
</script>
<script  language="javascript" type="text/javascript" >
<!---循环开始-{section name=i loop=$data}---->	
function det{$data[i][0]}(){ 
  		
		 var snumber=document.getElementById("{$data[i][0]}").value.trim();
	     var classnumber=document.getElementById("{$data[i][5]}").value.trim();
  		 if (confirm("是否删除！！！"))  {
				if(confirm("请再次确认，是否删除！！！")){
					location.href="student.php?action=delete&&id="+snumber+"&&classid="+classnumber;
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
