require 'spec_helper'

describe "visiting home" do 
  it "displays a welcome" do
    visit "/home"
    expect(page).to have_content "Welcome"
  end
end