<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../tools/js/jquery.js"></script>
<script type="text/javascript" src="../../tools/js/tijiao.js"></script>

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
<div class="xline"></div>
    <div class="mainindex">   
    <div class="welinfo">
    <span style="margin-left:15px;margin-top:6px;cursor:pointer;"><img src="../../tools/images/back.png"  title="点击返回实验列表" onclick="back()"/></span>
    <b style="margin-left:10px">实验任务查看</b>
    </div>   
	<table width="80%" border="1" align="center" class="tableinf tablelist" >
      <tr>
        <td width="17%" scope="row"><div align="center"><strong>实验名称</strong></div></td>
        <td width="41%"><span class="STYLE1">{$c_name}</span></td>
        <td width="19%"><div align="center"><strong>实验阶段</strong></div></td>
        <td width="23%"><div align="center"><p class="STYLE1">{$data[0][2]}</p></div></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>实验时间</strong></div></td>
        <td><span class="STYLE1">{$data[0][3]}</span></td>
        <td><div align="center"><strong>结束时间</strong></div></td>
        <td><div align="center"><p class="STYLE1">{$data[0][4]}</div></p></td>
      </tr>
      <tr>
        <td scope="row"><div align="center"><strong>实验任务</strong></div></td>
        <td colspan="3"><p class="STYLE1">{$data[0][5]}</p>
       </td>
      </tr>
      
    </table>
	<div class="xline"></div>
    </div>
    
    
    

</body>

</html>
