class ExpeditionMailer < ApplicationMailer
  default from: "team@pack-tracker.herokuapp.com"

  def items_email(expedition)
    @expedition = expedition
    @recipients = @expedition.users
    @recipients.each do |recipient|
      send_list(recipient).deliver
    end
  end

  def send_list(recipient)
    @items = @expedition.inventory_items.where(user_id: recipient.id).order("title")
    mail(to: recipient.email, subject: 'Your PackTracker Packing List')
  end

end
