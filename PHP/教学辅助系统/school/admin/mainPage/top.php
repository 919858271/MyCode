<?php
require("../../Smarty/libs/Smarty.class.php");
$smarty = new Smarty;
session_start();
$username = $_SESSION['aname'];
$anumber=$_SESSION['anumber'];
$smarty->assign("name",$username);
$smarty->assign("anumber",$anumber);
$smarty->display("templates/top.tpl");
?>