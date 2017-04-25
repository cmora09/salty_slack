App.onlinestatus = App.cable.subscriptions.create({
  channel: "OnlinestatusChannel"
  room: window.location.pathname.split('/')[2]
  },
  received: (data) ->
    membership = JSON.parse(data)
    if membership.online == true
      $(userImgIdConstructor(membership)).attr 'class', 'active'
    if membership.online == false
      $(userImgIdConstructor(membership)).attr 'class', 'inactive'
    return
  )

userImgIdConstructor = (membership) ->
  '#' + membership.user_id + '-status'