class Menu < ApplicationRecord
    validates :nama, presence: true, uniqueness: true
    validates :deskripsi, length: { maximum: 150 }
    validates :harga, numericality: true
    validates_numericality_of :harga, :greater_than => 0.01

    belongs_to :kategori
end
