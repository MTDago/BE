class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :product_name, null: false
      t.float :product_price, null: false
      t.text :product_description, null:false
      t.string :product_image
      t.string :product_duration
      t.string :order_status
      t.string :user_name

      t.timestamps
    end
  end
end
