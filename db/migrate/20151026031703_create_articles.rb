class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :text

      t.timestamps null: false
    end
    add_index :articles, :name
  end
end
