

<?php

   // require "connection.php";
        require('connection.php');

    
if(isset($_POST["name"], $_POST["password"]))
    {     
 
    $name = $_POST["name"]; //takes the username
       //$name _PO_POSTST="admin";
        $password = $_POST["password"];  //takes the password
      //$password = "pass";
        
      
        mysqli_stmt_init($con);
        $stmt=mysqli_prepare($con,"SELECT username, password FROM staff WHERE username= ? AND   password= ?");

        $executedata=mysqli_stmt_bind_param($stmt,"ss",$name,$password);

        mysqli_stmt_execute($stmt);
       // mysqli_stmt_POST_result($stmt);
        mysqli_stmt_bind_result($stmt,$name1,$password1);
        $user=array();
// if($name1==NULL)
// {
//     echo "invalid user";
// }
// else{

        if(mysqli_stmt_fetch($stmt))
        {
           
           
            $user['result']="success";

        }
        else{

            $user['result']="failed";
        }
        
       echo json_encode($user);
        mysqli_stmt_close($stmt);
  //sql query used for checking login
        
        }
        
        // if(!mysqli_num_rows($result1) > 0 ) // check if the number of row return is not greater than 1
        // {
            
        //     echo "invalid user";      // print invalid user
        // }
 // }


mysqli_close($con);


?>
