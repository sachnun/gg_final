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

            render json: {
                message: "Menu ditemukan",
                menu: menu,
                kategoris: menu.kategori
            }
        else
            render json: {
                message: "Menu tidak ditemukan",
            }
        end
    end 

    def create
        menu = Menu.new(menu_params)

        if menu.save            

            if kategori_params.present? then
                menu.kategori.destroy_all
                kategori_params.each do |kategori|
                    kategori = Kategori.find_or_create_by(nama: kategori)
                    menu.kategori << kategori
                end
            end
            
            render json: {
                message: "Menu berhasil ditambahkan",
                menu: menu,
                kategoris: menu.kategori
            }
        else
            render json: menu.errors, status: :unprocessable_entity
        end
    end 

    def update
        if Menu.exists?(params[:id]) then
            menu = Menu.find(params[:id])

            if menu.update(menu_params)

                if kategori_params.present? then
                    menu.kategori.destroy_all
                    kategori_params.each do |kategori|
                        kategori = Kategori.find_or_create_by(nama: kategori)
                        menu.kategori << kategori
                    end
                end

                render json: {
                    message: "Menu berhasil diperbarui",
                    menu: menu,
                    kategoris: menu.kategori
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
                message: "Menu tidak ditemukan",
            }
        end
    end

    private
    def menu_params
        params.require(:menu).permit(:nama, :harga, :deskripsi)
    end

    private
    def kategori_params
        params.require(:kategoris)
    end
end
