    tags = Tag.names.values
    Blog.limit(2).each do |item|
        tags.sample(3).each do |number|
            item.blog_tags.create(tag_id: number)
            p "create blog tag tag_id:#{number}"
        end
    end

