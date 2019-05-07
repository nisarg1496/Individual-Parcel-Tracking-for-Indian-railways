<!DOCTYPE html>
<html>
<head>
	<title>
		
	</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

	<script type="text/javascript" src="../js/angular.min.js"></script>
	
	
</head>
<body >


	<SECTION ng-app="myapp" class="container " >
		<div class="panel" ng-controller="login" class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
			<div class="panel-body" style="margin-top:56px;">

				<form class="form-horizontal" name="userForm" novalidate>

					<div id="thompson" style="display:none;" class="alert alert-danger">
						
					</div>
					<div class="form-group">
						<label for="username" class="control-label col-sm-2">Username</label>
						<div class="col-sm-5">
							<input type="text" id="username" name="username" class="form-control" placeholder="username" ng-model="user.username" required>
							<span ng-show="userForm.username.$invalid && userForm.username.$touched" class="danger">
								Enter a username
							</span>


						</div>
						
					</div>

					<div class="form-group">
						<label for="username" class="control-label col-sm-2">Password</label>
						<div class="col-sm-5">
							<input type="password" id="pasword" name="password" class="form-control" placeholder="password" ng-model="user.password" required>
							<span ng-show="userForm.password.$invalid && userForm.password.$touched" class="danger">
								Password is Required
							</span>


						</div>
						
					</div>
					
					<button class="btn btn-primary btn-block btn-sm-5" ng-disabled="userForm.$invalid" ng-click="login()">Log in</button>
				</form>
			</div>
		</div>
	</SECTION>

	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		var app= angular.module("myapp",[]);
		app.controller("login",function($scope,$http){

			$scope.login = function()
			{
				var object=$scope.user;
				$http.post("../model/validate.php",{'username':object.username,'password':object.password}).success(function(data){

					if(data=="1")
					{
						window.location.href = "adduser.php";
					}
					else
					{
						 var msg ="<p>Username or Password are incorrect </p>";
         				 $("#thompson").html(msg).css('display','flex');
					}
				});
			}
		});
	</script>
</body>
</html>