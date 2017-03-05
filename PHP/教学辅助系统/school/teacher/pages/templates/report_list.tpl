<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="../../tools/css/bbs.min.css" type="text/css"/>
  
  <link href="../../tools/css/style1.css" rel="stylesheet" type="text/css" />
 
  <link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />
<link href="../../tools/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../tools/js/relTime.js"></script>
<script type="text/javascript" src="../../tools/js/tijiao.js"></script>
<script type="text/javascript" src="../../tools/js/jquery.js"></script>
 <script type="text/javascript"src="../../tools/js/jquery.min.js"></script>
<script type="text/javascript"src="../../tools/js/bbs.min.js"></script>
<script type="text/javascript" src="../../tools/js/select-ui.min.js"></script>
<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />	
	  <link rel="stylesheet" href="../../tools/css/bbs.min.css" type="text/css"/>
	<script type="text/javascript" src="../../tools/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../tools/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="../../tools/js/select-ui.min.js"></script>
	<script type="text/javascript" src="../../tools/editor/kindeditor.js"></script>

<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
});
</script>

</head>

 <body style="background-color:#F2F0F1; ">   
 <div class="xline"></div>
  <div class="mainindex" >   
    <div class="welinfo">
    <b style="margin-left:8px">
	<ul class="placeul3" style="margin-top:10px;margin-left:5px">
         <li><a href="exp_list.php?action=list&&pageNum=1&&course_id={$course_id}&&tab=1" title="点击返回实验进度列表">教学实验</a> {$mes}
		  
    </ul>
	</b>
    </div></div></div>
<table style="width:95%;">
<div class="nav3" style="width:95%;margin-left:20px">

<!---循环开始 未批阅的----->	
{section name=i loop=$data1}
<li> <a href="exp_list.php?action=report_detial&&pid={$data1[i][0]}&&sid={$data1[i][1]}&&course_id={$course_id}" ><img src="../../tools/images/student.png" /><h2>{$data1[i][2]}<br>{$data1[i][1]}</br></h2></a></li>
{/section}
 <!---循环结束- ---->
</div>		
 </table>
 <div class="xline" style="margin-top:60px"></div>
 <div class="xline"></div>
<div class="welinfo">
   
	<!----------已完成批改的------------------>
     <b style="margin-left:10px">已完成批阅的实验报告</b>
</div>	
<table style="width:95%;">
<div class="nav3" style="width:95%;margin-left:20px">

<!---循环开始----->	
{section name=i loop=$data2}
<li> <a href="exp_list.php?action=report_detial&&pid={$data2[i][0]}&&sid={$data2[i][1]}&&course_id={$course_id}" ><img src="../../tools/images/student.png" /><h2>{$data2[i][2]}<br>{$data2[i][1]}</br></h2></a></li>
{/section}
 <!---循环结束- ---->
</div>		
 </table>
</div> 

<!--[if lt IE 9]>
<script src="assets/js/jquery1.11.1.min.js"></script>
<script src="assets/js/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->

<!--<![endif]-->

</body>
</html>
