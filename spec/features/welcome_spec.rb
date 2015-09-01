require 'rails_helper'

describe "visiting welcome" do 
  it "displays a welcome" do
    visit "/welcome"
    expect(page).to have_content "Welcome"
  end
end