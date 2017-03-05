<?php
require_once "../service/UserService.class.php";
require_once "../Users/Student.class.php";
require_once "../Users/Teacher.class.php";
require_once "../Users/Admin.class.php";

//接收用户名、密码、用户、类型
$userName=trim($_POST['userName']);
$passWord=trim($_POST['passWord']);
$userType=trim($_POST['userType']);

$userService = new UserService();
$admin = $userService->checkAdmin($userName, $passWord);
//获取管理员信息，并验证
$aNumber = $admin->getAdminNumber();
$aName = $admin->getAdminName();
$aPssWord = $admin->getPassWord();

echo $userName;
echo $passWord;
echo $userType;
echo "<br>";
echo $aName."1";
echo "<br>";
echo $aNumber."1";



