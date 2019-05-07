<?php
	require('connection.php');

	$sql="select lp.*,pm.train_no from package_train_mapping as pm ,lost_package as lp WHERE lp.pkg_id= pm.pkg_id";

	echo $sql;

	$result=mysqli_query($con,$sql);
	$output=array();

	while($row=mysqli_fetch_assoc($result))
	{
		$output[]=$row;
	}

	echo json_encode($output);
	mysqli_close($con);

?>