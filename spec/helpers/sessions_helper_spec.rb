require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do

  # let(:user) { FactoryGirl.create(:user) }

  describe 'signed_in?' do

    it 'is false when a user is not signed in' do
      expect(signed_in?).to be false
    end

  end
end
