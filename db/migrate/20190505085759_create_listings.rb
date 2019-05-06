class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :price
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
