class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.integer :tag_id
      t.integer :article_id, null: false

      t.timestamps null: false
    end
    add_foreign_key :article_tags, :tags
    add_foreign_key :article_tags, :articles
  end
end
