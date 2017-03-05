<?php
require_once "../../database/config.inc.php";

//分页链接样式
function sty($pageNum,$pageSum){
	if($pageNum==1){
		$sty0="disabled";
	}else{
		$sty0=null;
	}
	if($pageNum+1>$pageSum){
		$sty1="disabled";
	}else{
		$sty1=null;
	}
	if($pageNum+2>$pageSum){
		$sty2="disabled";
	}else{
		$sty2=null;
	}
	if($pageNum+3>$pageSum){
		$sty3="disabled";
	}else{
		$sty3=null;
	}
	if($pageNum+4>$pageSum){
		$sty4="disabled";
	}else{
		$sty4=null;
	}
	if($pageNum==$pageSum){
		$sty5="disabled";
	}else{
		$sty5=null;
	}
	$sty=array($sty0,$sty1,$sty2,$sty3,$sty4,$sty5);
	return $sty;
	
}
function sty2($pageNum,$pageSum){
	if($pageNum==1){
		$sty0="am-disabled";
	}else{
		$sty0=null;
	}
	if($pageNum+1>$pageSum){
		$sty1="am-disabled";
	}else{
		$sty1=null;
	}
	if($pageNum+2>$pageSum){
		$sty2="am-disabled";
	}else{
		$sty2=null;
	}
	if($pageNum+3>$pageSum){
		$sty3="am-disabled";
	}else{
		$sty3=null;
	}
	if($pageNum+4>$pageSum){
		$sty4="am-disabled";
	}else{
		$sty4=null;
	}
	if($pageNum==$pageSum){
		$sty5="am-disabled";
	}else{
		$sty5=null;
	}
	$sty=array($sty0,$sty1,$sty2,$sty3,$sty4,$sty5,"am-active");
	return $sty;

}
//分页起始符
function mark($pageNum,$pageSize){
	if($pageNum-1<=0){
		$left=1;
	}else{
		$left=$pageNum-1;
	}	
	$mark=($pageNum-1)*$pageSize;
	$data=array($mark,$left);
	return $data;
}
function upload($sql){	
	$isUp = db_update($sql);
	return $isUp;
}
?>