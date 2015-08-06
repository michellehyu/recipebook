require 'rails_helper'

RSpec.describe "ingredients/edit", type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(
      :amount => "MyString",
      :unit => "MyString",
      :name => "MyString",
      :recipe => nil
    ))
  end

  it "renders the edit ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredient_path(@ingredient), "post" do

      assert_select "input#ingredient_amount[name=?]", "ingredient[amount]"

      assert_select "input#ingredient_unit[name=?]", "ingredient[unit]"

      assert_select "input#ingredient_name[name=?]", "ingredient[name]"

      assert_select "input#ingredient_recipe_id[name=?]", "ingredient[recipe_id]"
    end
  end
end
