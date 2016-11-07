# require 'twilio-ruby' 
 
# account_sid = ENV['TWILIO_SID']
# auth_token = ENV['TWILIO-AUTH-TOKEN'] 
 
# @client = Twilio::REST::Client.new account_sid, auth_token 
 
# @client.account.messages.create({
#   :from => ENV['PHONE-NUMBER'], 
#   :to => @user.phone_number, 
#   :body => 'How was your day? Take a few moments to jot down your highs and lows.', 
# })


# # post '/send_sms_text' do
# #   Notifier::send_sms_notification(ENV['MY_PHONE'], params[:message] )
# # end