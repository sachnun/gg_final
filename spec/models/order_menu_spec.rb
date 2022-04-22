require 'rails_helper'

RSpec.describe OrderMenu, type: :model do
    subject(:order_menu) do
        return FactoryBot.create(:order_menu)
    end

    it 'is valid with a order_id, menu_id, porsi, harga, total_harga' do
        expect(order_menu).to be_valid
    end

    it 'is invalid without a order_id' do
        order_menu.order_id = nil
        order_menu.valid?
        expect(order_menu.errors[:order_id]).to include("can't be blank")
    end

    it 'is invalid without a menu_id' do
        order_menu.menu_id = nil
        order_menu.valid?
        expect(order_menu.errors[:menu_id]).to include("can't be blank")
    end
end