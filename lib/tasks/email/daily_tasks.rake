namespace :email do
  task :eight_day_reminder => :environment do
    Expedition.where(start_date: Date.today+8).find_each do |expedition|
      expedition.users.find_each do |user|
        ExpeditionMailer.items_email(expedition, user).deliver_now
      end
    end
    Rails.logger.info("8 day reminder emails sent at #{Time.now}")
  end

  task :two_day_reminder => :environment do
    Expedition.where(start_date: Date.today+2).find_each do |expedition|
      expedition.users.find_each do |user|
        ExpeditionMailer.items_email(expedition, user).deliver_now
      end
    end
    Rails.logger.info("2 day reminder emails sent at #{Time.now}")
  end
end
