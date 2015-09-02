require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) {create(:user) }
  let(:attributes) { attributes_for :user }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "sends a welcome email" do
      expect {
        post :create, user: attributes
      }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end

    it 'adds a user' do
      expect {
        post :create, user: attributes 
      }.to change(User, :count).by(1)
    end
  end
end
