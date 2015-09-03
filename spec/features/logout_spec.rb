require 'rails_helper'

# RSpec.describe SessionsController, type: :controller do

describe 'logging out' do 

  let(:user) {FactoryGirl.create(:user)}

  before do
    # login_as user
    visit login_path
    fill_in 'Email', with: user.email 
    fill_in 'password', with: user.password
    click_button 'Login'
    visit logout_path
  end

  describe 'logging out' do
    it 'tells the user they have logged out' do
      expect(page).to have_content 'You have been logged out'
    end

    it 'redirects to welcome screen' do
      expect(page).to have_content 'Welcome'
    end
  end
end
