<?php

    include_once("../model/connection.php");
    /*include_once('php/session.php');*/
    $rollno = 7775;
    /*$sql ="select * from studentinfo where rollno = ".$rollno;

    /*$result = mysqli_query($con,$sql);
    if(mysqli_num_rows($result) < 0){
    		echo "Unauthorized Access";
    }
    else{
    	$row = mysqli_fetch_assoc($result);
    */
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Student DataBank</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/card.css">


    <!-- Custom CSS -->
    <link href="../css/dashboard.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../fa/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/card.css">
    <script src="../js/angular.js"></script>
    <!-- <script src="../js/angular-route.min.js"></script> -->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">CRCE</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i><?php/* echo $row["name"]." ".$row["surname"];*/?> &nbsp;<i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="editprofile.php"><i class="fa fa-user fa-fw"></i> Edit Profile</a>
                        </li>
                        <li><a href="php/otpGenerator.php"><i class="fa fa-gear fa-fw"></i> Change Password</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="php/logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                      
                        <li>
                            <a href="#/student"><i class="fa fa-dashboard fa-fw"></i>List Students</a>
                        </li>
                        
                        <li>
                            <a href="#/addstudent"><i class="fa fa-table fa-fw"></i>Add Students</a>
                        </li>
                        <li>
                            <a href="#/leave"><i class="fa fa-edit fa-fw"></i>Manage Leave</a>
                        </li>
                        <li>
                            <a href="#/fund"><i class="fa fa-edit fa-fw"></i>Manage Fund</a>
                        </li>
                        <li>
                            <a href="#/approvefund"><i class="fa fa-edit fa-fw"></i>Approve Fund</a>
                        </li>
                     </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <?php /*
            }
            $con->close();*/
        ?>
        <div id="page-wrapper" style="margin-top: 3.7em;" >
            
            <div class="container-fluid" style="margin-top:110px;">
        <div ng-app="myleave" ng-controller="leavecontroller" ng-init="display()">
          
            <div class="card container-fluid">
                
                <form class="form-horizontal" role="form" name="leaveform" style="margin-top:20px;margin-bottom:20px">   
                                        
                                
                            <div class="form-group">
                                <label for="start_date" class="control-label col-md-2">From</label>
                                    <div class="col-sm-5 input-group date" data-formate="dd:mm:yy">
                                            <input type="date" placeholder="Start date" name="startdate" class="datepicker form-control" id="start_date" ng-model="start" required>
                                    </div>
                            </div>
                                         

                            <div class="form-group">
                                <label for="end_date" class="control-label col-md-2">TO</label>
                                        <div class="col-sm-5 input-group date">
                                            <input type="date" placeholder="End date" name="enddate" class="datepicker form-control" id="end_date" ng-model="end" required>
                                        </div>
                            </div>


                            <input type="hidden" ng-model="lid">
                                        
                            <button type="submit" class="btn btn-success col-sm-offset-6" ng-click="insertData()"  id="submitbutton" ng-disabled="end<start">{{btnName}}</button>
                           
                                        
                                        

                </form>

            </div>  
            
            <br>
     
            <!-- start of loading data to the table -->
            <div id="vacancydata">
                <table class="table  table-reponsive table-bordered table-striped">
                    <thead>
                        <tr>
                            <td><b>Leave ID</b></td>
                            <td><b>Start Date</b></td>
                            <td><b>End Date</b></td> 
                            <td><b>Status</b></td>
                            <td><b>Delete</b></td>
                        </tr>
                    </thead>

                    <tbody id="leavedata">

                        <!-- loads data from the vacanLoadData.php file -->
                        <tr ng-repeat="x in names">
                                <td>{{x.lid}}</td>
                                <td>{{x.sdate}}</td>
                                <td>{{x.edate}}</td>
                                <td>{{x.status}}</td>
                                
                                <td>
                                    <button class="btn btn-danger" ng-click="deleteData(x.lid)" ng-disabled="x.status != 'Requested'">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </td>
                                
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- End of loading data to the table -->

        </div>
    </div>









        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript 
    <script src="../js/morris.min.js"></script>
    <script src="../js/morris-data.js"></script>
    <script src="../js/raphael.min.js"></script>-->
   
    
    <script type="text/javascript" src="../js/leave.js"></script>
    <link href="css/bootstrap-datepicker.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="js/bootstrap-datepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript">
    $('.datepicker').datepicker( {format: 'yyyy-mm-dd'});
    </script>

</body>

</html>
