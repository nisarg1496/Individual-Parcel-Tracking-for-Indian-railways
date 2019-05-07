<?php
	session_start();
	$_SESSION["status"]=false;
	session_destroy();

	header("location:../view/login.php");
?>