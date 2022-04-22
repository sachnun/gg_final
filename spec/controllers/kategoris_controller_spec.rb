require 'rails_helper'

RSpec.describe KategorisController do
    describe 'GET #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status(:success)
        end
    end
    
    describe 'GET #show' do
        it 'assigns the requested kategori to @kategori' do
            kategori = create(:kategori)
            get :show, params: { id: kategori }
            expect(assigns(:kategori)).to eq kategori
        end
    end

    describe 'POST #create' do
        context 'with valid attributes' do
            it 'saves the new kategori in the database' do
                expect {
                    post :create, params: attributes_for(:kategori)
                }.to change(Kategori, :count).by(1)
            end
        end

        context 'with invalid attributes' do
            it 'does not save the new kategori in the database' do
                expect{
                    post :create, params: attributes_for(:invalid_kategori)
                }.to_not change(Kategori, :count)
            end
        end
    end

    describe 'PATCH #update' do
        before :each do
            @kategori = create(:kategori)
        end

        context 'with valid attributes' do
            it 'locates the requested @kategori' do
                patch :update, params: { id: @kategori, kategori: attributes_for(:kategori) }
                expect(assigns(:kategori)).to eq @kategori
            end

            # it 'changes @kategori attributes' do
            #     patch :update, params: { id: @kategori, kategori: attributes_for(:kategori, nama: 'Makanan') }
            #     @kategori.reload
            #     expect(@kategori.nama).to eq 'Makanan'
            # end
        end

        context 'with invalid attributes' do
            it 'does not change the @kategori attributes' do
                patch :update, params: { id: @kategori, kategori: attributes_for(:invalid_kategori) }
                @kategori.reload
                expect(@kategori.nama).not_to eq nil
            end
        end
    end

    describe 'DELETE #destroy' do
        before :each do
            @kategori = create(:kategori)
        end

        it 'deletes the kategori' do
            expect{
                delete :destroy, params: { id: @kategori }
            }.to change(Kategori, :count).by(-1)
        end
    end
end