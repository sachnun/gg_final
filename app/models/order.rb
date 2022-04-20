class Order < ApplicationRecord
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :status, inclusion: { in: %w(new paid cancelled) }

    has_many :order_menus
    has_many :menus, through: :order_menus
end
