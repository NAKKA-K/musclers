test_user = User.first
(2..11).each do |number|
  test_user.friends.create(target_id: number,is_pending: false)
  p "create friend user_id:#{test_user.id},target_id:#{number}"
end