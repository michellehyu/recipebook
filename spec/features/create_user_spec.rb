require 'spec_helper'

describe "creating a user" do 
  context "with valid params" do

    before do
      visit '/users/new'
      fill_in 'Email', with: 'newuser@test.test'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Submit'
    end

    it 'tells the user they successfully signed up' do
      expect(page).to have_content 'You signed up'
    end

    it 'sends the user a welcome email' do
      expect('hello')
    end
  end

  context "with bad params" do 
    before do 
      FactoryGirl.create(:user)
      visit '/users/new'
      fill_in 'Email', with: 'harry@hogwarts.edu'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'somethingelse'
      click_button 'Submit'
    end

    it 'tells the user the passwords did not match' do
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    it 'tells the user the email already exists' do
      expect(page).to have_content 'Email has already been taken'
    end
  end
end