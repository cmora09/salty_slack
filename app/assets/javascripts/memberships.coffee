# $(document).ready ->
#   $('#add-users input').on 'click', ->
#     userId = $(this).attr('id').split('-')[0]
#     data = user_id: userId
#     $.ajax(
#       url: @action
#       data: data
#       method: 'post').success (res) ->
#       userData = JSON.parse(res)
#       $('#' + userData.id + '-add-member').parent().remove()
#       $('#member-list').append memberAppendBuilder(userData)
#       return
#     return
#   return

# memberAppendBuilder = (userData) ->
#   '<li>' + userData.username + '</li>'

# app = angular.module('members', [])
# app.controller 'mbrsCtrl', ($scope, $http) ->

#   $http.post('/memberships/create').then (response) ->
#     $scope.data.chatrooms = response.data
#     return
#     return

#   $scope.data = chatrooms: []
#   getChatrooms()
#   return
