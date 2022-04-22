class OrderMenusController < ApplicationController
    before_action :set_order
    before_action :set_order_menu, only: [:show, :update, :destroy]

    def index
        render json: {
            message: "Menampilkan semua order menu",
            order: @order,
            order_menus: @order.order_menus
        }
    end

    def show
        order_menu_show(@order_menu, "Order menu ditemukan")
    end

    def create
        @order_menu = @order.order_menus.build(order_menu_params)
        if @order_menu.save
            @order_menu.set_menu_harga
            order_menu_show(@order_menu, "Order menu berhasil ditambahkan")
        else
            order_menu_error(@order_menu)
        end
    end

    def update
        if @order_menu.update(order_menu_params) then
            @order_menu.set_total_harga
            order_menu_show(@order_menu, "Order menu berhasil diupdate")
        else
            order_menu_error(@order_menu)
        end
    end

    def destroy
        if @order_menu.destroy
            order_menu_show(@order_menu, "Order menu berhasil dihapus")
        else
            order_menu_error(@order_menu)
        end
    end

    private

    def set_order
        begin
            @order = Order.find(params[:order_id])
        rescue ActiveRecord::RecordNotFound
            render json: {
                message: "Order tidak ditemukan"
            },
            status: :not_found
        end
    end

    def set_order_menu
        begin
            @order_menu = OrderMenu.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {
                message: "Order menu tidak ditemukan"
            },
            status: :not_found
        end
    end

    def order_menu_params
        params.permit(:menu_id, :porsi)
    end

    def order_menu_show(order_menu, message)
        render json: {
            message: message,
            order_menu: order_menu,
            order: @order,
        }
    end

    def order_menu_error(order_menu)
        render json: order_menu.errors, status: :unprocessable_entity
    end
end
