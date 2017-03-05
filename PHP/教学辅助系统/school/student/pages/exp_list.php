<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
require_once "../../phpBean/ActionService.php";
session_start();
if(!isset($_SESSION['snumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();

$action=$_GET['action'];//选择功能
switch($action){
			case "list" ://实验步骤列表
			$id=$_GET['course_id'];//课程编号
			$snumber=$_GET['snumber'];//学号
			/****在此处可修改分页大小********/	
				$pageSize=9;
			/***********获取分页符**************/
				$pageNum = $_GET['pageNum'];
				$mark = mark($pageNum,$pageSize);
				
			/****获取分页总页面数************/
					
					$sql ="select count(course_id) from experiment where course_id='$id'" ;
					$pageSum=(int)db_count($sql,$pageSize);
						if($pageSum==0){
							$pageSum=1;
						}
					if($pageSum==0){
						$pageSum=1;
					}
							
			/**************分页链接模式**************/	
					$sty=sty2($pageNum,$pageSum);
					
			/****获取当前实验总进度********/	 
					$sql2="select max(pace_id) from experiment where course_id='$id'";
					
					$maxPace=db_query($sql2);
			/************数据库分页查询***********/	 	
					if($id!=null&&$id!=""){			
						$sql = "select course_id,pace_id,pace_name,start_time,end_time,substring(detial,1,10)
						FROM experiment where course_id='$id'  ORDER BY pace_id asc limit $mark[0],$pageSize ";
						$data=db_query($sql);
						
						$sql2 = "select pace_id,pace_name from experiment where course_id='$id' ORDER BY pace_id asc";
						$data1=db_query($sql2);			
						if(!empty($data)){	
							$notice=$data[0][2];	
							$tab = $_GET['tab'];
							switch($tab){//选择选项卡
								case "1" ://实验安排选项卡
									$tab_class = array("selected",null,null);
									$smarty->assign("data",$data);//实验安排内容
									$smarty->assign("data1",$data1);//实验步骤									
									$smarty->assign("notice",$notice."实验进度");//哪个实验步骤的进度提示									
									$smarty->assign("pace_id",$maxPace[0][0]);//步骤编号
									$smarty->assign("exp_name",$notice);//步骤名称
									$smarty->assign("pageNum",$pageNum);//分页号
									$smarty->assign("course_id",$id);//课程号
									$smarty->assign("snumber",$snumber);//学号
									$smarty->assign("left",$mark[1]);
									$smarty->assign("sty",$sty);
									$smarty->assign("last",$pageSum);
									$smarty->assign("tab",$tab_class);								
									$smarty->display("templates/exp_list.tpl");
								break;
								case "2" ://实验报告提交选项卡
									$tab_class = array(null,"selected",null);
									$smarty->assign("data",$data);
									$smarty->assign("data1",$data1);								
									$smarty->assign("notice",$notice."实验进度");								
									$smarty->assign("pace_id",$maxPace[0][0]);
									$smarty->assign("exp_name",$notice);
									$smarty->assign("pageNum",$pageNum);
									$smarty->assign("course_id",$id);
									$smarty->assign("snumber",$snumber);
									$smarty->assign("left",$mark[1]);
									$smarty->assign("sty",$sty);
									$smarty->assign("last",$pageSum);
									$smarty->assign("tab",$tab_class);
									
									$smarty->display("templates/exp_list.tpl");
								break;
								
							}
						}
						else{
							//没有安排实验内容
							$smarty->assign("mes","当前课程尚未安排实验内容");
							$smarty->display("templates/Warning.tpl");		 
						}
					}
					else{						
						$smarty->assign("mes","系统错误");
						$smarty->display("templates/errors.tpl");
					}
				break;
case "detial" ://阶段实验报告内容
						$pace_id = $_GET['pace_id'];//步骤编号
						$course_id = $_GET['course_id'];//步骤编号
						$s_number=$_GET['snumber'];//学号
						$sqltt="select c_name from course where c_id='$course_id'";
						$cn=db_query($sqltt);	
						$course_name = $cn[0][0];//课程名称
						$sql_p="select pace_name from experiment where pace_id='$pace_id'";
						$pn=db_query($sql_p);
						$p_name=$pn[0][0];//实验名称
						$sql = "select * from report where pace_id='$pace_id' and s_number='$s_number'";
						$data=db_query($sql);	
						if(!empty($data)){
							
							$smarty->assign("c_name",$course_name);
							$smarty->assign("p_name",$p_name);
							$smarty->assign("mes2","(点击下载实验报告)");
							$smarty->assign("data",$data);							
							$smarty->display("templates/exp_report_detial.tpl");
						}else{
							$smarty->assign("c_name","你尚未提交本阶段实验报告");
							$smarty->assign("mes2",null);
							$smarty->assign("p_name",$p_name);
							$smarty->assign("data",null);
							$smarty->display("templates/exp_report_detial.tpl");
						}
				break;
case "exp_detial" ://实验阶段任务详细
				    $paceId = $_GET['pace_id'];//实验步骤编号
					$course_id = $_GET['course_id'];//实验步骤编号
					$sql = "select * FROM experiment where course_id='$course_id' and pace_id='$paceId' ";
					$data=db_query($sql);
					$sqlt="select c_name from course where c_id='$course_id'";
					$cn=db_query($sqlt);
					$course_name = $cn[0][0];//课程名称
					if(!empty($data)){							
							$smarty->assign("c_name",$course_name);
							$smarty->assign("data",$data);
							$smarty->display("templates/exp_pace_detial.tpl");
						}else{
							$smarty->assign("c_name",$course_name);
							$smarty->assign("data",null);
							$smarty->display("templates/exp_pace_detial.tpl");
						}
				break;
				
case "uoload" ://实验报告提交
				/********获取提交报告信息*******/
					$course_id = $_GET['course_id'];//实验课程编号
					$s_number = $_GET['snumber'];//学号
					$sqltt="select sname ,sclass from student where snumber='$s_number'";
					$sn=db_query($sqltt);
					$s_name = $sn[0][0];//谁提交
					$s_class = $sn[0][1];//所在班级				
					$pace_id = trim($_POST['pace_id']);//实验步骤编号
					$exp_report_title = trim($_POST['report_title']);//实验小结标题
					$exp_report_content = trim($_POST['report_content']);//实验小结内容
					$check = "select pace_id from report where pace_id='$pace_id' and s_number='$s_number'";
					$isUped=db_query($check);
					if($isUped==null){//判断当前阶段是否已提交过
					
					/******获取上传实验报告文件信息*********/
					$allowedExts = array("rar", "zip");//限制上传文件类型
					$upfile=$_FILES["file"];//上传的文件 
					$name = $upfile["name"];//上传的文件名  
					$type = end(explode(".",$name));//上传的文件类型
					$size = $upfile["size"];//上传的文件大小
					$tmp_name = $upfile["tmp_name"];//上传的文件临时名
					$error = $upfile["error"];//上传文件错误原因
					if(!empty($tmp_name)){//判断是否选择文件
									if($size < 15*1024*1024){//，判断文件大小服务器上传上限为10M，此处放大些
										if (in_array($type, $allowedExts)){			
											if ($error > 0){
												echo "上传失败: " . $error . "<br>";
												}
											else{	
												if(strlen($exp_report_content)>=50){
													/********开始上传*******/
													$newName ="R".time().".".$type;//重新命名的文件名	
													$tmp = str_replace(strrchr($name, "."),"",$name );	//真实文件名														
													//判断文件上传是否结束或成功
													$isOk = move_uploaded_file($tmp_name = $upfile["tmp_name"],"../../upload/" . $newName);	
														//数据库存储
													$sql = "insert into report (pace_id,s_number,s_name,s_class,course_id,exp_report_title,exp_report_content,exp_report_up_time,
															report_true_name,report_new_name) values 
															('$pace_id','$s_number','$s_name','$s_class' ,'$course_id',
															'$exp_report_title','$exp_report_content',now(),'$tmp','$newName')";	
													$isUp=db_update($sql);
													if($isOk&&$isUp){
														echo  "<script>					
																		window.location.href='exp_list.php?pageNum=1&&action=list&&tab=1&&snumber=".$s_number."&&course_id=".$course_id."';
																			alert('实验报告提交成功');
																		</script>"
																		;
														
													}else{
														echo  "<script>					
																		window.location.href='exp_list.php?pageNum=1&&action=list&&tab=2&&snumber=".$s_number."&&course_id=".$course_id."';
																			alert('实验报告提交失败');
																		</script>"
																		;
													}
												}else{							
													echo  "<script>					
																		window.location.href='exp_list.php?pageNum=1&&action=list&&tab=2&&snumber=".$s_number."&&course_id=".$course_id."';
																			alert('小结内容不能少于50个字符，请重新填写');
																		</script>"
																		;
												}
											}
										}else{
											echo  "<script>					
																	window.location.href='exp_list.php?pageNum=1&&action=list&&tab=2&&snumber=".$s_number."&&course_id=".$course_id."';
																			alert('无法上传该类型文件，重新选择');
																		</script>"
																		;
										}
									}else{
										echo  "<script>					
																		window.location.href='exp_list.php?pageNum=1&&action=list&&tab=2&&snumber=".$s_number."&&course_id=".$course_id."';
																			alert('文件过大，重新选择');
																		</script>"
																		;
									}
						}else{
							echo  "<script>					
																		window.location.href='exp_list.php?pageNum=1&&action=list&&tab=2&&snumber=".$s_number."&&course_id=".$course_id."';
																			alert('请选择文件');
																		</script>"
																		;
						}			
					}else{
						echo  "<script>					
																		window.location.href='exp_list.php?pageNum=1&&action=list&&tab=2&&snumber=".$s_number."&&course_id=".$course_id."';
																			alert('该实验阶段实验报告已提交，你不能再提交');
																		</script>"
																		;
					}					
				break;
		}		
 db_close();
 ?>