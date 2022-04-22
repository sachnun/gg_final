class Order < ApplicationRecord
    # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :status, inclusion: { in: %w(new paid cancelled) }

    has_many :order_menus
    has_many :menus, through: :order_menus

    def set_total_bayar
        self.total_bayar= self.order_menus.sum(:total_harga)
        self.save
    end
end
