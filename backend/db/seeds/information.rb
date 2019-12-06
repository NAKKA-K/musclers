genre_number = Information.genres.values
first_user = User.first
send_messages = DirectMessage.where.not(send_user_id:first_user.id)
send_users = send_messages.map {|item| item.send_user_id}.uniq
users = User.where(id:send_users)
information = send_messages.map do |item|
  {
    genre: genre_number[2],
    by_name: users.find {|user| user.id === item.send_user_id}.nickname,
    link: "/direct_messages/#{item.direct_message_group_id}",
    is_read: false,
    user_id: first_user.id,
  }
end

information.each do |item|
  Information.create(item)
  p "create Information by_name:#{item[:by_name]}, link:#{item[:link]}"
end