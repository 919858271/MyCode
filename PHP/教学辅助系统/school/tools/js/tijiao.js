function yz() {
	 var formname=document.form1;
	   if (formname.del.value.trim() == "") {
	     alert("请填写试验进度！");
	     formname.del.focus();
	     return false;
	 }
	 if (formname.del.value.trim().length<30) {
	     alert("进度内容不少于30个字符！");
	     formname.passWord.focus();
	     return false;
	 }	 
	 formname.submit();
}

function fileUp() {
	 alert("123");
}


function xg() {
	 var formname=document.xg_form;
	   if (formname.old_pass.value.trim() == "") {
	     alert("请输入旧密码");
	     formname.old_pass.focus();
	     return false;
	 }
	 if (formname.new_pass.value.trim()=="") {
	      alert("请输入新密码");
	     formname.new_pass.focus();
	     return false;
	 }
	 if (formname.new_pass.value.trim().length<6) {
	      alert("密码长度不小于6位");
		  formname.new_pass.value="";
	     formname.new_pass.focus();
	     return false;
	 }	
	 if(formname.new_pass.value.trim()==formname.old_pass.value.trim()){
		  alert("新旧密码不能一样");
	     return false;
	 }
	 if (formname.conf_pass.value.trim()=="") {
	      alert("请输入确认密码");
	     formname.conf_pass.focus();
	     return false;
	 }	
	 if(formname.new_pass.value.trim()!=formname.conf_pass.value.trim()){
		  alert("两次新密码输入不一致");
		  formname.conf_pass.value="";
		   formname.conf_pass.focus();
	     return false;
	 }
	 formname.submit();
}


function question() {
	 var formname=document.question_form;
	   if (formname.course_name.value.trim() == "请选择") {
	     alert("请选择课程或实验");
	     return false;
	 }
	 if (formname.question_name.value.trim()=="请填写"||formname.question_name.value.trim()==" ") {
	     alert("请填写问题名称！");
	     formname.question_name.focus();
	     return false;
	 }else if(formname.question_name.value.trim().length<6){
		 alert("问题名称过短，请重新填写！");
	     formname.question_name.focus();
	     return false;
		 
	 }
	 
	 if (formname.question_del.value.trim()=="不能少于50个字符"||formname.question_del.value.trim()=="") {
	     alert("请填写问题内容！");
	     formname.question_del.focus();
	     return false;
	 }else if(formname.question_del.value.trim().length<25){
		 alert("问题内容不少于25个字符，请重新填写！");
	     formname.question_del.focus();
	     return false;
		 
	 }
	 if (formname.sub.value.trim()=="提交问题") {
		 if (confirm("是否提交,请仔细检查！！！"))  {  
			 formname.submit();
		 }
	 }
	
	
}
function enter() {
	 var formname=document.course_form;
	 
	   if (formname.course_name.value.trim() == "请选择需要进入的课程") {
	     alert("请选择需要进入的课程");
	     return false;
	 }
	 if (formname.sub.value.trim()=="进   入") {
		 if (confirm("是否进入！！！"))  {  
			var id=formname.course_name.value.trim()
			 location.href="main.php?id="+id;
		 }
	 }
	
	
}
function det() {
	 var snumber=document.getElementById("snumber").value.trim();
	 var classnumber=document.getElementById("classnumber").value.trim();	
		 if (confirm("是否删除！！！"))  {  		
			 location.href="student.php?action=delete&&id="+snumber+"&&classid="+classnumber;
		 }else{
			 return  false;
		 }			
}


function rep() {
	 var formname=document.rep_form;
	 
	   if (formname.rep_content.value.trim() == "") {
	     formname.rep_content.focus();
	     return false;
	 }
	 if (formname.rep_content.value.trim().length<10) {
		 alert("回复内容太少，请重新填写");
		  return false;	 
	 }
	 if(formname.btn2.value.trim()=="回复"){
		 if (confirm("本平台为教学交流平台，请注意回复内容"))  {  
			 formname.submit();
		 }else{
			 formname.rep_content.value="";
			 formname.rep_content.focus();
		 }
		 
	 }
	
	
}
function back() {
	history.back();
}	