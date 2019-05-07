<?php

    require('connection.php');
    
if(isset($_POST["train_no"], $_POST["result1"], $_POST["result2"], $_POST["src_stn"], $_POST["compartment"]))
    {     
    date_default_timezone_set('Asia/Kolkata');
        $train_no = $_POST["train_no"];
        $pkg_id = $_POST["result1"]; 
        $weight= $_POST["result2"];
        $compartment= $_POST["compartment"];
        //takes the username
        //$name ="shraddha";
        $src_stn = $_POST["src_stn"];  //takes the password
        // //$password = "shraddha123";
        // $destination = $_POST["result3"];
        // $s_t_p = $_POST["result4"];  //takes the password
//takes the password
        // echo "$pkg_id";
        // echo "$train_no";
        // echo "$source";
        // echo "$destination";
        $date = date("Y-m-d H:i:s");
        // echo $date;
        $status="L";

        if($compartment=="Front_LR")
        {
                    $sql2="select flr_weight from trains where train_no=$train_no";

                    $result=mysqli_query($con,$sql2);
                    while ($row=mysqli_fetch_assoc($result)) {
                        $flr_weight=$row['flr_weight'];
                    }
                    $flr_weight=$flr_weight+$weight;
                    if($flr_weight<=3500)
                    {
                        $sql3="UPDATE trains set flr_weight=$flr_weight where train_no=$train_no";
                    mysqli_query($con,$sql3);
                    $sql1="UPDATE package_train_mapping set load_unload_status='".$status."'  , load_time='".$date."' , train_no= $train_no , load_station='".$src_stn."'where pkg_id='".$pkg_id."'";
                    $result=mysqli_query($con,$sql1);
                    $sql5="UPDATE package_details set compartment='".$compartment."' where pkg_id='".$pkg_id."'";
                    mysqli_query($con,$sql5);
                    //echo "\n".$flr_weight;
                       $sql6="select phone FROM contacts WHERE  cid=(
select sender_cid from package_details where pkg_id='".$pkg_id."'
)";
                    $result=mysqli_query($con,$sql6);

                    if($row=mysqli_fetch_assoc($result))
                    {

                        $phoneno="+91".$row["phone"];
                        $message="Your Package ".$pkg_id." is successfully loaded on train nos ".$train_no;
                        require('sendsms.php');

                        ozekiSend($phoneno,$message,$debug);
                    }
                }
                else
                    echo "FAIL K";

}
else if($compartment=="Rear_LR")
        {
                    $sql2="select rlr_weight from trains where train_no=$train_no";

                    echo $sql2;
                    $result=mysqli_query($con,$sql2);
                    while ($row=mysqli_fetch_assoc($result)) {
                        $rlr_weight=$row['rlr_weight'];
                    }
                    $rlr_weight=$rlr_weight+$weight;
                    if($rlr_weight<=3500)
                    {
                        $sql3="UPDATE trains set rlr_weight=$rlr_weight where train_no=$train_no";
                    mysqli_query($con,$sql3);
                    $sql1="UPDATE package_train_mapping set load_unload_status='".$status."'  , load_time='".$date."' , train_no= $train_no , load_station='".$src_stn."'where pkg_id='".$pkg_id."'";
                    $result=mysqli_query($con,$sql1);
                    $sql5="UPDATE package_details set compartment='".$compartment."' where pkg_id='".$pkg_id."'";
                    mysqli_query($con,$sql5);
                    echo "\n".$rlr_weight;


                    $sql6="select phone FROM contacts WHERE  cid=(
select sender_cid from package_details where pkg_id='".$pkg_id."'
)";
                    $result=mysqli_query($con,$sql6);

                     if($row=mysqli_fetch_assoc($result))
                    {

                        $phoneno="+91".$row["phone"];
                        $message="Your Package ".$pkg_id." is successfully loaded on train nos ".$train_no;
                        require('sendsms.php');

                        ozekiSend($phoneno,$message,$debug);
                    }
                }
                else
                    echo "FAIL Z";

}

        
      //  $sql="INSERT INTO  package_train_mapping values (,b,123,0,,)";

        
        

       // echo $sql1;
        //sql query used for checking login
        //$sql2="INSERT INTO traindata (train_no,load_stn,status) values ('".$source."','".$destination."', $status)";

        
      //mysqli_query($con,$sql);   // run the insert query
       
       
mysqli_close($con);

    }
?>
    