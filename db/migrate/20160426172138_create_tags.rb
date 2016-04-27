class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user
      t.string :title, uniqueness: true, null: false

      t.timestamps null: false
    end
  end
end
