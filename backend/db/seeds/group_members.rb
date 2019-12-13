Group.all.each do |item|
  users = User.pluck(:id).sample(3)
  users.each do |user_id|
    GroupUser.create(user_id: user_id,group_id: item.id)
  end
  p "create group users user_id:#{users}, group_id:#{item.id}"
end