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
$action = $_GET['action'];
switch($action){
	case "list" ://查看主题列表
		$c_id = $_GET['course_id'];//课程编号
		$tnumber = $_GET['tnumber'];//教师编号
		/*********获取功能条件*******/
		$pageNum=$_GET['pageNum'];
		/********获取分页条件***********/
		/****在此处可修改分页大小********/
		$pageSize=9;
		/***********获取分页符**************/
		$mark = mark($pageNum,$pageSize);

		/****获取分页总页面数************/
		$sql = "select count(*) from bbs_que where que_which_course='$c_id'";
		$pageSum=(int)db_count($sql,$pageSize);//提问总页数
		if($pageSum==0){
			$pageSum=1;
		}
		$sty=sty2($pageNum,$pageSum); //分页链接样式
		/**********开始************/
			$sql = "select * from bbs_que where que_which_course='$c_id' 
					order by last_rep_time desc limit $mark[0], $pageSize ";
			$data = db_query($sql);	
			if(!empty($data)){				
				$smarty->assign("c_id",$c_id);
				$smarty->assign("tnumber",$tnumber);
				$smarty->assign("left1",$mark[1]);
				$smarty->assign("last1",$pageSum);
				$smarty->assign("pageNum1",$pageNum);
				$smarty->assign("sty1",$sty);
				$smarty->assign("data1",$data);	
				$smarty->display("templates/bbs_list.tpl");
			  }else{
				  $sty=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");	
				$smarty->assign("c_id",$c_id);
				$smarty->assign("tnumber",$tnumber);
				$smarty->assign("left1",$mark[1]);
				$smarty->assign("last1",$pageSum);
				$smarty->assign("pageNum1",$pageNum);
				$smarty->assign("sty1",$sty);
				$smarty->assign("data1",null);	
				$smarty->display("templates/bbs_list.tpl");
		}
	break;
	case "publish" ://发表主题
			
			$t_idf = $_SESSION['t_idf'];//用户标识符
			$que_course = $_GET['course_id'];///提问的课程
			$tnumber = $_GET['tnumber'];//教师编号
			$sqlt="select tname from teacher where tnumber='$tnumber'";
			$tn=db_query($sqlt);
			$t_name = $tn[0][0];//教师姓名
			$que_kind=trim($_POST['que_kind']);//问题类别
			$que_title=trim($_POST['que_title']);//问题标题
			$que_content=trim($_POST['que_content']);//问题内容
			if(strlen($que_content)>=25){
				$sql = "insert into bbs_que (que_kind,que_title,que_content,who_ask,ask_time,last_rep_who,last_rep_time,que_which_course,user_dept) values
					('$que_kind','$que_title','$que_content','$t_name',now(),'$t_name',now(),'$que_course','$t_idf') ";
					$isPublish = db_update($sql);
					if($isPublish){
						echo  "<script>					
										window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$que_course."&&tnumber=".$tnumber."';								
										alert('发表成功！');								
										</script>"
												;
					}
					else{
						echo  "<script>					
										window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$que_course."&&tnumber=".$tnumber."';								
										alert('系统错误 发表失败');								
										</script>"
										;
					}
			}else{
				echo  "<script>					
										window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$que_course."&&tnumber=".$tnumber."';						
										alert('主题内容不能少于25个字符');								
										</script>"
										;
			}
	break;
	case "detial" ://主题回复详细
		    $id = $_GET['id'];//问题编号
			$pageNum=$_GET['pageNum'];
			$tnumber=$_GET['tnumber'];//教师编号
			$course_id=$_GET['course_id'];//课程编号
			$idf=$_GET['idf'];///标识符，判断浏览次数是否加1
			$sql3 = "select * from bbs_que where que_id='$id'";
			$que = db_query($sql3);//获取问题信息
			if($pageNum==1&&$idf==1){
			/*********查看次数加1********/
					$view_time= $que[0][6]+1;
					$sql4 = "update bbs_que set view_times='$view_time' where que_id='$id'";
					db_update($sql4);
			}

			/****在此处可修改分页大小********/
			$pageSize=9;
			/***********获取分页符**************/
			$mark = mark($pageNum,$pageSize);
			/****获取分页总页面数************/
			$sql = "select count(*) from bbs_rep where que_id='$id'";
			$pageSum=(int)db_count($sql,$pageSize);
			if($pageSum==0){
			$pageSum=1;
		}
			/*******获取分页样式*************/
			$sty=sty2($pageNum,$pageSum);
			$sql2 = "select * from bbs_rep where que_id='$id' order by rep_time desc limit $mark[0], $pageSize ";
			$data = db_query($sql2);
			if(empty($data)&&!empty($que)){					
					$sty=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");					
					$smarty->assign("tnumber",$tnumber);
					$smarty->assign("course_id",$course_id);					
					$smarty->assign("left","1");
					$smarty->assign("last","1");
					$smarty->assign("pageNum","1");
					$smarty->assign("sty",$sty);
					$smarty->assign("ques",$que);	  
					$smarty->assign("data",null);
					$smarty->assign("id",$id);					
					$smarty->display("templates/bbs_rep_detials.tpl");
			}else if(!empty($data)&&!empty($que)){	
					$smarty->assign("tnumber",$tnumber);	
					$smarty->assign("course_id",$course_id);						
					$smarty->assign("left",$mark[1]);
					$smarty->assign("last",$pageSum);
					$smarty->assign("pageNum",$pageNum);
					$smarty->assign("sty",$sty);
					$smarty->assign("ques",$que);
					$smarty->assign("data",$data);	
					$smarty->assign("id",$id);
					$smarty->display("templates/bbs_rep_detials.tpl");
			}else{
				$smarty->assign("mes","查询失败");
				$smarty->display("templates/errors.tpl");
			}
	break;
	
	case "rep" :
			$tnumber=$_GET['tnumber'];//教师编号
			$course_id=$_GET['course_id'];//课程编号
			$sqlt="select tname from teacher where tnumber='$tnumber'";
			$tn = db_query($sqlt);//查询教师名字
			$who_rep = $tn[0][0];//回复人姓名
			$t_idf = $_SESSION['t_idf'];//回复人系别
			$que_id=trim($_POST['que_id']);//问题编号
			
			$rep_content=trim($_POST['rep_content']);//回复内容
			$rep_content2=trim($_POST['que_content']);//二级回复内容
			$who_rep2=trim($_POST['user']);//二级回复人
			if($rep_content2==null||$rep_content2==""){
				$str =null;
			}else{
				$str = "回 复 ".$who_rep2.":".$rep_content2;
			}
			if($rep_content!=null&&$rep_content!=""){
				if($who_rep!=$who_rep2){
					db_connect();
					$sql2 = "select max(max_rep_time) from bbs_rep where que_id='$que_id'";
					$data = db_query($sql2);
					if($data[0][0]==null&&$data[0][0]==""){
						$rep_times=1;
					}else{
					$rep_times=$data[0][0];
					}
					$sql4 = "update bbs_que set rep_times='$rep_times',last_rep_who='$who_rep',last_rep_time=now() where que_id='$que_id'";
					db_update($sql4);
					
					if($data[0][0]==null&&$data[0][0]==""){
						$data[0][0]=1;
					}
					$rep_l=$data[0][0]+1;
					$sql = "insert into bbs_rep (que_id,rep_content,who_rep,user_dept,rep_time,max_rep_time,other) 
							values ( $que_id,'$rep_content','$who_rep','$t_idf',now(),$rep_l,'$str')";
					$isRep = db_update($sql);
					if($isRep){
						echo  "<script>					
										window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&tnumber=".$tnumber."&&course_id=".$course_id."';								
										alert('回复成功！');								
										</script>"
												;
					}else{
						echo  "<script>					
										window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&tnumber=".$tnumber."&&course_id=".$course_id."';									
										alert('系统错误 回复失败');								
										</script>"
										;
					}
					db_close();	
				}else{
					echo  "<script>					
										window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&tnumber=".$tnumber."&&course_id=".$course_id."';		
										alert('亲，自己给自己回复，有点不像话哦 ^V^');
										</script>"
										;
				}	
			}else{
				echo  "<script>					
										window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&tnumber=".$tnumber."&&course_id=".$course_id."';		
										alert('回复内容不能为空');
										</script>"
										;
			}
	break;
	case "delete" :
			 $que_id = $_GET['que_id'];//问题编号
			 $course_id = $_GET['course_id'];//课程编号
			  $tnumber = $_GET['tnumber'];//教师编号
			 $sql="delete from bbs_que where que_id='$que_id'";//删除主题
			 $isDelet1 = db_update($sql);
			 $cheack="select * from bbs_rep where que_id='$que_id'";//查看是否有回复
			 $isRep = db_query($cheack);	
			 if($isRep!=null){//存在回复内容
				 $sql2="delete  from bbs_rep where que_id='$que_id'";//删除主题回复			 
				 $isDelet2 = db_update($sql2);
			 
				 if($isDelet1&&$isDelet2){
					 echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$course_id."&&tnumber=".$tnumber."';								
											alert('删除成功');								
											</script>"
													;
				 }else if($isDelet1&&!$isDelet2){
					  echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$course_id."&&tnumber=".$tnumber."';							
											alert('主题删除成功，但回复内容未清空');								
											</script>"
													;
				 }else if(!$isDelet1&&$isDelet2){
					 echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$course_id."&&tnumber=".$tnumber."';							
											alert('主题删除失败，但回复内容已删除');								
											</script>"
													;
				 }else{
					 echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$course_id."&&tnumber=".$tnumber."';						
											alert('删除失败');								
											</script>"
													;
				 }
			 }else{
				 if($isDelet1){
					  echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$course_id."&&tnumber=".$tnumber."';							
											alert('删除成功');								
											</script>"
													;
				 }else{
					  echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&course_id=".$course_id."&&tnumber=".$tnumber."';						
											alert('删除失败');								
											</script>"
													;
				 }
			 }
	break;			
}		
db_close();
?>