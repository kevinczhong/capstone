class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.date :date
      t.integer :property_id

      t.timestamps
    end
  end
end
