<?php
	require('connection.php');
	$sql="select * from staff order by staff_id";
	$result=mysqli_query($con,$sql);
	$output=array();
	while($rows=mysqli_fetch_assoc($result))
	{
		$output[]=$rows;
	}


	echo json_encode($output);
	mysqli_close($con);
?>