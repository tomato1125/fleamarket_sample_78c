require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe 'GET #new' do
    let(:user) { FactoryBot.create(:user) }
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  # editはテスト後日別途対応予定。

  # describe 'GET #edit' do

  #   context 'log in' do
  #     # let(:user) { FactoryBot.create(:user) }

  #     let(:item) { FactoryBot.create(:item) }
  #     # let(:image) { FactoryBot.create(:image) }

  #     before do
  #       get :edit, params: { id: item }
  #     end
      
  #     it "assigns @item" do
  #       expect(assigns(:item)).to be_a_new(Item)
  #     end

  #     it "renders the :edit template" do
  #       item = create(:item)
  #       expect(response).to render_template :edit
  #     end
  #   end

  #   context 'not log in' do
  #     let(:item) { FactoryBot.create(:item) }

  #     before do
  #       get :edit, params: { id: item }
  #     end

  #     it 'refirect to root_path' do
  #       expect(response).to redirect_to(root_path)
  #     end
  #   end
  # end
end