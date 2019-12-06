ActiveRecord::Base.transaction do
  test_user = User.first
  User.where.not(id: test_user.id).limit(5).each do |item|
    p "create dm group by_user_id:#{test_user.id} to_user_id:#{item.id}"
    test_user.by_users.create!(to_user_id: item.id)
  end
end
