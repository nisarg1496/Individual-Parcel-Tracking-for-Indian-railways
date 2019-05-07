<?php
	require('connection.php');

	$rowperpage=5;
	$page=$_GET['page'];
	$page=$page-1;
	$p=$page * $rowperpage;

	$sql1="select * from staff";
	$result1=mysqli_query($con,$sql1);

	$sql="select * from staff limit  $p , $rowperpage";
	$result=mysqli_query($con,$sql);

	$count=mysqli_num_rows($result1);
	while($row=mysqli_fetch_assoc($result))
	{
		echo "<pre>";
		echo $row['staff_id']."=>".$row['username'];
		echo "</pre>";
	}

	$maxrecord=$p + $rowperpage;
	
	if($_GET['page'] > 1)
	{
		$prepage=$_GET['page'] - 1;
		echo "<a href=page.php?page=$prepage>Prev</a>   ";
	}
	
	echo "$count";
	if($count > $maxrecord)
	{
		$nextpage=$_GET['page'] +1;
		echo "  <a href=page.php?page=$nextpage>Next</a>";
	
	}
	mysqli_close($con);	
?>