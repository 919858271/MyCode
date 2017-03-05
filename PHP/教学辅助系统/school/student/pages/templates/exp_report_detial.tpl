<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../tools/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../tools/js/jquery.js"></script>
<script type="text/javascript" src="../../tools/js/tijiao.js"></script>

</head>
<body style="background-color:#F2F0F1; ">
<div class="xline"></div>
    <div class="mainindex">   
    <div class="welinfo">
    <span style="margin-left:15px;margin-top:6px;cursor:pointer;"><img src="../../tools/images/back.png"  title="点击返回实验列表" onclick="back()"/></span>
    <b style="margin-left:10px">实验报告查看</b>
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
        <td><div align="center"> {$data[0][10]}&nbsp;<strong>{$data[0][11]}</div></td>
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
        <td colspan="3"><a href="download.php?action=2&&id={$data[0][0]}" >{$data[0][8]}&nbsp;{$mes2}</a></td>
      </tr>
	  <tr>
        <td scope="row"><div align="center"><strong>评语</strong></div></td>
        <td colspan="3">{$data[0][12]}
        
      </tr>
    </table>
	<div class="xline"></div>
    </div>
    
    
    

</body>

</html>
