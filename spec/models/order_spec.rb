require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) do
    return FactoryBot.create(:order)
  end

  it 'is valid with a email' do
    expect(order).to be_valid
  end

  it 'is invalid without a email' do
    order.email = nil
    order.valid?
    expect(order.errors[:email]).to include("can't be blank")
  end

  it 'is invalid email format' do
    order.email = 'invalid_email'
    order.valid?
    expect(order.errors[:email]).to include("is invalid")
  end

end
