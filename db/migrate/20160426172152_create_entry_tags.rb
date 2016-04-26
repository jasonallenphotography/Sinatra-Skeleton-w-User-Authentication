class CreateEntryTags < ActiveRecord::Migration
  def change
    create_table :entry_tags do |t|
      t.references :entry, null: false
      t.references :tag, null: false

      t.timestamps null: false
    end
  end
end
