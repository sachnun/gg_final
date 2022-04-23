namespace :orders do
  desc "TODO"
  task unpaid: :environment do
    orders = Order.where(status: "new")
    orders.each do |order|
      order.update(status: "cancelled")
    end
    puts "Order yang belum dibayar akan otomatis diubah menjadi canceled"
  end
end
