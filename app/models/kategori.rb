class Kategori < ApplicationRecord
    has_many :menu_kategoris
    has_many :menus, through: :menu_kategoris
end
