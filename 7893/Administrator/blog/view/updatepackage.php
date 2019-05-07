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
	<title>Update package</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	
	<script type="text/javascript" src="../js/angular.min.js"></script>
</head>
<body ng-app="myapp">


	<header id="headerbar">
		
	</header>


	<!-- logic to update package id -->
	<div id="pagecontain" ng-controller="updatepackagecontroller"  class="container-fluid" ng-init="displayData()">
		<!-- start of the udapte panel form -->
		<div class="panel">
			
			<!-- start of the panel body -->

			<div class="panel-body">
					
				<!-- start of form -->
				<form name="updateData" class="horizontal-form">
					
					<!-- start of name field -->
					<div class="form-group">
						<label class="control-label sr.only" for="name">Name</label>
					</div>

					<!-- end of name field -->

				</form>
				<!-- end of form -->
			</div>
			<!-- end of the panel body -->

		</div>
		<!-- end of the udapte panel form -->


		<div class="inner-addon right-addon">
			<i class="glyphicon glyphicon-search"></i>
			<input type="text" placeholder="search Package" class="panel" ng-model="search">	
		</div>
		<div class="table-responsive">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<td><b>Package id</b></td>
						<td><b>Loaded Train no</b></td>
						<td><b>Source station</b></td>
						<td><b>Destnation station</b></td>
						<td><b>Load Time</b></td>
						<td><b>Current position</b></td>
						<!--<td><b>Package Type</b></td>
						<td><b>Transport Type</b></td> -->
					</tr>
				</thead>
				<tbody ng-repeat="package in data | filter:search">
					<tr>
						<td>{{package.id}}</td>
						<td>{{package.train_number}}</td>
						<td>{{package.source}}</td>
						<td>{{package.destination}}</td>
						<td>{{package.loaded}}</td>
						<td>{{package.currentlocation}}</td>
						<!--<td>{{package.packagetype}}</td>
						<td>{{package.transport}}</td> -->
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- include the required file -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/upgrade.js"></script>
	<script type="text/javascript">
		$("#headerbar").load("header.php");
	</script>
</body>
</html>