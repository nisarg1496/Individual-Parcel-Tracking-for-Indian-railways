<?php
    
    require "connection.php";
    
    if(isset($_POST["result1"], $_POST["result2"],$_POST["result3"],$_POST["result4"],$_POST["lost_stn"]))
    {
        date_default_timezone_set('Asia/Kolkata');
        $pkg_id = $_POST["result1"]; //takes the username
        //$name ="shraddha";
        $source = $_POST["result2"];  //takes the password
        //$password = "shraddha123";
        $destination = $_POST["result3"];
        $s_t_p = $_POST["result4"];  //takes the password
        //takes the password
        $lost_stn= $_POST["lost_stn"];
        $status='U';
        echo "$pkg_id";
        echo "$source";
        echo "$destination";
        $date = date("Y-m-d H:i:s");
        echo $date;
        
        
        //  $sql="INSERT INTO  package_train_mapping values (,b,123,0,,)";
        
      $stmt=mysqli_prepare($con,"INSERT INTO `lost_package` VALUES (null, ?, ?, ?, ?, ?);");
         mysqli_stmt_init($con);
        

        $executedata=mysqli_stmt_bind_param($stmt,"sssss",$pkg_id,$lost_stn,$source,$destination,$s_t_p);

    if( mysqli_stmt_execute($stmt))
    echo "success";
    $sql1="UPDATE package_train_mapping set load_unload_status='".$status."'  , unload_time='".$date."' ,unload_station='".$lost_stn."' where pkg_id='".$pkg_id."'";
                    $result=mysqli_query($con,$sql1);
                    if($result)
                    {
                        echo "success";
                    }
                    else
                        echo "mysqli_error($con)";
      mysqli_stmt_close($stmt);
        //mysqli_query($con,$sql2);
        mysqli_close($con);
        
    }
    ?>



