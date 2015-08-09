require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { FactoryGirl.build(:user) }

  describe "#create" do
    it "adds a User session" do
      post :create, email: user.email, password: user.password
    end
    it "redirects to welcome page" do
      post :create, email: user.email, password: user.password
      expect(response).to redirect_to(welcome_path)
    end
  end
end
