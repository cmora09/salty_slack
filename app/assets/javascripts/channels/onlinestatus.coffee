App.onlinestatus = App.cable.subscriptions.create({
  channel: "OnlinestatusChannel"
  room: window.location.pathname.split('/')[2]
  },
  received: (data) ->
    console.log data
    if data.online == true
      $(userImgIdConstructor(data)).attr 'class', 'active'
    if data.online == false 
      $(userImgIdConstructor(data)).attr 'class', 'inactive'
    return
  )

userImgIdConstructor = (data) ->
  '#' + data.user_id + '-status'