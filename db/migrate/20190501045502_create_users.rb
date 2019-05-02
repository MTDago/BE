class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.float :rating
      t.integer :postcode, null: false
      t.integer :phone, null: false

      t.timestamps
    end
  end
end
