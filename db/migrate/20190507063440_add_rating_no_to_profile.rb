class AddRatingNoToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :rating_no, :integer, default: 0
  end
end
