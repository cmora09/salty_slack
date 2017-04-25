app = angular.module('home', [])
app.controller 'homeCtrl', ($scope, $http) ->

  getChatrooms = ->
    $http.get('/home/get_chatrooms').then (response) ->
      $scope.data.chatrooms = response.data
      return
    return

  $scope.data = chatrooms: []
  getChatrooms()
  return