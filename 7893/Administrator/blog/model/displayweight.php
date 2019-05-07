<?php
	require('connection.php');
	$sql="select * from trains order by train_no";
	$result=mysqli_query($con,$sql);
	$output=array();
	$row=array();
	while($temp=mysqli_fetch_assoc($result))
	{	
		$row["trainno"]=$temp["train_no"];
		$row["source"]=$temp["src_station_code"];
		$row["destination"]=$temp["dest_station_code"];
		$row["depart_time"]=date("g:i a",strtotime($temp["depart_time"]));
		$row["arrival_time"]=date("g:i a",strtotime($temp["arrival_time"]));
		$row["flr"]=$temp["flr_weight"];
		$row["rlr"]=$temp["rlr_weight"];
		$output[]=$row;
	}


	echo json_encode($output);
	mysqli_close($con);

?>