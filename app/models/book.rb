class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    scope :search_by_title, ->(title) {where("title like ?", "%#{title}%")}
    
    def titleize
        self.split(" ").map{|word| word.capitiaze}.join(" ")
    end

end
