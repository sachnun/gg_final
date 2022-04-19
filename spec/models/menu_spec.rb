require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name, description and price' do
    menu = Menu.new(
      nama: 'Nasi Uduk',
      deskripsi: 'Cocok untuk sarapan pagi',
      harga: 10000
    )

    expect(menu).to be_valid
  end

  it 'is invalid without a name' do
    menu = Menu.new(
      nama: '',
      deskripsi: 'Cocok untuk sarapan pagi',
      harga: 10000
    )

    menu.valid?

    expect(menu.errors[:nama]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    menu1 = Menu.create(
      nama: 'Nasi Uduk',
      deskripsi: 'Cocok untuk sarapan pagi',
      harga: 10000
    )
    
    menu2 = Menu.new(
      nama: 'Nasi Uduk',
      deskripsi: 'Cocok untuk sarapan pagi',
      harga: 10000
    )

    menu2.valid?
    
    expect(menu2.errors[:nama]).to include("has already been taken")
  end

  it 'is invalid with a price less than 0.01' do
    menu = Menu.new(
      nama: 'Nasi Uduk',
      deskripsi: 'Cocok untuk sarapan pagi',
      harga: 0.00
    )

    menu.valid?

    expect(menu.errors[:harga]).to include('must be greater than 0.01')
  end
end
