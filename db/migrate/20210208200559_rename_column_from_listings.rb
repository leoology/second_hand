class RenameColumnFromListings < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :user_id_id, :user_id

  end
end
