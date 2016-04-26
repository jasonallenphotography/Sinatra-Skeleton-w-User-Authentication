class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user, null: false
      t.string :title, uniqueness: true, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
