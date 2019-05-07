<?php
require('connection.php');

	$userdata=json_decode(file_get_contents("php://input"),true);
	$btnName=mysqli_real_escape_string($con,$userdata["btnName"]);
	if (count($userdata)<=1) {
		die("no data ".count($userdata));
	}
	$name=mysqli_real_escape_string($con,$userdata["username"]);
	$pass=mysqli_real_escape_string($con,$userdata["password"]);
	$des=mysqli_real_escape_string($con,$userdata["designation"]);
	$station=mysqli_real_escape_string($con,$userdata["station"]);

	$station=explode('(', $station);


	$station_code=explode(')', $station[1]);


	if($btnName == "Update")
	{
		$id=mysqli_real_escape_string($con,$userdata["id"]);
		$sql="update staff set username='".$name."', password='".$pass."' ,staff='".$des."', staff_station_code='".$station_code[0]."' where staff_id = $id ";
		
	}
	else{
		$sql="insert into staff (staff_id,username, password, staff, staff_station_code) values (NULL,'".$name."','".$pass."','".$des."', '".$station_code[0]."')";
	}
	
	
	

	echo $sql;

	$result=mysqli_query($con,$sql);
	if(!$result)
	{
		echo "Something went wrong";
	}
?>
