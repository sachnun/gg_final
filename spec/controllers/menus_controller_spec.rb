require 'rails_helper'

RSpec.describe MenusController do
    describe 'GET #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    describe 'GET #show' do
        it 'assigns the requested menu to @menu' do
          menu = create(:menu)
          get :show, params: { id: menu }
          expect(assigns(:menu)).to eq menu
        end
    end

    describe 'POST #create' do
        context 'with valid attributes' do
            # it 'saves the new menu in the database' do
            #     expect {
            #         post :create, params: { menu: attributes_for(:menu) }
            #     }.to change(Menu, :count).by(1)
            # end
        end

        context 'with invalid attributes' do
            it 'does not save the new menu in the database' do
                expect{
                    post :create, params: { menu: attributes_for(:invalid_menu) }
                }.to_not change(Menu, :count)
            end
        end
    end

    describe 'PATCH #update' do
        before :each do
          @menu = create(:menu)
        end

        context 'with valid attributes' do
            it 'locates the requested @menu' do
                patch :update, params: { id: @menu, menu: attributes_for(:menu) }
                expect(assigns(:menu)).to eq @menu
            end

            # it 'changes @menu attributes' do
            #     patch :update, params: { id: @menu, menu: attributes_for(:menu, nama: 'Nasi Goreng') }
            #     @menu.reload
            #     expect(@menu.nama).to eq 'Nasi Goreng'
            # end
        end

        context 'with invalid attributes' do
            it 'does not change the @menu attributes' do
                patch :update, params: { id: @menu, menu: attributes_for(:menu, nama: nil) }
                @menu.reload
                expect(@menu.nama).not_to eq nil
            end
        end
    end

    describe 'DELETE #destroy' do
        before :each do
          @menu = create(:menu)
        end

        it 'deletes the menu from the database' do
            expect {
                delete :destroy, params: { id: @menu }
            }.to change(Menu, :count).by(-1)
        end
    end
end