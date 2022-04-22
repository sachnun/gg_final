class KategorisController < ApplicationController
    before_action :set_kategori, only: [:show, :update, :destroy]

    def index
        render json: {
            message: "Menampilkan semua kategori",
            kategoris: Kategori.all
        }
    end

    def show
        kategori_show(@kategori, "Kategori ditemukan")
    end

    def create
        @kategori = Kategori.new(kategori_params)

        if @kategori.save
            kategori_show(@kategori, "Kategori berhasil ditambahkan")
        else
            kategori_error(@kategori)
        end
    end

    def update
        if @kategori.update(kategori_params) then
            kategori_show(@kategori, "Kategori berhasil diupdate")
        else
            kategori_error(@kategori)
        end
    end

    def destroy
        if @kategori.destroy
            kategori_show(@kategori, "Kategori berhasil dihapus")
        else
            kategori_error(@kategori)
        end
    end

    private

    def set_kategori
        begin
            @kategori = Kategori.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {
                message: "Kategori tidak ditemukan"
            },
            status: :not_found
        end
    end

    def kategori_params
        params.permit(:nama)
    end

    def kategori_show(kategori, message)
        render json: {
            message: message,
            kategori: kategori
        }
    end

    def kategori_error(kategori)
        render json: kategori.errors, status: :unprocessable_entity
    end
end
