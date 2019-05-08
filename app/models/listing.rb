class Listing < ApplicationRecord
    belongs_to :user

    def self.search(term)
        if term
          where('title LIKE ?', "%#{term}%").order('id DESC')
        else
          order('id DESC') 
        end
    end

end
