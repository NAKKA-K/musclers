tag_number = [0,1,2,3,4,5,6,7,8,9,10]
User.limit(4).each do |user|
  tag_number.sample(3).each do |number|
    user.user_tags.create(tag_id: number)
    p "create user tag user_id:#{user.id},tag_id:#{number}"
  end
end