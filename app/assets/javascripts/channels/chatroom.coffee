App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.body.blank?
    	$('#messages-table').append '<div class="panel panel-success"  id="message">' + '<p class="text-primary">' + '<strong>' + data.user + '</strong>' + ': ' + data.body + '</p>' + '</div>'
    	scroll_bottom()

$(document).on 'turbolinks:load', ->
	submit_message()
	scroll_bottom()

submit_message = ()->
	$("#message_body").on 'keydown', (event) ->
		if event.keyCode is 13
			$('input').click()
			event.target.value = ''
			event.preventDefault()

scroll_bottom = ()->
	$('#messages-table').scrollTop($('#messages-table')[0].scrollHeight)