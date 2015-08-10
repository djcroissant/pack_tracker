class ExpeditionMailer < ApplicationMailer
  default from: "me@gmail.com"

  def items_email(expedition)
    @expedition = expedition
    @recipients = @expedition.users
    @recipients.each do |recipient|
      send_list(recipient).deliver
    end
  end

  def send_list(recipient)
    @expedition.inventory_items.each do |inventory_item|
      if inventory_item.user_id == recipient.id
        @items << inventory_item
        puts "@items.last = #{@items.last}"
      end 
    end
    @items.sort!
    mail(to: recipient.email, subject: 'test list email')
  end

end
