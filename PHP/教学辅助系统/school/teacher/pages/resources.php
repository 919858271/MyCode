<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
require_once "../../phpBean/ActionService.php";
session_start();
if(!isset($_SESSION['tnumber'])){//判断是否非法访问
	header("location../../index.php");
}
$smarty = new Smarty;
db_connect();
$action=$_GET['action'];
switch($action){//功能选择
	case "list" ://文件列表
		$id = $_GET['course_id'];//课程编号
		$tnumber = $_GET['tnumber'];//教师编号
		/**开始分页**/
		$pageNum = $_GET['pageNum'];
		/****在此处可修改分页大小********/
		$pageSize=9;
		/***********获取分页符**************/
		$mark = mark($pageNum,$pageSize);//matk包含查询起点和上一页number

		/****获取分页总页面数************/
		$sql ="select count(id) from file_list  where course_id='$id'" ;
		$pageSum=(int)db_count($sql,$pageSize);
		if($pageSum==0){
			$pageSum=1;
		}
		/**************分页链接模式**************/
		$sty=sty2($pageNum,$pageSum);
		/*****开始查询下载列表*******/
		$sql = "select * from file_list where course_id='$id' order by id desc  limit $mark[0],$pageSize";
		$data=db_query($sql);
		if(!empty($data)){	
		    $tab_class = array("selected",null);//页面选项卡样式
			$smarty->assign("left",$mark[1]);//上一页
			$smarty->assign("last",$pageSum);//最后一页
			$smarty->assign("pageNum",$pageNum);//给最后一页添加页码
			$smarty->assign("sty",$sty);//分页链接样式
			$smarty->assign("course_id",$id);//课程编号
			$smarty->assign("tnumber",$tnumber);//教师编号
			$smarty->assign("data",$data);//文件资源数据
			$smarty->assign("tab",$tab_class);//选项卡选择
			$smarty->display("templates/resources_list.tpl");
		}else{
			$sty=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");
			$smarty->assign("left",$mark[1]);
			$smarty->assign("last",$pageSum);
			$smarty->assign("pageNum",$pageNum);
			$smarty->assign("sty",$sty);
			$smarty->assign("course_id",$id);//课程编号
			$smarty->assign("tnumber",$tnumber);//教师编号
			$smarty->assign("data",null);			
			$smarty->display("templates/resources_list.tpl");	
		}
		break;
	case "upload" ://资源上传
			$allowedExts = array("rar", "zip");//限制上传文件类型
			$upfile=$_FILES["file"];//上传的文件 
			$name = $upfile["name"];//上传的文件名  
			$type = end(explode(".",$name));//上传的文件类型
			$size = $upfile["size"];//上传的文件大小
			$tmp_name = $upfile["tmp_name"];//上传的文件临时名
			$error = $upfile["error"];//上传文件错误原因
			
			$course_id = $_GET['course_id'];//实验课程编号
			$tnumber = $_GET['tnumber'];//教师编号
			$sqlt="select tname from teacher where tnumber='$tnumber'";
			$tn=db_query($sqlt);
			$t_name=$tn[0][0];//教师名称
			$ins=trim($_POST['file_detial']);		
			if(!empty($tmp_name)){
						if($size < 15*1024*1024){//服务器上传上限为10M，此处放大些
							if (in_array($type, $allowedExts)){			
								if ($error > 0){
									echo "上传失败: " . $error . "<br>";
									}
								else{							   
									$newName ="S".time().".".$type;//重新命名的文件名	
									$tmp = str_replace(strrchr($name, "."),"",$name );	//真实文件名						
									//开始上传文件	
									$isOk = move_uploaded_file($tmp_name = $upfile["tmp_name"],"../../upload/" . $newName);	
									$sql = "insert into file_list (true_name,new_name,up_time,who_share,course_id,ins) 
															values ('$tmp','$newName',CURDATE(),'$t_name','$course_id','$ins')";															
									$isUp = upload($sql);	
									//判断上传是否结束或成功
									if($isOk&&$isUp){											
											echo  "<script>					
													window.location.href='resources.php?pageNum=1&&action=list&&course_id=".$course_id."&&tnumber=".$tnumber."';
														alert('资源共享成功');
													</script>"
													;																																
																						
									}else{
										echo  "<script>					
													window.location.href='resources.php?pageNum=1&&action=list&&course_id=".$course_id."&&tnumber=".$tnumber."';
														alert('资源共享失败');
													</script>"
													;		
									}
								}
							}else{
								echo  "<script>					
													window.location.href='resources.php?pageNum=1&&action=list&&course_id=".$course_id."&&tnumber=".$tnumber."';
														alert('无法上传该类型文件');
													</script>"
													;	
							}
						}else{
							echo  "<script>					
													window.location.href='resources.php?pageNum=1&&action=list&&course_id=".$course_id."&&tnumber=".$tnumber."';
														alert('文件过大');
													</script>"
													;	
						}
			}else{
				echo  "<script>					
													window.location.href='resources.php?pageNum=1&&action=list&&course_id=".$course_id."&&tnumber=".$tnumber."';
														alert('请选择文件');
													</script>"
													;	
			}
	break;	
}
db_close();
?>