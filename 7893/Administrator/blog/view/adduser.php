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

	<div class="container-fluid" ng-controller="usercontroller" ng-init="displayData()">
	

		<div class="panel">
			<div class="panel-header panel-success">

			</div>

			<div class="panel-body">

				<form class="form-horizontal" name="user" novalidate>
					
					<div class="form-group">
						<label for="username" class="control-label col-sm-2">Username</label>
						
						<div class="col-sm-9"> <!--Username-->
							<input type="text" id="username" name="username" class="form-control col-sm-5" placeholder="Enter a username" ng-model="userModel.username" ng-required="true">	
							<span ng-show="user.username.$touched  && user.username.$invalid" class="danger">Username is Required </span>
						</div>
						
					</div>


					<div class="form-group"> <!--Password-->
						<label for="pass" pattern=".{6,}" class="control-label col-sm-2">Password</label>
						
						<div class="col-sm-9"> 
							<input type="password" id="pass" name="password" class="form-control col-sm-5" placeholder="Enter a password" ng-model="userModel.password" required>	
							<span ng-show="user.password.$touched  && user.password.$invalid" class="danger">Password must be at least 6 character</span>
						</div>
					</div>


					<!-- designation -->
					<div class="form-group">
						<label for="des" class="col-sm-2 control-label">Designaiton</label>
						
						<div class="col-sm-9">
							<input type="text" name="designation" placeholder="Enter a Designaiton" class="form-control col-sm-5" ng-model="userModel.designation" pattern="[a-Z]+" required>	
							<span ng-show="user.designation.$touched && user.designation.$invalid" class="danger">
								Designation is must
							</span>
						</div>

					</div>

					<!-- station code -->
					<div class="form-group">
						<label for="station" class="control-label col-sm-2" >Duty Station</label>
						<div class="col-sm-9">
							<select class="form-control col-sm-5" name="station" id="course" ng-model="userModel.station" placeholder="Select a station" required>

																	<?php
		                                                                require('../model/connection.php');
		                                                                $sql="select station_code,station_name from stations order by station_name asc";
		                                                                $result=mysqli_query($con,$sql);
		                                                                $count=1;
		                                                                while($row=mysqli_fetch_assoc($result))
		                                                                { 

		                                                                    echo "<option vaule=\"$count\">";
		                                                                    echo $row["station_name"]." (".$row["station_code"].")";
		                                                                    echo "</option>";
		                                                                    $count++;
		                                                             
		                                                                }
		                                                                mysqli_close($con);
		                                                             ?>
								
							</select>

							<span ng-show="user.station.$touched && user.station.$invalid" pattern="[a-Z]+" class="danger">Select an appropriate station</span>	
						</div>

				

					</div>

					<input type="hidden" name="staffid" ng-model="userModel.staffid">
					<button class="btn btn-success btn-md-block btn-sm-5 pull-right" ng-click="insertData()" ng-disabled="user.$invalid || {{user.stat}}">{{btnName}}</button>

					
				</form>

			</div>

		</div>
		
			<div>

				<div class="inner-addon right-addon">
					<i class="glyphicon glyphicon-search"></i>
					<input type="text" placeholder="search employee" class="panel" ng-model="search">	
				</div>

				<div id="tabledata" class="table-responsive" >
			                    

			                    <table class="table table-bordered table-striped">
			                        <thead>
			                            <tr>
			                                <td><b>ID</b></td>
			                                <td><b>Username</b></td>
			                                <td><b>Password</b></td> 
			                                <td><b>designation</b></td>
			                                <td><b>Working Station</b></td>
			                                <td><b>Operation</b></td>
			                                
			                            </tr>
			                        </thead>

			                        <tbody>
			                            <tr ng-repeat="x in responseData | filter:search">
			                                <td>{{x.staff_id}}</td>
			                                <td>{{x.username}}</td>
			                                <td>{{x.password}}</td>
			                                <td>{{x.staff}}</td>
			                                <td>{{x.staff_station_code}}</td>
			                                <td>
			                                    <button class="btn btn-info" ng-click="updateData(x.staff_id,x.username,x.password,x.staff,x.staff_station_code)">
			                                        <span class="glyphicon glyphicon-pencil"></span>

			                                    </button>

			                                    <button class="btn btn-danger" ng-click="deleteData(x.staff_id)">
			                                        <span class="glyphicon glyphicon-trash"></span>
			                                    </button>

			                                </td>
			                                
			                            </tr>
			                        </tbody>

			                    </table>
			    </div>

			</div>

	</div>

	<!-- include the required file -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/user.js"></script>
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