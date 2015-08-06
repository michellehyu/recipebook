require 'rails_helper'

RSpec.describe User, type: :model do

  user = User.create(email: 'me@me.com')

  it "has an email" do #This ain't much of a test but it's a start.
    expect(user.email).to eq('me@me.com')
  end
end
