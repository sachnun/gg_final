class Menu < ApplicationRecord
    has_many :menu_kategoris
    has_many :kategori, through: :menu_kategoris
end
