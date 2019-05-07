<!DOCTYPE html>
<html>
<head>
	<title>Track parcel</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/angular.min.js"></script>
</head>
<body ng-app="myapp" ng-controller="dataController" ng-init="manipulate()">
	<!-- start of toolbar -->
	<section id="navigationbar" class="navbar navbar-fixed-top">
		<!-- start of navigation -->
		<center>
			

			<!-- start of title -->
			<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
				<center>
					<h6 class="textcolor" style="font-size:20px;"><b>Track Parcel</b></h6>
				</center>
			</div>
			<!-- end of title -->
		</center>
		<!-- end of navigation -->


		<!-- start of the arrival date and station -->
		<div class="row">

			<div class="col-sm-6 col-lg-6 col-md-6 col-xs-6">
				<div>
					<center>
						<span class="textcolor">Arrival Time</span>
						<span><h4 class="textcolor toolbardata">{{latesttime}}</h4></span>

					</center>
				</div>
			</div>

			<div class="col-sm-6 col-lg-6 col-md-6 col-xs-6">
				<div>
					<center>
						<span class="textcolor">Latest Station</span>
						<span><h4 class="textcolor toolbardata">{{lateststation}}</h4></span>
					</center>
				</div>
			</div>

		</div>
		<!-- end of the arrival date and station -->
	</section>
	<!-- end of toolbar -->

	<!-- start of time line data-->
	<section class="panel list" >
		<ul class="list-group">
			<li class="list-group-item" ng-repeat="x in responseData">
				<div class="row">
					<div class="col-sm-3 col-lg-3 col-xs-3 col-md-3" style="padding-top: 10px;">
						{{x.time}}
					</div>
					<div class="col-sm-6 col-lg-6 col-xs-6 col-md-6">
							<h6><center>Package has reached {{x.station}}</center></h6>
					</div>
				</div>
			</li>

			

	</section>
	<!-- end of timeline data -->

	


	

	
  </div>
	<!-- loading script -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style type="text/css">
		
		.arrowlayout{
			padding-left: 29px;  /*This is used to set the position of the arrow*/
			padding-top: 16px;
		}

		#navigationbar{
			background-color: #FC5957;  /*Tomato color for background*/
			height:120px;
		}


		.textcolor{

			color: #FBFAF9;

		}

		.list{

			margin-top: 120px;
			margin-bottom: 0px;
		}

		.row{
			margin-left:0px;
			margin-right:0px;
		}

		.btn-color{
			/*color:;*/
			background-color:#23CAB8;
			border-color:transparent;
		}

		.databody{
			margin-bottom:23px;
			background-color:#ffffff;
			border:1px solid transparent;
			border-radius:3px;
			-webkit-box-shadow:0 1px 1px rgba(0,0,0,0.05);
			box-shadow:0 1px 1px rgba(0,0,0,0.05);
		}

		.toolbardata{
			margin-top:0px;
		}

	</style>

	<script type="text/javascript">
		
		var app= angular.module("myapp",[]);
		app.controller("dataController",function($scope,$http)
			{
				$scope.procesing=false;
				
				$scope.manipulate=function()
				{
					var data="<?php echo $_GET['package']?>";
					$http.post("test.php",{'packageid':data}).success(function(data)
						{
							
							var leng=data.length;
							
							$scope.responseData=data;
							$scope.lateststation=data[leng-1]["station"];
							$scope.latesttime=data[leng-1]["time"];			

						});
				}
			});
	</script>
	
</body>
</html>