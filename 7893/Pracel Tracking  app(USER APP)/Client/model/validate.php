<?php
	require('connection.php');
	$userdata=json_decode(file_get_contents("php://input"),true);
	$package=mysqli_real_escape_string($con,$userdata["package"]);
	$a=2;
	$sql="select * from package_details where pkg_id='".$package."'";
	
	$result=mysqli_query($con,$sql);

	

	if($row = mysqli_fetch_assoc($result))
	{
		$a="1";
		$sql="select * from package_train_mapping where pkg_id='".$package."' and load_unload_status='P'";
		$result=mysqli_query($con,$sql);
		if($row=mysqli_fetch_assoc($result))
		{
			$a=$a."1";
		}
		else
		{
			$a=$a."2";
		}
	}
	echo json_encode($a);
	mysqli_close($con);
?>