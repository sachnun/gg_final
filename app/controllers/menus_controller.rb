class MenusController < ApplicationController
    before_action :set_menu, only: [:show, :update, :destroy]

    def index
        render json: {
            message: "Menampilkan semua menu",
            menus: Menu.all
        },
        status: :ok
    end 

    def show
        menu_show(@menu, "Menu ditemukan")
    end

    def create
        @menu = Menu.new(menu_params)

        if @menu.save
            menu_show(@menu, "Menu berhasil ditambahkan")
        else
            menu_error(@menu)
        end
    end 

    def update
        if @menu.update(menu_params) then
            menu_show(@menu, "Menu berhasil diupdate")
        else
            menu_error(@menu)
        end
    end 

    def destroy
        if @menu.destroy
            menu_show(@menu, "Menu berhasil dihapus")
        else
            menu_error(@menu)
        end
    end

    private

    def set_menu
        begin
            @menu = Menu.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {
                message: "Menu tidak ditemukan"
            },
            status: :not_found
        end
    end

    def menu_params
        params.permit(:nama, :harga, :deskripsi, :kategori_id)
    end

    def menu_show(menu, message)
        render json: {
            message: message,
            menu: menu,
            kategoris: menu.kategori
        },
        status: :ok
    end

    def menu_error(menu)
        render json: menu.errors, status: :unprocessable_entity
    end
end
