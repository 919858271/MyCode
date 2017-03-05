

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
			id : 'detial',
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
		 <li> <a href="#">公告通知管理</a></li>
    </ul>
	</b>
    </div>
    <div class="formbody">
		<div id="usual1" class="usual"> 	
			<div class="itab">
				<ul> 
				<li><a href="#tab1" class="selected ">通知公告列表</a></li> 
				<li><a href="#tab2">发布通知公告</a></li> 
				</ul>
			</div>    
			<div id="tab1" class="tabson">	
					<table  width="100%" border="1" align="center"  class="expinf tablelist">
						  <tr>
							<th><div align="center">通知公告标题</div></th>
							<th><div align="center">发布时间</div></th>
							<th><div align="center">公告内容</div></th>							
							<th><div align="center">操     作</div></th>
						  </tr>
			  <!---循环开始----->{section name=i loop=$data}
						  <tr>
							<td width="28%"><div style="margin-left:15px">{$data[i][1]}</div></td>
							<td width="26%" align="center">{$data[i][3]}</td>
							<td width="9%" align="center">
							<ul class="toolbar3" style="margin-left:45px">
									<li class="click">
										 <a href="notice.php?action=detial_list&&id={$data[i][0]}" title="点击查看内容"><span>
										 <img src="../../tools/images/detial.png" /></span></a>  												
									</li>		
								</ul> 							
							</td>
							
							 <td width="11%" align="center">
								<ul class="toolbar5">
								<li class="click"><span>
								<input name="n_id" type="hidden" id="{$data[i][0]}" value="{$data[i][0]}" />
								<input name="submit" type="image" src="../../tools/images/delete.png" title="点击删除" onclick="det{$data[i][0]}()"/></a></li>
								
								
								</ul> 
							 </td>
						  </tr>
						  {/section}
			  <!---循环结束- ---->
					</table>
				<ul class="am-pagination am-fr admin-content-pagination">
			  <li class="{$sty[0]}"><a href="notice.php?pageNum=1&&action=list">首页</a></li>
              <li class="{$sty[0]}"><a href="notice.php?pageNum={$left}&&action=list">&laquo;</a></li>
              <li class="{$sty[6]}"><a href="notice.php?pageNum={$pageNum}&&action=list">{$pageNum}</a></li>
              <li class="{$sty[1]}"><a href="notice.php?pageNum={$pageNum+1}&&action=list">{$pageNum+1}</a></li>
              <li class="{$sty[2]}"><a href="notice.php?pageNum={$pageNum+2}&&action=list">{$pageNum+2}</a></li>
              <li class="{$sty[3]}"><a href="notice.php?pageNum={$pageNum+3}&&action=list">{$pageNum+3}</a></li>
              <li class="{$sty[4]}"><a href="notice.php?pageNum={$pageNum+4}&&action=list">{$pageNum+4}</a></li>
              <li class="{$sty[1]}"><a href="notice.php?pageNum={$pageNum+1}&&action=list">&raquo;</a></li>
			  <li class="{$sty[5]}"><a href="notice.php?pageNum={$last}&&action=list">最后页</a></li>
            </ul> 
				
			</div>
        </div> 	 
		<div id="tab2" class="tabson">  
			<ul class="forminfo">
			<form id="add_form" name="add_form" method="post" action="notice.php?action=add">
				<li><label><b>通知公告标题</b></label>
						<input name="title" id="title" type="text" class="dfinput" value=""  style="width:418px;"/>					
				</li>
				<li><label><b>通知公告内容</b></label>
				   <textarea id="detial" name="detial" style="width:700px;height:250px;"></textarea>   
				</li>				
				<li><label>&nbsp;</label><input name="add" id="add" type="submit" class="btn1" value="马上发布"/></li>
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
	var title=document.getElementById("title").value.trim();
		if(title.length<1){
			alert("请填写通知公告标题");
				return false;
			}
	}
</script>
<script  language="javascript" type="text/javascript" >
<!---循环开始-{section name=i loop=$data}---->	
function det{$data[i][0]}(){  		
		 var n_id=document.getElementById("{$data[i][0]}").value.trim();
  		 if (confirm("是否删除！！！"))  {
				if(confirm("请再次确认，是否删除！！！")){
					location.href="notice.php?action=delete&&id="+n_id;
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
