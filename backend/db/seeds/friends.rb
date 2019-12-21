test_user = User.first
users = User.where.not(id: test_user.id).limit(10)

users.each do |user|
  test_user.friends.create!(from_user: test_user, target_id: user.id, is_pending: false)
  p "create friend user_id:#{test_user.id},target_id:#{user.id}"
end
