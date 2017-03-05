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
{literal}
<style type="text/css">
<!--
.STYLE1 {color: #000000
}
-->
</style>
{/literal}
</head>


<body style="background-color:#F2F0F1; ">

   <div class="mainindex">   
    <div class="welinfo">
    <b style="margin-left:8px">
	<ul class="placeul3" style="margin-top:10px">
         <li><a href="../main.php" target="_parent">首页</a></li>
		 <li> <a href="notice.php?action=list&&pageNum=1">公告通知管理</a></li>
		 <li> <a href="#">{$data[0][0]}</a></li>
    </ul>
	</b>
    </div>
	<table width="80%" border="1" align="center" class="tableinf tablelist" >
      <tr>
        <td width="20%" scope="row"><div align="center"><strong>通知公告标题</strong></div></td>
        <td width="80%"><span class="STYLE1">{$data[0][0]}</span></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>发布时间时间</strong></div></td>
        <td><span class="STYLE1">{$data[0][1]}</span></td>   
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>通知公告内容</strong></div></td>
        <td colspan="3"><span class="STYLE1">{$data[0][2]}</span></td>
      </tr>
    </table>
	<div class="xline"></div>
    </div>
    
    
    

</body>

</html>
