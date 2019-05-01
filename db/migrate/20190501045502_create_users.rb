class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :user_name
      t.string :password
      t.float :rating
      t.integer :postcode
      t.integer :phone

      t.timestamps
    end
  end
end
