require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  let(:user) { create(:user)}

  describe "#welcome_email" do
    let(:mail) { UserMailer.welcome_email(user) }

    it "includes the correct from address" do
      expect(mail.from).to include "noreply@recipebook.com"
    end

    it "is sent to the correct recipient" do
      expect(mail.to).to include user.email 
    end

    it "includes the correct sugject line" do
      expect(mail.subject).to include "Welcome to Recipebook" 
    end

    it "renders the correct html layout" do
      expect(mail.body).to include "Welcome to Recipebook"
    end
  end
end
