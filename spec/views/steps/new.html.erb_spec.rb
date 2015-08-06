require 'rails_helper'

RSpec.describe "steps/new", type: :view do
  before(:each) do
    assign(:step, Step.new(
      :order => 1,
      :description => "MyText",
      :recipe => nil
    ))
  end

  it "renders new step form" do
    render

    assert_select "form[action=?][method=?]", steps_path, "post" do

      assert_select "input#step_order[name=?]", "step[order]"

      assert_select "textarea#step_description[name=?]", "step[description]"

      assert_select "input#step_recipe_id[name=?]", "step[recipe_id]"
    end
  end
end
