class OrdersController < ApplicationController
    def index
        orders = Order.all
        
        order_detail = []
        orders.each do |order|
            order_detail << {
                order: order,
                total_order_menus: order.order_menus.count,
                total_harga: order.order_menus.total_harga
            }
        end

        render json: {
            message: "Menampilkan semua order",
            orders: order_detail
        }
    end 

    def show
        if Order.exists?(params[:id]) then
            order = Order.find(params[:id])

            render json: {
                message: "Order ditemukan",
                order: order,
                order_menus: order.order_menus,
                total_harga: order.order_menus.total_harga
            }
        else
            render json: {
                message: "Order tidak ditemukan",
            }
        end
    end 

    def create
        order = Order.new(order_params)

        if order.save

            # order_menus_params.each do |order_menu|
            #     order_menu = OrderMenu.new()
            #     order_menu.order = order
            #     order_menu.menu = order_menu[:menu_id]
            #     order_menu.porsi = order_menu[:porsi]
            #     order_menu.harga = order_menu[:harga]
            #     order_menu.save
                
            #     order.order_menus << order_menu
            # end

            render json: {
                message: "Order berhasil ditambahkan",
                order: order,
                order_menus: order.order_menus,
                total_harga: order.order_menus.total_harga
            }
        else
            render json: order.errors, status: :unprocessable_entity
        end
    end 

    def update
  
    end 

    def destroy
        if Order.exists?(params[:id]) then
            order = Order.find(params[:id])
            order.order_menus.destroy_all
            order.destroy

            render json: {
                message: "Order berhasil dihapus",
            }
        else
            render json: {
                message: "Order tidak ditemukan",
            }
        end
    end

    private
    def order_params
        params.require(:order).permit(:email)
    end

    private
    def order_menus_params
        params.require(:orders)
    end
end
