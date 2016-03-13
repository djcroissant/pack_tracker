class ExpeditionMailer < ApplicationMailer
  default from: "mail@motorcyclephilanthropy.org"

  def items_email(expedition, user)
    @expedition = expedition
    @user = user
    @items = @expedition.inventory_items.where(user_id: user.id).order("title")
    mail(to: user.email, subject: 'Your PackTracker Packing List')
  end
end
