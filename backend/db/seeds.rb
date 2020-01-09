# 読み込みたい順番で全`db/seeds/*.rb`のbasenameを配列を定義する
seeds = %w(users friends direct_message_groups direct_messages tags groups group_members information blogs blog_tags group_messages)

Rails.logger.info "Load all seed files 'db/seeds/*.rb'."
seeds.each do |seed|
  load(Rails.root.join('db/seeds/', "#{seed}.rb"))
end
