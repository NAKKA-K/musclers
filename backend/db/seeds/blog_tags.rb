tags = Tag.all

ActiveRecord::Base.transaction do
  Blog.limit(2).each do |blog|
      tags.sample(3).each do |tag|
          blog_tag = blog.blog_tags.create!(tag_id: tag.id)
          p "create blog tag #{blog_tag.id}, tag_id:#{tag.id}"
      end
  end
end
