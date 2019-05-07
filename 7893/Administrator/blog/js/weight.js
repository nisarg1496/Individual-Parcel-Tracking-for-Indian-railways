var app = angular.module("myapp",[]);
	app.controller("weightcontroller",function($scope,$http){



		$scope.displayData = function(){

			$http.get("../model/displayweight.php",{}).success(function(data){

				$scope.responseData=data;
			});
			$scope.btnName="Submit";
		}

		

	});