<?php
session_start();

if(!$_SESSION["status"])
{
	header("location:login.php");
}

?><!DOCTYPE html>
<html>
<head>
	<title>Add user</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	
	<script type="text/javascript" src="../js/angular.min.js"></script>
</head>
<body  ng-app="myapp" >



	<header id="headerbar" style="margin-bottom:100px;">
		
	</header>

	<div class="container-fluid" id="pageheader" ng-controller="lostcontroller" ng-init="displayData()">

		<div class="panel">
			<div class="panel-body">
				<div>
					<form name="package">
					
						<div class="form-group">
							<label for="des" class="col-sm-2 control-label">Train no</label>
									
							<div class="col-sm-9">
								<input type="text" name="tarino" placeholder="Train No goes here" class="form-control col-sm-5" ng-model="package.traino" pattern="[a-Z]+" required>	
								<span ng-show="package.traino.$touched && package.traino.$invalid" class="danger">
										
								</span>
							</div>
						</div>
						<input type="hidden" name="packageid" ng-model="pacakge.packageid">
						<button class="btn btn-success btn-md-block btn-sm-5 pull-right" ng-click="update()" ng-disabled="package.$invalid">{{btnName}}</button>
					</form>
				</div>
			</div>
		</div>

		<div class="table-responsive">

			<div class="inner-addon right-addon pull-right">
				<i class="glyphicon glyphicon-search"></i>
				<input type="text" placeholder=" search package" class="panel" ng-model="search">	
			</div>
			
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<td><b>Package id</b></td>
						<td><b>Train no</b></td>
						<td><b>Source Station</b></td>
						<td><b>Destination station</b></td>
						<td><b>Misplaced station</b></td>
						<td><b>Transport Type</b></td>
						<td><b>Operation</b></td>
					</tr>
				</thead>

				<tbody>

					<tr ng-repeat="info in data | filter:search">

						<td>{{info.pkg_id}}</td>
						<td>{{info.train_no}}</td>
						<td>{{info.souce_station}}</td>
						<td>{{info.dest_station}}</td>
						<td>{{info.lost_station}}</td>
						<td>{{info.scale_transport_type}}</td>
						<td>
							<button class="btn btn-danger" ng-click="setData(info.pkg_id,info.train_no)">
			                    <span class="glyphicon glyphicon-pencil"></span>
      		                </button>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		
	</div>
	<!-- include the required file -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/lostpackage.js"></script>
	<script type="text/javascript">
		$("#headerbar").load("header.php");
	</script>
</body>



</html>