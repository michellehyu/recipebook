require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.create(email: 'me@me.com')
  recipe = Recipe.create(cook_time:30, prep_time:30, ingredients:"abc", steps:"123", show:false, user_id:user.id)

  it "belongs to a user" do
    expect(recipe.user_id).to eq(user.id)
  end

end
