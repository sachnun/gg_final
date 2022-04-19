class MenusController < ApplicationController
    def index
        render json: {
            message: "Menampilkan semua menu",
            menus: Menu.all
        }
    end 

    def show
        if Menu.exists?(params[:id]) then
            menu = Menu.find(params[:id])
            kategoris = menu.kategori

            render json: {
                message: "Menu ditemukan",
                menu: menu,
                kategoris: kategoris
            }
        else
            render json: {
                error: "Menu tidak ditemukan"
            }
        end
    end 

    def create
        menu = Menu.new(menu_params)

        if menu.save            
            render json: {
                message: "Menu berhasil ditambahkan",
                menu: menu
            }
        else
            render json: menu.errors, status: :unprocessable_entity
        end
    end 

    def update
        if Menu.exists?(params[:id]) then
            menu = Menu.find(params[:id])

            if menu.update(menu_params)
                render json: {
                    message: "Menu berhasil diperbarui",
                    menu: menu
                }
            else
                render json: menu.errors, status: :unprocessable_entity
            end
        else
            render json: {
                message: "Menu tidak ditemukan"
            }
        end    
    end 

    def destroy
        if Menu.exists?(params[:id]) then
            menu = Menu.find(params[:id])
            menu.destroy
            render json: {
                message: "Menu berhasil dihapus",
                menu: menu
            }
        else
            render json: {
                error: "Menu tidak ditemukan"
            }
        end
    end

    private
    def menu_params
        params.permit(:nama, :harga, :deskripsi)
    end
end
