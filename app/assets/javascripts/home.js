var app = angular.module('home', []);
app.controller('homeCtrl', function($scope,$http){
	$scope.data ={
		chatrooms: []
	}
	getchannels();
	function getChatrooms(){
		$http.get('/home/get_chatrooms')
			.then(function(response){
				$scope.data.chatrooms = response.data;
				console.log($scope.data.chatrooms);
			})
	}
});	
