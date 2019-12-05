ActiveRecord::Base.transaction do
  test_user = User.first
  DirectMessageGroup.where(by_user_id: test_user.id).each do |dm_group|
    p "create direct message direct_message_group_id: #{dm_group.id}"
    test_user.send_users.create!(
      body: Faker::Lorem.sentence(word_count: Faker::Number.number(digits: 2)),
      direct_message_group_id: dm_group.id
    )
  end
end
