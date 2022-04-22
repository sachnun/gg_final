module ReportsHelper
    def get_orders_by_date(s, e)
        if s.present? && e.present? then
            s = Date.parse(s)
            e = Date.parse(e)

            orders = Order.where(created_at: s..e, status: "paid")
        elsif s.present? then
            s = Date.parse(s)
            orders = Order.where(created_at: s..Date.today, status: "paid")
        elsif e.present? then
            e = Date.parse(e)
            orders = Order.where('created_at <= ?', e, status: "paid")
        else
            orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, status: "paid")
        end

        return orders
    end

    def get_orders_by_harga(s, e)
        if s.present? && e.present? then
            s = s.to_i
            e = e.to_i

            orders = Order.where(total_bayar: s..e, status: "paid")
        elsif s.present? then
            s = s.to_i
            orders = Order.where('total_bayar >= ?', s, status: "paid")
        elsif e.present? then
            e = e.to_i
            orders = Order.where('total_bayar <= ?', e, status: "paid")
        else
            orders = Order.where(status: "paid")
        end

        return orders
    end

    def get_orders_by_email(q)
        if q.present? then
            orders = Order.where('email = ?', q, status: "paid")
        else
            orders = Order.where(status: "paid")
        end

        return orders
    end
end
