require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:kategori) do
    return FactoryBot.create(:kategori)
  end

  subject(:menu) do
    return FactoryBot.create(:menu, kategori: kategori)
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is valid with a name, description and price' do
    expect(menu).to be_valid
  end

  it 'is invalid without a name' do
    menu.nama = nil
    menu.valid?
    expect(menu.errors[:nama]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    FactoryBot.create(:menu, nama: "Nasi Goreng")
    menu2 = FactoryBot.build(:menu, nama: "Nasi Goreng")
    menu2.valid?
    expect(menu2.errors[:nama]).to include("has already been taken")
  end

  it 'is invalid with a description that is too long' do
    menu.deskripsi = 'a' * 151
    menu.valid?
    expect(menu.errors[:deskripsi]).to include("is too long (maximum is 150 characters)")
  end

  it 'is invalid with a non-integer price' do
    menu.harga = 'a'
    menu.valid?
    expect(menu.errors[:harga]).to include("is not a number")
  end

  it 'is invalid with a price less than 0.01' do
    menu.harga = 0
    menu.valid?
    expect(menu.errors[:harga]).to include("must be greater than 0.01")
  end
end
