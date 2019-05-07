<?php
	require('connection.php');
	$data=json_decode(file_get_contents("php://input"),true);
	if(count($data) >0)
	{
		$id=mysqli_real_escape_string($con,$data["staffid"]);

		$sql="delete from staff where staff_id =$id ";

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