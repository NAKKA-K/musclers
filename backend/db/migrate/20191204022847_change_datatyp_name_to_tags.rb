class ChangeDatatypNameToTags < ActiveRecord::Migration[5.2]
  def change
    change_column :tags, :name, 'integer USING CAST(name AS integer)'
  end
end
