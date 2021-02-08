class CreateListings < ActiveRecord::Migration[4.2]
    def change
        create_table :listings do |t|
            t.string :title
            t.string :description
            t.float :price
            t.string :condition
            t.references :user_id
        end 
    end
end 