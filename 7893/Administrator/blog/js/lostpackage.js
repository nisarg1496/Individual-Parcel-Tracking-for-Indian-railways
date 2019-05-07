var app = angular.module("myapp",[]);
	app.controller("lostcontroller",function($scope,$http){



		$scope.displayData = function(){

			$http.get("../model/displayLost.php",{}).success(function(data){

				$scope.data=data;
			});
			$scope.btnName="Submit";
		}

		$scope.setData= function(packageid,trainno){
			$scope.package.traino=trainno;
			$scope.package.packageid=packageid;
			$scope.btnName="update";
		}

		$scope.update=function(){



			$http.post("../model/updatetrain.php",
					{'tid':$scope.package.traino,'pid':$scope.package.packageid}
				).success(function(data){

				alert(data);
				$scope.displayData();
				$scope.btnName="Submit";
				$scope.package.traino=null;
				$scope.package.traino.$touched=false;
				$scope.pacakge.traino.$untouched=true;
			});

		}
	
	});