Tag.names.each do |tag|
  p "create tag name number #{tag[1]}"
  Tag.create(name: tag[1])
end
