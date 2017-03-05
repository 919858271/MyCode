
//获得当前时间,刻度为一千分一秒

function showNowTime()
{
var now=new Date();
var year=now.getFullYear();
var month=now.getMonth()+1;
var day=now.getDate();
var hours=now.getHours();
var minutes=now.getMinutes();
var seconds=now.getSeconds();
if( hours>=10&&minutes>=10&&seconds>=10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 "+hours+"时"+minutes+"分"+seconds+"秒";
}

if( hours>=10&&minutes>=10&&seconds<10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 "+hours+"时"+minutes+"分0"+seconds+"秒";
}

if( hours>=10&&minutes<10&&seconds>=10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 "+hours+"时0"+minutes+"分"+seconds+"秒";
}

if( hours<10&&minutes>=10&&seconds>=10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 0"+hours+"时"+minutes+"分"+seconds+"秒";
}

if( hours>=10&&minutes<10&&seconds<10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 "+hours+"时0"+minutes+"分0"+seconds+"秒";
}
if( hours<10&&minutes>=10&&seconds<10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 0"+hours+"时"+minutes+"分0"+seconds+"秒";
}
if( hours<10&&minutes<10&&seconds>=10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 0"+hours+"时0"+minutes+"分"+seconds+"秒";
}
if( hours<10&&minutes<10&&seconds<10){
	document.all.nowTime.innerHTML=""+year+"年"+month+"月"+day+"日 0"+hours+"时0"+minutes+"分0"+seconds+"秒";
}

//一秒刷新一次显示时间
var timeID=setTimeout(showNowTime,1000);
}