require 'rails_helper'

RSpec.describe "ingredients/show", type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(
      :amount => "Amount",
      :unit => "Unit",
      :name => "Name",
      :recipe => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Amount/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
