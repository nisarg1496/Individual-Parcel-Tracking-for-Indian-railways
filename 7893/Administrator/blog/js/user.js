var app = angular.module("myapp",[]);
	app.controller("usercontroller",function($scope,$http){



		$scope.displayData = function(){

			$http.get("../model/displayuser.php",{}).success(function(data){

				$scope.responseData=data;
			});
			$scope.btnName="Submit";
		}

		$scope.insertData =function(){
			var userObject=$scope.userModel;
			if(userObject.station != "")
			{
				$http.post("../model/insertuser.php",
							{
								'username':userObject.username,
								'password':userObject.password,
								'designation':userObject.designation,
								'station':userObject.station,
								'btnName':$scope.btnName,
								'id':$scope.userModel.staffid
							}
						  ).success(function(data){
								$scope.userModel.username=null;
								$scope.user.username.$touched=false;
								$scope.user.username.$untouched=true;
								$scope.userModel.password=null;
								$scope.user.password.$touched=false;
								$scope.user.password.$untouched=true;
								$scope.userModel.designation=null;
								$scope.user.designation.$touched=false;
								$scope.user.designation.$untouched=true;
								$scope.displayData();
						  });
			}
			else
			{
				alert("select a station code");
			}
		}

		$scope.updateData =function(id,username,password,designation,code){

			$scope.userModel.staffid=id;
			$scope.userModel.username=username;
			$scope.userModel.password=password;
			$scope.userModel.designation=designation;
			$scope.userModel.station=code;
			$scope.btnName="Update";

		}

		$scope.deleteData= function(id){

			$http.post("../model/deleteuser.php",
							{
								'staffid':id
							}
						  ).success(function(data){
						  	$scope.displayData();
						  });
		}
	});