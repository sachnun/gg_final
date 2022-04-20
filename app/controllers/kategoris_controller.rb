class KategorisController < ApplicationController
    def index
        render json: {
            message: "Menampilkan semua kategori",
            kategoris: Kategori.all
        }
    end 
end
