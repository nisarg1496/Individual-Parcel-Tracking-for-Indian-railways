<?php
require('connection.php');

$sql ="select pm.*,pd.src_station_code,pd.dest_station_code ";
$sql.="from package_details as pd, package_train_mapping as pm ";
$sql.="where pd.pkg_id = pm.pkg_id and load_unload_status='l' ;";


$result=mysqli_query($con,$sql);
$output=array();
$finaloutput=array();
while($row=mysqli_fetch_assoc($result))
{
	
	$output['id']=$row['pkg_id'];
	$pkmid=$row['pkm_id'];
	$sql="select location from package_location where pkm_id=$pkmid order by time desc limit 1 ";
	$result1=mysqli_query($con,$sql);
	if($row1=mysqli_fetch_assoc($result1))
	{
		$output['currentlocation']=$row1['location'];
	}
	$output['train_number']=$row['train_no'];
	$output['loaded']=$row['load_time'];
	$output['source']=$row['src_station_code'];
	$output['destination']=$row['dest_station_code'];
	$finaloutput[]=$output;
	$output[]=$row;
}
 echo json_encode($finaloutput);
?>