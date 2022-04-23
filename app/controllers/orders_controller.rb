class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy, :paid]

    def index
        render json: {
            message: "Menampilkan semua order",
            orders: Order.all
        }
    end

    def show
        order_show(@order, "Order ditemukan")
    end

    def create
        @order = Order.new(order_params)
        @order.order_at = Time.now

        if @order.save
            order_show(@order, "Order berhasil ditambahkan")
        else
            order_error(@order)
        end
    end

    def update
        if @order.update(order_params) then
            order_show(@order, "Order berhasil diupdate")
        else
            order_error(@order)
        end
    end

    def destroy
        if @order.destroy
            order_show(@order, "Order berhasil dihapus")
        else
            order_error(@order)
        end
    end

    def paid
        @order.update(status: "paid")
        order_show(@order, "Order berhasil dibayar")
    end
    
    def unpaid
        if Time.now.hour > 17
            orders = Order.where(status: "new")
            orders.each do |order|
                order.update(status: "cancelled")
            end
            render json: {
                message: "Order yang belum dibayar akan otomatis diubah menjadi canceled",
                waktu: Time.now,
                orders: orders
            }
        else
            render json: {
                message: "Waktu untuk membatalkan order belum tepat",
                waktu: Time.now
            }
        end
    end

    private

    def set_order
        begin
            @order = Order.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {
                message: "Order tidak ditemukan"
            },
            status: :not_found
        end
    end

    def order_params
        params.permit(:email, :status)
    end

    def order_show(order, message)
        render json: {
            message: message,
            order: order,
            order_menus_total: order.order_menus.count
        }
    end

    def order_error(order)
        render json: order.errors, status: :unprocessable_entity
    end
end
