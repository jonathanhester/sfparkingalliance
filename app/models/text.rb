class Text

  OUR_NUMBER = "4159685137"

  def self.send_text(recipient, message)
    Rails.logger.info("Sending '#{message}' to #{recipient}")

    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.sms.messages.create(
        :from => OUR_NUMBER,
        :to => recipient,
        :body => message
    )
  end

end