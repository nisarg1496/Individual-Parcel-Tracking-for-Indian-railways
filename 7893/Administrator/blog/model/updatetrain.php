<?php
	require('connection.php');
	$data=json_decode(file_get_contents("php://input"),true);
	if(count($data) >0)
	{
		$pid=mysqli_real_escape_string($con,$data["tid"]);
		$package=mysqli_real_escape_string($con,$data["pid"]);
		$sql="update package_train_mapping set train_no=$pid,load_unload_status='l' where pkg_id='".$package."'";
		echo $sql;
		$result=mysqli_query($con,$sql);

		if(!$result)
		{
			echo "Something went wrong";

		}
		else{

			echo "Success";
		}
	}

?>