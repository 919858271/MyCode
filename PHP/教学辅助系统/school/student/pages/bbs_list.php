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
$action = $_GET['action'];
switch($action){
	case "list" ://主题列表
		$id = $_GET['course_id'];//课程编号
		$snumber = $_GET['snumber'];//学号
		/*********获取功能条件*******/
		$pageNum=$_GET['pageNum'];

		/********获取分页条件***********/
		/****在此处可修改分页大小********/
		$pageSize=9;
		/***********获取分页符**************/
		$mark = mark($pageNum,$pageSize);

		/****获取分页总页面数************/
		$sql = "select count(*) from bbs_que where que_which_course='$id'";
		$pageSum=(int)db_count($sql,$pageSize);//提问总页数
		if($pageSum==0){
			$pageSum=1;
		}
		$sty1=sty2($pageNum,$pageSum); //分页链接样式
		/**********开始************/
			$sql = "select * from bbs_que where que_which_course='$id' 
					order by last_rep_time desc limit $mark[0], $pageSize ";
			$data1 = db_query($sql);	
			if(!empty($data1)){				
				$smarty->assign("course_id",$id);
				$smarty->assign("snumber",$snumber);
				$smarty->assign("left1",$mark[1]);
				$smarty->assign("last1",$pageSum);
				$smarty->assign("pageNum1",$pageNum);
				$smarty->assign("sty1",$sty1);
				$smarty->assign("data1",$data1);	
				$smarty->display("templates/bbs_list.tpl");
			  }else{
				$sty=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");	
				$smarty->assign("course_id",$id);
				$smarty->assign("snumber",$snumber);
				$smarty->assign("left1",$mark[1]);
				$smarty->assign("last1",$pageSum);
				$smarty->assign("pageNum1",$pageNum);
				$smarty->assign("sty1",$sty);
				$smarty->assign("data1",null);	
				$smarty->display("templates/bbs_list.tpl");  
		}
	break;
	case "publish" ://发布主题
			$snumber = $_GET['snumber'];//学号
			
			$sqltt="select sname,sclass from student where snumber='$snumber'";
			$sn = db_query($sqltt);	
			$s_name = $sn[0][0];//学生姓名
			$s_class = $sn[0][1];//学生班级
			$que_course = $_GET['course_id'];//课程编号
			$que_kind=trim($_POST['que_kind']);//主题分类
			$que_title=trim($_POST['que_title']);//主题标题
			$que_content=trim($_POST['que_content']);//主题内容
				if(strlen($que_content)>=25){
						$sql = "insert into bbs_que (que_kind,que_title,que_content,who_ask,ask_time,last_rep_who,last_rep_time,que_which_course,user_dept) values
						('$que_kind','$que_title','$que_content','$s_name',now(),'$s_name',now(),'$que_course','$s_class') ";
						$isPublish = db_update($sql);
						if($isPublish){
							echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&snumber=".$snumber."&&course_id=".$que_course."';								
											alert('发表成功！');								
											</script>"
													;
						}
						else{
							echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&snumber=".$snumber."&&course_id=".$que_course."';							
											alert('系统错误 发表失败');								
											</script>"
											;
						}
				}else{
					echo  "<script>					
											window.location.href='bbs_list.php?action=list&&pageNum=1&&snumber=".$snumber."&&course_id=".$que_course."';				
											alert('主题内容不能少于25个字符');								
											</script>"
											;
				}
	
	break;
	
	case "detial" ://查看主题
		$id = $_GET['id'];//问题编号	
		$snumber= $_GET['snumber'];//学号
		$course_id = $_GET['course_id'];//课程号
		$pageNum=$_GET['pageNum'];
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
		$sql2 = "select * from bbs_rep where que_id='$id' order by rep_time desc limit $mark[0], $pageSize ";//查看是否有回复
		$data = db_query($sql2);
		if(empty($data)&&!empty($que)){				
				$sty=array("am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled","am-disabled");	
				$smarty->assign("snumber",$snumber);
				$smarty->assign("course_id",$course_id);			
				$smarty->assign("left","1");
				$smarty->assign("last","1");
				$smarty->assign("pageNum","1");
				$smarty->assign("sty",$sty);
				$smarty->assign("ques",$que);	  
				$smarty->assign("data",null);	
				$smarty->display("templates/bbs_rep_detials.tpl");
		}else if(!empty($data)&&!empty($que)){		
				$smarty->assign("snumber",$snumber);
				$smarty->assign("course_id",$course_id);	
				$smarty->assign("left",$mark[1]);
				$smarty->assign("last",$pageSum);
				$smarty->assign("pageNum",$pageNum);
				$smarty->assign("sty",$sty);
				$smarty->assign("ques",$que);
				$smarty->assign("data",$data);	
				$smarty->display("templates/bbs_rep_detials.tpl");
		}else{
			$smarty->assign("mes","查看失败");
			$smarty->display("templates/errors.tpl");
		}	
	break;
	
	case "rep" :
			$snumber=$_GET['snumber'];//学号
			$course_id = $_GET['course_id'];//课程号
			$sqlt="select sname,sclass from student where snumber='$snumber'";
			$sn = db_query($sqlt);//查询学生名字，班级
			$who_rep = $sn[0][0];//回复人姓名
			$s_class = $sn[0][1];//回复人班级
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
					$sql2 = "select max(max_rep_time) from bbs_rep where que_id='$que_id'";//回复次数控制
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
				//插入回复
						$sql = "insert into bbs_rep (que_id,rep_content,who_rep,user_dept,rep_time,max_rep_time,other) 
								values ( $que_id,'$rep_content','$who_rep','$s_class',now(),$rep_l,'$str')";
						$isRep = db_update($sql);
						if($isRep){
							echo  "<script>					
											window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&snumber=".$snumber."&&course_id=".$course_id."';								
											alert('回复成功！');								
											</script>"
													;
						}else{
							echo  "<script>					
											window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&snumber=".$snumber."&&course_id=".$course_id."';							
											alert('系统错误 回复失败');								
											</script>"
											;
						}
						db_close();	
					}else{
						echo  "<script>					
											window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&snumber=".$snumber."&&course_id=".$course_id."';	
											alert('亲，自己给自己回复，有点不像话哦 ^V^');
											</script>"
											;
					}	
				}else{
					echo  "<script>					
											window.location.href='bbs_list.php?action=detial&&id=".$que_id."&&pageNum=1&&idf=0&&snumber=".$snumber."&&course_id=".$course_id."';	
											alert('回复内容不能为空');
											</script>"
											;
				}
	break;
}
db_close();
?>