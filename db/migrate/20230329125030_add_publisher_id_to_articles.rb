class AddPublisherIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :publisher_id, :integer
  end
end
