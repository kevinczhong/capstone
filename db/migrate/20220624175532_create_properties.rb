class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :floor_space
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :balconies
      t.text :description
      t.string :address
      t.integer :floors
      t.integer :year_built
      t.boolean :is_rent
      t.integer :listed_price
      t.integer :rent
      t.string :lease_type
      t.boolean :pet_friendly
      t.date :list_date
      t.integer :user_id

      t.timestamps
    end
  end
end
