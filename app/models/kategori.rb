class Kategori < ApplicationRecord
    validates :nama, presence: true

    has_many :menus
end
