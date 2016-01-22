class CreatePortfolio < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
    	t.string :name
    	t.text :description
    	t.string :url
    	t.integer :viewed_times
    	t.attachment :cover
    	t.timestamps
    end
  end
end
