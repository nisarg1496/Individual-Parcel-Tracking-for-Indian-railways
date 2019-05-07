<?php

session_start();
if(!$_SESSION["status"])
{
	header("location:login.php");
}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Estimate weight</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	
	<script type="text/javascript" src="../js/angular.min.js"></script>
</head>
<body  ng-app="myapp" >



	<header id="headerbar" style="margin-bottom:100px;">
		
	</header>

	<div class="container-fluid" ng-controller="weightcontroller" ng-init="displayData()">
	

		
			<div>

				<div class="inner-addon right-addon">
					<i class="glyphicon glyphicon-search"></i>
					<input type="text" placeholder="Search Train" class="panel" ng-model="search">	
				</div>

				<div id="tabledata" class="table-responsive" >
			                    

			                    <table class="table table-bordered table-striped">
			                        <thead>
			                            <tr>
			                                <td><b>Train no</b></td>
			                                <td><b>Source station</b></td>
			                                <td><b>Destination station</b></td> 
			                                <td><b>Departure time</b></td>
			                                <td><b>Arrival time</b></td>
			                                <td><b>Flr weights in grams</b></td>
			                                <td><b>RLR weights in grams</b></td>
			                                
			                            </tr>
			                        </thead>

			                        <tbody>
			                            <tr ng-repeat="x in responseData | filter:search">
			                                <td>{{x.trainno}}</td>
			                                <td>{{x.source}}</td>
			                                <td>{{x.destination}}</td>
			                                <td>{{x.depart_time}}</td>
			                                <td>{{x.arrival_time}}</td>
			                                <td>{{x.flr}}</td>
			                                <td>{{x.rlr}}</td>
			                                
			                            </tr>
			                        </tbody>

			                    </table>
			    </div>

			</div>

	</div>

	<!-- include the required file -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/weight.js"></script>
	<script type="text/javascript">
		$("#headerbar").load("header.php");
	</script>
</body>


<style type="text/css">
	
	.danger{
		color:red;
	}



	select.ng-invalid.ng-touched{
		border-bottom:1px solid red;
	}

</style>
</html>