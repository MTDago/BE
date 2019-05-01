class Listing < ApplicationRecord
    belongs_to :user, foreign_key: "user_name"
end
