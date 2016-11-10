module Notifier
  def self.send_sms_notification(phone_number, message)
   
    client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']
    send_sms(client, phone_number, message)
  end
  def self.send_sms(client,phone_number, alert_message)
    twilio_number = ENV['TWILIO_PHONE_NUMBER']
    message = client.account.messages.create(
    from: twilio_number,
    to: phone_number,
    body: alert_message,
    )
    puts "An sms notifying the last application error was "\
    "sent to #{message.to[0...-4] + "******"}"
  end
  private_class_method :send_sms
end