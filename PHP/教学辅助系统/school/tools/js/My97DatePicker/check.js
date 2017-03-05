	function yz(){
  		var time1=document.getElementById("time1").value;
  		var time2=document.getElementById("time2").value;
  		time1=time1.split("-");
  		time2=time2.split("-");
  		 if(time1<=time2)
  		 {	
  			 document.forms[0].submit();		 	
  		 }			 
  		 else{ 		
  			alert("^v^ 亲，起始时间不能超过结束结束时间！！！");
			document.getElementById("time1").value="";
  		 	return false;
  		 }
  	}
	
    
  	function change1(){ 
  		var time1=document.getElementById("time1").value;
  	    var time2=document.getElementById("time2").value;		
  		time1=time1.split("-");	
  		time2=time2.split("-");
  		 if(time1>time2)	
  			{ 
   			alert("^v^ 亲，起始时间不能超过结束结束时间！！！");
			document.getElementById("time1").value="";
   			return false;
  			}
  	}			 		 	
	function change2(){
		var time1=document.getElementById("time1").value;
	    var time2=document.getElementById("time2").value;
	    time1=time1.split("-");
	    time2=time2.split("-");
	    if(time1>time2)	
			 { 
			   alert("^v^ 亲，结束时间不能小于起始时间！！！");
			   document.getElementById("time2").value="";
			  return false;
			 }
			  	}		
  	