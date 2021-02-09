class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :listing_id, :integer
  end
end
