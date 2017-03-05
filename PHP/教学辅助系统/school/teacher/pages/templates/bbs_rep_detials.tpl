<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="../../tools/css/style2.css" rel="stylesheet" type="text/css" />
 
	<link href="../../tools/css/select.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../../tools/css/bbs.min.css" type="text/css"/>
	  
	<link href="../../tools/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../tools/js/tijiao.js"></script>
	<script type="text/javascript" src="../../tools/js/jquery.js"></script>
	
	<script type="text/javascript" src="../../tools/js/jquery.idTabs.min.js"></script>
	<script type="text/javascript" src="../../tools/js/select-ui.min.js"></script>
	<script type="text/javascript" src="../../tools/editor/kindeditor.js"></script>
	
	<script type="text/javascript"src="../../tools/js/jquery.min.js"></script>
     <script type="text/javascript"src="../../tools/js/bbs.min.js"></script>
{literal}
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
});
</script>
<script language="javascript">
	function clearContent()
	{
		document.getElementById("del").value="";
	}

  </script>
<style type="text/css">
<!--
.STYLE3 {
	font-size: 12px;
	color: #00CCFF;
}
.STYLE4 {color: #FF0000}
.STYLE5 {font-size: 14px}
-->
</style>
{/literal}
</head>
<div class="xline"></div>
<body style="background-color:#F2F0F1; ">
	<div class="welinfo">
		<span style="margin-left:15px;margin-top:6px;cursor:pointer;"><a href="bbs_list.php?action=list&&pageNum=1&&tnumber={$tnumber}&&course_id={$course_id}"><img src="../../tools/images/back.png"  title="点击主题列表" /></a></span>
		<b style="margin-left:10px">主题回复</b>
</div>
	
	
		<div class="formbody">
	<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#0066FF">
	  <!--DWLayoutTable-->
	  
	  
	  
	  
	  <tr>
		<td width="274" height="28" valign="top"><strong><div style="margin-left:10px;margin-top:5px">{$ques[0][4]}</div></strong></td>
		<td width="967" valign="top"><div class="STYLE4" style="margin-left:10px">【{$ques[0][1]}】&nbsp; {$ques[0][2]}</div></td>
      </tr>
	  <tr>
		<td height="21" valign="top" bgcolor="F2F0F1"><div align="center">{$ques[0][11]}</div></td>
		<td rowspan="2" valign="top" bgcolor="F2F0F1">
		  <p>{$ques[0][3]}</p>
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		  <p>&nbsp;</p><p>&nbsp;</p>
		  <p>
			<!-------回复框------->
				
		{literal} <!--(am-in设置打开状态)-->
          <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-zhuti'}" style="width:64px">
		  <input name="" type="button" class="btn3" value="回复主题"/>
		  </div>
		 {/literal}
		 <div id="collapse-panel-zhuti" class="am-panel-bd am-collapse">
            <ul class="am-list admin-content-task">			     
					<li style="width:895px;margin-left:30px;height:30px">  	
						<form id="rep_form" name="rep_form" method="post" action="bbs_list.php?action=rep&&tnumber={$tnumber}&&course_id={$course_id}">
						<input type="hidden" id="que_id" name="que_id" value="{$ques[0][0]}">
						<input type="hidden" id="user" name="user" value="">
						<input type="hidden" id="que_content" name="que_content" value="">						
						<input type="text" style="width:790px;height:30px" id="rep_content" name="rep_content">
						<input name="btn2" id="btn2" type="submit" class="btn4" value="回复" />
					  </form>
					</li>
             
            </ul>
          </div>
		  <!-------回复框------>
		  </p>
	    </td>
      </tr>  
	  <tr>
		<td height="176" valign="top" bgcolor="F2F0F1"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
	  <tr>
	    <td height="27" valign="top" bgcolor="BCD0ED"><div align="center">{$ques[0][5]}&nbsp;&nbsp;1楼</div></td>
		<td valign="top" bgcolor="BCD0ED"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
	   <!---循环开始-{section name=i loop=$data}---->
	  <tr>
	    <td height="32" valign="top" bgcolor="F2F0F1"><strong>	      <div style="margin-left:10px;margin-top:5px">{$data[i][3]}</strong></div></td>
	  <td rowspan="3" valign="top" bgcolor="F2F0F1"><span class="STYLE3" style="margin-top:10px;margin-left:5px"><span class="STYLE5">{$data[i][7]}
	    </span>
	    <!----此处填写二级回复------></span>
	    <p style="margin-top:5px;margin-left:5px">{$data[i][2]}</p>			
		<p>&nbsp;</p>
		<p>&nbsp;</p><p>&nbsp;</p>
		<!--------回复框--------->
		<p>
				{literal} <!--(am-in设置打开状态)-->
        <div class="am-panel-hd am-cf" data-am-collapse="{target:  {/literal}'#collapse-panel-{$data[i][0]}'}" style="width:64px">
		  <input name="" type="button" class="btn3" value="回复此楼"/>
	    </div>	
		 <div id="collapse-panel-{$data[i][0]}" class="am-panel-bd am-collapse">
            <ul class="am-list admin-content-task">			     
					<li style="width:895px;margin-left:30px;height:30px">  	
						<form id="rep_form" name="rep_form" method="post" action="bbs_list.php?action=rep&&tnumber={$tnumber}&&course_id={$course_id}">
						<input type="hidden" id="que_id" name="que_id" value="{$ques[0][0]}">
						<input type="hidden" id="user" name="user" value="{$data[i][3]}">
						<input type="hidden" id="que_content" name="que_content" value="{$data[i][2]}">						
						<input type="text" style="width:790px;height:30px" id="rep_content" name="rep_content">
						<input name="btn2" id="btn2" type="submit" class="btn4" value="回复" />
					  </form>
					</li>
            </ul>
        </div>
		  </p>
		<!-----------------回复框------->		</td>
      </tr>
	  <tr>
	    <td height="23" valign="top" bgcolor="F2F0F1"><div align="center">{$data[i][4]}</div></td>
      </tr>
	  <tr>
	    <td height="119" valign="top" bgcolor="F2F0F1"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
	  <tr>
	    <td height="25" valign="top" bgcolor="BCD0ED"><div align="center">{$data[i][5]}&nbsp; {$data[i][6]}楼</div></td>
		
		<td bgcolor="BCD0ED">&nbsp;</td>
	  </tr>
	  
	  	  
	  
	
	  
	   <!---循环结束- {/section}---->
	</table>
		<div style="margin-right:5px">
			   <ul class="am-pagination am-fr admin-content-pagination" >
				  <li class="{$sty[0]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum=1&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">首页</a></li>
				  <li class="{$sty[0]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$left}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">&laquo;</a></li>
				  <li class="am-active"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$pageNum}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">{$pageNum}</a></li>
				  <li class="{$sty[1]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$pageNum+1}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">{$pageNum+1}</a></li>
				  <li class="{$sty[2]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$pageNum+2}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">{$pageNum+2}</a></li>
				  <li class="{$sty[3]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$pageNum+3}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">{$pageNum+3}</a></li>
				  <li class="{$sty[4]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$pageNum+4}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">{$pageNum+4}</a></li>
				  <li class="{$sty[1]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$pageNum+1}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">&raquo;</a></li>
				  <li class="{$sty[5]}"><a href="bbs_list.php?action=detial&&id={$id}&&pageNum={$last}&&idf=0&&tnumber={$tnumber}&&course_id={$course_id}">最后页</a></li>
		  </ul>
		  </div>
</div>
        </div>
      </div>
    </div>
  </div>
    <!-------回复结束------->
 </td>
  </tr>
</table>
       



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
