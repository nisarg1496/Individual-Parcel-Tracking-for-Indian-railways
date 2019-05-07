<?php
	
$servername = "192.168.1.100";
$username = "thompson";
$password = "root";
$databasename="indianrail";

	$con = mysqli_connect($servername,$username,$password,$databasename);

	if (!$con) {
    die("Connection failed: " .  mysqli_connect_error());
	}
	else{
		
	}

?>