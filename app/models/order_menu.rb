class OrderMenu < ApplicationRecord
    validates :porsi, numericality: { greater_than: 0 }

    belongs_to :order
    belongs_to :menu 

    def self.total_harga
        return sum(:harga)
    end
end
