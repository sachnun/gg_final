class ReportsController < ApplicationController
    include ReportsHelper

    def index
        filter = params[:filter]

        case filter
        when "date"
            filter_date(params[:s], params[:e])
        when "harga" 
            filter_harga(params[:s], params[:e])
        when "email"
            filter_email(params[:q])
        else
            render json: {
                message: "Filter tidak ditemukan"
            },
            status: :not_found
        end
    end

    private

    def filter_date(s, e)
        orders = get_orders_by_date(s, e)
        order_detail = order_detail(orders)
        
        render json: {
            message: "Menampilkan semua order paid bedasarkan tanggal",
            date: {
                start: s.present? ? s : Date.today,
                end: e.present? ? e : nil
            },
            orders: order_detail
        }
    end

    def filter_harga(s, e)
        orders = get_orders_by_harga(s, e)
        order_detail = order_detail(orders)

        render json: {
            message: "Menampilkan semua order paid bedasarkan total harga",
            harga: {
                start: s.present? ? s : nil,
                end: e.present? ? e : nil
            },
            orders: order_detail
        }
    end

    def filter_email(q)
        orders = get_orders_by_email(q)
        order_detail = order_detail(orders)

        render json: {
            message: "Menampilkan semua order paid bedasarkan email",
            email: q.present? ? q : nil,
            orders: order_detail
        }
    end

    def order_detail(orders)        
        order_detail = []
        orders.each do |order|
            order_detail << {
                order: order,
                order_menus_total: order.order_menus.count,
            }
        end

        return order_detail
    end
end
