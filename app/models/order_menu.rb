class OrderMenu < ApplicationRecord    
    validates :menu_id, presence: true
    validates :order_id, presence: true
    validates :porsi, presence: true, numericality: true
    validates :porsi, numericality: { greater_than: 0 }

    belongs_to :order
    belongs_to :menu 

    def set_menu_harga
        self.harga = self.menu.harga
        self.total_harga = self.harga * self.porsi
        self.save

        self.order.set_total_bayar
    end

    def set_total_harga
        self.total_harga = self.harga * self.porsi
        self.save

        self.order.set_total_bayar
    end
end
