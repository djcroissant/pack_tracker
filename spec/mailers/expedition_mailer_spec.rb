require "spec_helper"
require 'rails_helper'

describe ExpeditionMailer, :type => :mailer do
  let(:user) { create(:user) }
  let(:expedition) { create(:expedition) }


  describe "#items_email" do
    let(:mail) { ExpeditionMailer.items_email(expedition) }
    let(:mail2) { UserMailer.welcome_email(user) }

    it "renders the correct headers" do

      expect(mail.from).to include "mail@motorcyclephilanthropy.org"
      expect(mail.to).to include expedition.users.first.email
      expect(mail.subject).to include "Your PackTracker Packing List"
    end

    it "renders an html layout" do
      expect(mail.html_part.body).to include "Your trip is coming up on"
    end

    it "renders a text layout" do
      expect(mail.text_part.body).to include "Your trip is coming up."
    end
  end
end
