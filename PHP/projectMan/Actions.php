<?php
  class ProjectActions{
	  function newproject($projectname){
		  $result=mysql_query("create table $projectname(taskname varchar(60) not null default 'newtask', description varchar(255), priority varchar(12), duedate datetime, status varchar(12), primary key (taskname))");
		  if ($result) {echo "Project $projectname created successfully";}
		  else {echo ("An error occured creating project $projectname:\n".mysql_error());}
	  }
	  function deleteproject($projectname){
		  $result=mysql_query("drop table $projectname;");
		  if ($result) {echo "Project $projectname deleted successfully";}
		  else {echo ("An error occured deleting project $projectname:\n".mysql_error());}
	  }
  }
  
  class TaskActions{
	  function NewTask($projectname, $taskname, $taskdesc, $taskprior, $taskduedate, $taskstatus){
		  $result=mysql_query("INSERT INTO $projectname VALUES ($taskname, $taskdesc, $taskprior, $taskduedate, $taskstatus);");
		  if ($result) {echo "Task $taskname added successfully";}
		  else {echo ("An error occured inserting task $tackname:\n".mysql_error());}
	  }
	  
	  function DelTask($projec, $task){
		  $result=mysql_query("DELETE FROM $project WHERE (taskname=$task);");
		  if ($result) {echo "Task $task deleted successfully";}
		  else {echo ("An error occured deleting task $task:\n".mysql_error());}
	  }
	  
	  function ModifyTask($projectname, $taskname, $taskdesc, $taskprior, $taskduedate, $taskstatus){
		  $result=DelTask($projectname, $taskname);
		  $result=NewTask($projectname, $taskname, $taskdesc, $taskprior, $taskduedate, $taskstatus);
	  }	  
  }
?>