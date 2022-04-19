class Menu < ApplicationRecord
    validates :nama, presence: true, uniqueness: true
    validates :harga, presence: true, numericality: { greater_than: 0.01 }
    validates :deskripsi, length: { maximum: 150 }

    has_many :menu_kategoris
    has_many :kategori, through: :menu_kategoris
end
