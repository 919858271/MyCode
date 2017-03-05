window.onload = function (){
				var url = window.location.href;
				var parent = window.parent;
				var length = parent.frames.length;
				var win = parent.frames["zhuti"];
				
				if(length > 0 && win != undefined){
					parent.location.href = url;
				}

				//document.getElementById("userName").focus();
			}
			function show(me)
			{
				if (count==0)
				{
					me.value="";
				}
			}
			function reloadcode()
			{
				var img=document.getElementById("Validation_Code");
				img.src=img.src+'?';
			}

			function keydown(me)
			{
				if (count==0)
				{
					me.value="";
					count=1;
					me.style.color="black";
				}
			}
			//-->
			function help(){
				 
				alert("如果无法登陆，请联系管理员")
				 //if (confirm("你同意吗？")) { 
				//	 alert("同意"); 
				//	 } else { 
				//	 alert("不同意"); 
				//	 } 

			}
			function about(){
				 
				alert("本系统版权所有 919858271@qq.com")
				 //if (confirm("你同意吗？")) { 
				//	 alert("同意"); 
				//	 } else { 
				//	 alert("不同意"); 
				//	 } 

			}
			
			function check() {
			    var formname=document.loginForm;
			   if (formname.userName.value.trim() == "") {
			     alert("请输入用户名！");
			     formname.userName.focus();
			     return false;
			 }
			 if (formname.passWord.value.trim() == "") {
			     alert("请输入密码！");
			     formname.passWord.focus();
			     return false;
			 }	
			 
			 formname.submit();
			 
			 
			}		
			//回车时，默认是登陆
			function on_enter(){
			if(window.event.keyCode == 13){
			if (document.all('Button')!=null){
			   document.all('Button').click();
			   }
			}
			}
