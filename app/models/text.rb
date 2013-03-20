class Text

  OUR_NUMBER = "4159685137"

  def self.send_heads_up(recipient)
    msg = "A parking angel is giving you a heads up. Respond with 1 if this is legit or 2 if it's fraudulent"
    send_text(recipient.phone, msg)
  end

  def self.send_response(angel_event)
    if angel_event.status == "saved"
      msg = "Thanks for the heads up!"
    else
      msg = "This was fake"
    end
    number = angel_event.phone
    send_text(number, msg)
  end

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