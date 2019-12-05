class ChangeDatatypNameToTags < ActiveRecord::Migration[5.2]
  def change
    Tag.names.each do |tag|
      Tag.where(name: tag[0]).update_all(name: tag[1])
    end

    change_column :tags, :name, 'integer USING CAST(name AS integer)'
  end
end
