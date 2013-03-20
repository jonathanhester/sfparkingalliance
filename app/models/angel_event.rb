class AngelEvent < ActiveRecord::Base
  attr_accessible :code, :phone, :status, :user_id

  belongs_to :user

  def self.receive_text(params)
    code = params[:Body].split(/\s/).first
    phone = params[:From].gsub(/\D/, "").sub(/^1/, "")
    sender = User.find_by_phone(phone)
    recipient = User.find_by_code(code)

    #this is a heads up
    if recipient
      Rails.logger.info "Relaying heads up to #{recipient.id}"
      angel_event = AngelEvent.new
      angel_event.phone = params[:From]
      angel_event.code = code
      angel_event.user = recipient
      response = Text.send_heads_up(recipient)
      angel_event.status = :relayed
      angel_event.save
    elsif sender
      Rails.logger.info "Trying to relay response from #{sender}"
      angel_event = AngelEvent.where(user_id: sender).last
      if angel_event && angel_event.status == "relayed"
        if code == "1"
          angel_event.status = "saved"
        else
          angel_event.status = "fake"
        end
        angel_event.save
        response = Text.send_response(angel_event)
        Rails.logger.info "Found event and responded with #{angel_event.status}"
      end
    end
  end


end
