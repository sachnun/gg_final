require 'rails_helper'

RSpec.describe OrdersController do
    describe 'GET #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    describe 'GET #show' do
        it 'assigns the requested order to @order' do
            order = create(:order)
            get :show, params: { id: order }
            expect(assigns(:order)).to eq order
        end
    end

    describe 'POST #create' do
        context 'with valid attributes' do
            # it 'saves the new order in the database' do
            #     expect {
            #         post :create, params: { order: attributes_for(:order) }
            #     }.to change(Order, :count).by(1)
            # end
        end

        context 'with invalid attributes' do
            it 'does not save the new order in the database' do
                expect{
                    post :create, params: { order: attributes_for(:invalid_order) }
                }.to_not change(Order, :count)
            end
        end
    end

    describe 'PATCH #update' do
        before :each do
            @order = create(:order)
        end

        context 'with valid attributes' do
            it 'locates the requested @order' do
                patch :update, params: { id: @order, order: attributes_for(:order) }
                expect(assigns(:order)).to eq @order
            end

            # it 'changes @order attributes' do
            #     patch :update, params: { id: @order, order: attributes_for(:order, email: '
            #     @order.reload
            #     expect(@order.email).to eq '
            # end
        end
    end

    describe 'DELETE #destroy' do
        before :each do
            @order = create(:order)
        end

        it 'deletes the order' do
            expect{
                delete :destroy, params: { id: @order }
            }.to change(Order, :count).by(-1)
        end
    end
end