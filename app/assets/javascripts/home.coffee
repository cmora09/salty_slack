app = angular.module('home', ['ngRoute'])

app.controller 'homeCtrl', ($scope, $http) ->

  getChatrooms = ->
    $http.get('/home/get_chatrooms').then (response) ->
      $scope.data.chatrooms = response.data
      return
    return

  $scope.data = chatrooms: []
  getChatrooms()
  return

# app.config ($routeProvider)->
	
# 	$routeProvider.when('/chatrooms/:id', 
# 		templateUrl: '<%= asset_path("show.html") %', 
# 		controller: 'homeCtrl')
# 	# .when('/red', templateUrl: 'red.htm')
# 	# .when('/green', templateUrl: 'green.htm')
# 	# .when '/blue', templateUrl: 'blue.htm'
# return


