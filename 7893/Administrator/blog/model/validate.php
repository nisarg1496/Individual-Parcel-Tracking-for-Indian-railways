<?php

require('connection.php');
session_start();
$_SESSION["status"]=false;
$userdata=json_decode(file_get_contents("php://input"),true);
$username=mysqli_real_escape_string($con,$userdata["username"]);
$password=mysqli_real_escape_string($con,$userdata["password"]);

	$sql ="select * from staff where username like '".$username."' and password like '".$password."' and staff='admin' || staff='administrator'";
	$result=mysqli_query($con,$sql);
	$output=array();

	if($row=mysqli_fetch_assoc($result))
	{
		$_SESSION["status"]=true;
		echo "1";
	}
	else{
			echo "2";
	}

	
	mysqli_close($con);
?>