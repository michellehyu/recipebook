require 'rails_helper'

RSpec.describe "steps/edit", type: :view do
  before(:each) do
    @step = assign(:step, Step.create!(
      :order => 1,
      :description => "MyText",
      :recipe => nil
    ))
  end

  it "renders the edit step form" do
    render

    assert_select "form[action=?][method=?]", step_path(@step), "post" do

      assert_select "input#step_order[name=?]", "step[order]"

      assert_select "textarea#step_description[name=?]", "step[description]"

      assert_select "input#step_recipe_id[name=?]", "step[recipe_id]"
    end
  end
end
