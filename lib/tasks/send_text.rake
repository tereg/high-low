require 'dotenv'
Dotenv.load
require_relative '../notifier'

desc "Send text"
task :send_text do 
  p ENV['TWILIO_SID']
  p ENV['TWILIO_AUTH_TOKEN']
  p ENV['TWILIO_PHONE_NUMBER']
  p ENV['MY_PHONE']

  Notifier::send_sms_notification(ENV['MY_PHONE'], "How was your day?")
end 

