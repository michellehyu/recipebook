require 'spec_helper' 

describe 'logging in' do 
  context 'with a valid username' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit "/login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Login"
    end

    it "welcomes the user" do
      expect(page).to have_content "Welcome"
    end
  end
end
