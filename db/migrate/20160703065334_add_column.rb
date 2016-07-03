class AddColumn < ActiveRecord::Migration
  def change
    add_column :articles, :is_presented, :boolean, :default => false
  end
end
