app = angular.module('chatroom', [])
app.controller 'chatroomCtrl', ($scope, $http) ->
  
  chatroomId = window.location.pathname.slice "/"[2]
  getAllUsers = ->
    $http.get("/home/get_users").then (response) ->
      $scope.data.users = response.data
      return
    return

  $scope.addUser = (userId,chatroomId)->
    data = {user_id: userId, chatroom_id: chatroomId}
    $http.post(chatroomId + "/memberships", data).then (response) ->
      userData = response.data.user
      console.log userData
      $('#' + userData.id + '-add-member').parent().remove()
      $('#user-list').append memberAppendBuilder(userData)

  $scope.data = 
    users: []
  
  memberAppendBuilder = (userData) ->
    return "<li>" + userData.username + "</li>";
    

  getAllUsers()
  return
