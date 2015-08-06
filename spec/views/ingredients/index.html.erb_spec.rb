require 'rails_helper'

RSpec.describe "ingredients/index", type: :view do
  before(:each) do
    assign(:ingredients, [
      Ingredient.create!(
        :amount => "Amount",
        :unit => "Unit",
        :name => "Name",
        :recipe => nil
      ),
      Ingredient.create!(
        :amount => "Amount",
        :unit => "Unit",
        :name => "Name",
        :recipe => nil
      )
    ])
  end

  it "renders a list of ingredients" do
    render
    assert_select "tr>td", :text => "Amount".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
