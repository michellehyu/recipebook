require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  describe "#create" do
    context 'when a user is not already signed in' do
      it "adds a User session" do
        post :create, email: user.email, password: user.password
      end
      it "redirects to welcome page" do
        post :create, email: user.email, password: user.password
        expect(response).to redirect_to(welcome_path)
      end
    end
  end

  describe '#destroy' do
    context 'when a user is already signed in' do

      before do
        post :create, email: user.email, password: user.password
      end

      it 'redirects to welcome page' do
        get :destroy
        expect(response).to redirect_to(welcome_path)
      end
    end
  end
end
