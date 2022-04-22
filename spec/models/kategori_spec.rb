require 'rails_helper'

RSpec.describe Kategori, type: :model do
    subject(:kategori) { 
        FactoryBot.create(:kategori)
    }

    it 'has a valid factory' do
        expect(FactoryBot.build(:kategori)).to be_valid
    end
    
    it 'is valid with a name' do
        expect(kategori).to be_valid
    end

    it 'is invalid without a name' do
        kategori.nama = nil
        kategori.valid?
        expect(kategori.errors[:nama]).to include("can't be blank")
    end
end