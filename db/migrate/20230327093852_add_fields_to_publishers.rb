class AddFieldsToPublishers < ActiveRecord::Migration[7.0]
  def change
    add_column :publishers, :username, :string
    add_column :publishers, :bio, :text
  end
end
