require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  describe "#create" do

    context 'when a user is not already signed in' do
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

  describe '#twitter' do
    context 'with valid credentials' do
      before do
        OmniAuth.config.add_mock(:twitter, {
          uid: '12345',
          info: { nickname: 'test_user' },
          credentials: { token: 'abc', secret: '123' }
        })
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
      end 

      it 'signs in a user' do
        get :twitter
        expect(signed_in?).to be true
      end

      it 'has a flash notice' do
        get :twitter
        expect(flash[:notice]).to include 'Success!  You have been logged in through Twitter'
      end

      it 'responds with http status = success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid credentials' do
      before do
        OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
        get :failure
      end

      it 'has flash alert' do
        expect(flash[:error]).to eq "Oops!  Something went wrong with your authentication"
      end

    end
  end

  describe 'failure' do
    it 'creates a flash alert' do
      get :failure
      expect(flash[:error]).to eq 'Oops!  Something went wrong with your authentication'
    end
  end
end
