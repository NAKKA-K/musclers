tag_number = Tag.names.values
User.limit(4).each do |user|
  tag_number.sample(3).each do |number|
    user.user_tags.create(tag_id: number)
    p "create user tag user_id:#{user.id},tag_id:#{number}"
  end
end