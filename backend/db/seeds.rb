# 読み込みたい順番で全`db/seeds/*.rb`のbasenameを配列を定義する
seeds = %w(users friends direct_message_groups direct_messages tags user_tags groups blogs blog_tags)

Rails.logger.info "Load all seed files 'db/seeds/*.rb'."
seeds.each do |seed|
  load(Rails.root.join('db/seeds/', "#{seed}.rb"))
end
