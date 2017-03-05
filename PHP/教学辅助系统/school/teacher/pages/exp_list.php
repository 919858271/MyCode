<?php
require("../../Smarty/libs/Smarty.class.php");
require_once "../../database/config.inc.php";
require_once "../../phpBean/ActionService.php";
session_start();
if(!isset($_SESSION['tnumber'])){//判断是否非法访问
	header("location:../../index.php");
}
$smarty = new Smarty;
db_connect();
$action=$_GET['action'];//选择功能
switch($action){
	case "list" ://查看实验安排
			$c_id = $_GET['course_id'];//课程编号
			/****在此处可修改分页大小********/	
				$pageSize=9;
			/***********获取分页符**************/
				$pageNum = $_GET['pageNum'];
				$mark = mark($pageNum,$pageSize);
				
			/****获取分页总页面数************/				
					$sql ="select count(course_id) from experiment where course_id='$c_id'" ;
					$pageSum=(int)db_count($sql,$pageSize);	
					if($pageSum==0){
								$pageSum=1;
							}					
			/**************分页链接模式**************/	
					$sty=sty2($pageNum,$pageSum);					
			/************数据库分页查询***********/	 	
					if($c_id!=null&&$c_id!=""){			
						$sql = "select course_id,pace_id,pace_name,start_time,end_time,detial
						FROM experiment where course_id='$c_id'  ORDER BY pace_id asc limit $mark[0],$pageSize ";
						$data=db_query($sql);//查询已有实验安排									
						if(!empty($data)){											
							$tab = $_GET['tab'];//选项卡
							switch($tab){//选择选项卡
								case "1" ://实验安排选项卡
									$tab_class = array("selected",null,null);//选项卡样式
									$smarty->assign("data",$data);	//查询得到的数据																										
									$smarty->assign("course_id",$c_id);	//课程编号																
									$smarty->assign("pageNum",$pageNum);//业号
									$smarty->assign("left",$mark[1]);//上一页
									$smarty->assign("sty",$sty);//分页链接样式
									$smarty->assign("last",$pageSum);//最后一页
									$smarty->assign("tab",$tab_class);//选项卡样式								
									$smarty->display("templates/exp_list.tpl");
								break;
								case "2" ://实验报告提交选项卡
									$tab_class = array(null,"selected",null);
									$smarty->assign("data",$data);																										
									$smarty->assign("course_id",$c_id);																		
									$smarty->assign("pageNum",$pageNum);
									$smarty->assign("left",$mark[1]);
									$smarty->assign("sty",$sty);
									$smarty->assign("last",$pageSum);
									$smarty->assign("tab",$tab_class);									
									$smarty->display("templates/exp_list.tpl");
								break;								
							}
						}
						else{//课程没有提交实验安排
							       $tab_class = array("selected",null,null);
								   $sty=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");								   
									$smarty->assign("data",null);																								
									$smarty->assign("course_id",$c_id);						
									$smarty->assign("pageNum",$pageNum);
									$smarty->assign("left",$mark[1]);
									$smarty->assign("sty",$sty);
									$smarty->assign("last",$pageSum);
									$smarty->assign("tab",$tab_class);								
									$smarty->display("templates/exp_list.tpl");		 
						}
					}
					else{						
						$smarty->assign("mes","查询失败");
						$smarty->display("templates/errors.tpl");
					}
	break;
	case "add" :
		$course_id =$_GET['course_id'];//课程编号
		$title=trim($_POST['title']);//实验步骤名称
		$start_time=trim($_POST['start_time']);//实验开始时间
		$end_time=trim($_POST['end_time']);//实验结束时间
		$detial=trim($_POST['detial']);//实验任务		
		if($detial!=null||$detial!=""){
			$pace_id = "E".time();//步骤编号
			$sql = "insert into experiment(course_id,pace_id,pace_name,start_time,end_time,detial) values
					('$course_id','$pace_id','$title','$start_time','$end_time','$detial')";
			$isADD = db_update($sql);
			if($isADD){
				echo  "<script>					
														window.location.href='exp_list.php?pageNum=1&&action=list&&tab=1&&course_id=".$course_id."';
															alert('添加成功');
														</script>"
														;				
			}else{
				echo  "<script>					
														window.location.href='exp_list.php?pageNum=1&&action=list&&tab=1&&course_id=".$course_id."';
															alert('添加失败');
														</script>"
														;				
			}
		}else{
			echo  "<script>					
														window.location.href='exp_list.php?pageNum=1&&action=list&&tab=1&&course_id=".$course_id."';
															alert('实验任务不能为空');
														</script>"
														;			
		}
	break;
	case "report" ://查看实验报告
							$paceNum = $_GET['paceNum'];//实验步骤编号
							$course_id=$_GET['course_id'];//课程编号
							$paceName="select pace_name from experiment where pace_id='$paceNum'";//实验步骤名称
							$pace_name=db_query($paceName);		
							//查询当前是否有实验报告
							$sql = "select pace_id,s_number,s_name,s_class,exp_report_up_time from report where pace_id='$paceNum' 
									ORDER BY s_class, exp_report_up_time desc";
							$isHave=db_query($sql);
							if(!empty($isHave)){
								//查询当前未批改的实验报告
								$sql2 = "select pace_id,s_number,s_name,s_class,exp_report_up_time from report where pace_id='$paceNum' and idf='0'
									ORDER BY s_class, exp_report_up_time desc";
							    $isNeedMarking=db_query($sql2);
								//查看已批阅实验报告
								$sql3 = "select pace_id,s_number,s_name,s_class,exp_report_up_time from report where pace_id='$paceNum' and idf='1'
									ORDER BY s_class, exp_report_up_time desc";
							    $isMarked=db_query($sql3);	
								if(!empty($isNeedMarking)&&empty($isMarked)){//只有未批阅的
									$smarty->assign("pace_name",$pace_name[0][0]);
									$smarty->assign("course_id",$course_id);
									$smarty->assign("mes","<b style='color: #FF0000;margin-left:10px'>当前阶段有未完成批阅的实验报告</b>");
									$smarty->assign("data1",$isNeedMarking);									
									$smarty->assign("data2",$isMarked);
									$smarty->display("templates/report_list.tpl");
								}else if(empty($isNeedMarking)&&!empty($isMarked)){	//只有批阅的
									$smarty->assign("pace_name",$pace_name[0][0]);
									$smarty->assign("course_id",$course_id);
									$smarty->assign("mes","<b style='margin-left:10px'>当前阶段实验报告已完成批阅</b>");
									$smarty->assign("data1",null);									
									$smarty->assign("data2",$isMarked);
									$smarty->display("templates/report_list.tpl");
								}else{//两者都有
									$smarty->assign("pace_name",$pace_name[0][0]);
									$smarty->assign("course_id",$course_id);
									$smarty->assign("mes","<b style='color: #FF0000;margin-left:10px'>当前阶段有未完成批阅的实验报告</b>");
									$smarty->assign("data1",$isNeedMarking);									
									$smarty->assign("data2",$isMarked);
									$smarty->display("templates/report_list.tpl");
								}								
							}else{								
								$smarty->assign("pace_name",$pace_name[0][0]);
								$smarty->assign("mes","<b style='color: #FF0000;margin-left:10px'><strong>当前试验阶段还没有学生提交实验报告</b>");
								$smarty->assign("data1",null);
								$smarty->assign("course_id",$course_id);
								$smarty->assign("data2",null);
								$smarty->display("templates/report_list.tpl");
							}
							
								
							
							
	break;
	case "report_detial" ://实验报告内容
						$pace_id= $_GET['pid'];//实验步骤编号
						$course_id=$_GET['course_id'];//课程编号
						$s_id= $_GET['sid'];//学号
						$sqltt="select c_name from course where c_id='$course_id'";
						$cn=db_query($sqltt);		
						$course_name = $cn[0][0];//课程名
						$sql_p="select pace_name from experiment where pace_id='$pace_id'";
						$pn=db_query($sql_p);
						$p_name=$pn[0][0];//实验名称
						$sql = "select * FROM report where pace_id='$pace_id' and s_number='$s_id' ";
						$data=db_query($sql);
						if(!empty($data)){
								$_SESSION['ss_id']=$s_id;
								$smarty->assign("s_id",$s_id);						
								$smarty->assign("c_name",$course_name);
								$smarty->assign("p_name",$p_name);
								$smarty->assign("pace_id",$pace_id);
								$smarty->assign("course_id",$course_id);
								$smarty->assign("data",$data);
								$smarty->display("templates/report_detial.tpl");
							}else{
								
							}
	break;
	case "marking" ://批改实验报告
			$course_id=$_GET['course_id'];//课程编号
			$pace_id=trim($_POST['pace_id']);//实验步骤编号
			$mark=trim($_POST['mark']);
			$content=trim($_POST['content']);
			$s_id = $_GET['s_id'];//获取学号	
			$che="select idf from report where s_number='$s_id' and pace_id='$pace_id'";
			$isMak=db_query($che);
			if($isMak[0][0]!="1"){
				$sql = "update report set marking='已批阅',mark='$mark',other='$content',idf='1' where pace_id='$pace_id' and s_number='$s_id'";
				$isMark = db_update($sql);
				if($isMark){
					echo  "<script>					
							window.location.href='exp_list.php?action=report&&paceNum=".$pace_id."&&course_id=".$course_id."';
								 alert('批阅成功');
								</script>"
							;
				}else{
						echo  "<script>					
							window.location.href='exp_list.php?action=report&&paceNum=".$pace_id."&&course_id=".$course_id."';
								 alert('批阅失败');
								</script>"
								;
				}	
			}else{
				echo  "<script>					
							window.location.href='exp_list.php?action=report&&paceNum=".$pace_id."&&course_id=".$course_id."';
								 alert('该实验报告已批阅，不能再次批阅');
								</script>"
								;
			}
	break;
	case "delete" ://删除实验步骤
		$pace_id = $_GET['pace_id'];//实验步骤编号
		$course_id = $_GET['course_id'];//实验步骤编号
		$sql = "delete from experiment where pace_id='$pace_id'";
		$isDet = db_update($sql);
		if($isDet){
			echo  "<script>					
													window.location.href='exp_list.php?pageNum=1&&action=list&&tab=1&&course_id=".$course_id."';
														alert('删除成功');
													</script>"
													;	
		}else{
			echo  "<script>					
													window.location.href='exp_list.php?pageNum=1&&action=list&&tab=1&&course_id=".$course_id."';
														alert('删除失败');
													</script>"
													;	
		}
		
	break;
	
}		
db_close();
 ?>