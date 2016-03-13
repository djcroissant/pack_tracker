require "spec_helper"
require 'rails_helper'

describe UserMailer, :type => :mailer do
  let(:user) { create(:user) }

  describe "#welcome_email" do
    let(:mail) { UserMailer.welcome_email(user) }

    it "renders the correct headers" do
      expect(mail.from).to include "mail@motorcyclephilanthropy.org"
      expect(mail.to).to include user.email
      expect(mail.subject).to include "Welcome to Pack Tracker!"
    end

    it "renders an html layout" do
      expect(mail.html_part.body).to include "To login to the site, just follow this link"
    end

    it "renders a text layout" do
      expect(mail.text_part.body).to include "To login to the site, just follow this link"
    end
  end
end
