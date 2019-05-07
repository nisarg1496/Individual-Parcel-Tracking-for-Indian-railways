var app = angular.module("myapp",[]);
	app.controller("updatepackagecontroller",function($scope,$http){



		$scope.displayData = function(){

			$http.get("../model/DisplayUpgrade.php",{}).success(function(data){

				$scope.data=data;
			});
		}

	});


//	select  pkg_id,train_no from package_train_mapping,