class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :status, default: "new"
      t.integer :total_bayar, default: 0
      t.timestamp :order_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end
