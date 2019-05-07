<?php
require('model/connection.php');
//$package="1LTT201704021705161";

 $data=json_decode(file_get_contents("php://input"),true);
 $package=mysqli_real_escape_string($con,$data["packageid"]);

// fetch data for loading
$sql="select load_station,load_time from package_train_mapping where pkg_id='".$package."';";
$result=mysqli_query($con,$sql);
$foutput=array();
$output=array();
while($row=mysqli_fetch_assoc($result))
{			
	
			$output["station"]=$row["load_station"];
			$output["time"]=date("j M Y g:i a",strtotime($row["load_time"]));
			$foutput[]=$output;
}


//fetch data for in transit 
$sql="select * from package_location where pkm_id=(select pkm_id from package_train_mapping where pkg_id = '" .$package."') order by time ASC";
$result=mysqli_query($con,$sql);
while($row=mysqli_fetch_assoc($result))
{			
	
			$output["station"]=$row["station_name"];
			$output["time"]=date("j M Y g:i a",strtotime($row["time"]));
			$foutput[]=$output;
}


// //fetch data for unload
$sql="select unload_station,unload_time from package_train_mapping where pkg_id='".$package."'";
$result=mysqli_query($con,$sql);
while($row=mysqli_fetch_assoc($result))
{			
	
			
			if($row["unload_time"]==NULL)
			{

			}
			else
			{

				$output["station"]="\nunloaded at ".$row["unload_station"];
				$output["time"]=date("j M Y g:i a",strtotime($row["unload_time"]));	
			}
			$foutput[]=$output;
}


	echo json_encode($foutput);
	mysqli_close($con)
?>
