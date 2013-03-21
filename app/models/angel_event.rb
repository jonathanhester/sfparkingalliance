class AngelEvent < ActiveRecord::Base
  attr_accessible :code, :phone, :status, :user_id

  belongs_to :user

  def self.receive_text(params)
    code = params[:Body].split(/\s/).first.strip
    phone = params[:From].gsub(/\D/, "").sub(/^1/, "")
    sender = User.find_by_phone(phone)
    recipient = User.find_by_code(code)
    body = params[:Body]

    #this is a heads up
    if recipient
      Rails.logger.info "Relaying heads up to #{recipient.id}"
      angel_event = AngelEvent.new
      angel_event.phone = params[:From]
      angel_event.code = code
      angel_event.user = recipient
      angel_event.message = body
      msg = "Heads up from a parking angel (respond with 0 if this is fake): #{body}"
      Text.send_text(recipient.phone, msg)
      angel_event.status = :relayed
      angel_event.save
    elsif sender
      Rails.logger.info "Trying to relay response from #{sender}"
      angel_event = AngelEvent.where(user_id: sender).order('id asc').last
      if angel_event && angel_event.status == "relayed"
        if code == "1"
          angel_event.status = "saved"
          msg = "Message confirmed by user: #{body}"
        else
          angel_event.status = "fake"
          msg = "This was fake: #{body}"
        end
        angel_event.response = body
        angel_event.save
        number = angel_event.phone
        Text.send_text(number, msg)
        Rails.logger.info "Found event and responded with #{angel_event.status}"
      end
    end
  end


end
