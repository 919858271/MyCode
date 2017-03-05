<?php
/////////////////////////////////////////
function db_connect(){
    global $cnn;
    $cnn = (DB_PCONNECT? mysql_pconnect(DB_HOST, DB_USERNAME, DB_PASSWORD):
        mysql_connect(DB_HOST, DB_USERNAME, DB_PASSWORD)) ;
      if (! $cnn) {
		die('连接数据库失败！错误号为：' . mysql_errno() . '。失败原因：' . iconv("GB2312","UTF-8",mysql_error()));
		}
    $db=mysql_select_db(DB_NAME, $cnn) ;
	if (!$db) {
	die('错误号为：' . mysql_errno() . '。失败原因：' . iconv("GB2312","UTF-8",mysql_error()));
    }
	mysql_query("set names utf8"); 
}

function db_close(){
    global $cnn;
    mysql_close($cnn);
}

function db_query($sql){
    global $cnn;   
    $data=array();
    $rs = mysql_query($sql, $cnn);
    if(!$rs) return;
    while($item=mysql_fetch_row($rs)){
        $data[] = $item;
    }
	
    return $data;
}
function db_update($sql){
  global $cnn;
    mysql_query($sql, $cnn);
	$num=mysql_affected_rows();
	if($num>0)
	       return true;
	else
           return false;
}
//分页
function db_count($sql,$pageSize){
	global $cnn;$page=0;
	db_connect();
    $rs = mysql_query($sql, $cnn);
    if(!$rs) return;
    while($item=mysql_fetch_row($rs)){
        $data[] = $item;
    }
	mysql_free_result($rs);
	if($data[0][0]%$pageSize==0){
		$page=$data[0][0]/$pageSize;
	}
	else{
		$page=$data[0][0]/$pageSize+1;
	}
    return $page;
}


?>