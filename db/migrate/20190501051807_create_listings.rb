class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :product_name
      t.float :product_price
      t.text :product_description
      t.string :product_image
      t.string :product_duration
      t.string :order_status
      t.string :user_name

      t.timestamps
    end
  end
end
