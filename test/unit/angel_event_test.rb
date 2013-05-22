# == Schema Information
#
# Table name: angel_events
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  code       :string(255)
#  status     :string(255)
#  user_id    :integer
#  sms_sid    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message    :string(255)
#  response   :string(255)
#

require 'test_helper'

class AngelEventTest < ActiveSupport::TestCase

  def setup
    @params = {
        "AccountSid"=>"AC9a3361f701b0e78280626b4948d269b3",
        "Body"=>"sfgiants sending a heads up",
        "ToZip"=>"94941",
        "FromState"=>"CA",
        "ToCity"=>"MILL VALLEY",
        "SmsSid"=>"SM932f1f1a3577a8b01467cdbfc376830c",
        "ToState"=>"CA",
        "To"=>"+14159685137",
        "ToCountry"=>"US",
        "FromCountry"=>"US",
        "SmsMessageSid"=>"SM932f1f1a3577a8b01467cdbfc376830c",
        "ApiVersion"=>"2010-04-01", "FromCity"=>"SAN DIEGO",
        "SmsStatus"=>"received",
        "From"=>"+18584423699",
        "FromZip"=>"92128"
    }.with_indifferent_access
  end

  test "forward heads up" do
    Text.unstub(:send_text)
    expected_message = "Heads up from a parking angel (respond with 0 if this is fake): sfgiants sending a heads up"
    Text.stubs(:send_text).with("8584423699", expected_message).returns(true)
    assert_difference('AngelEvent.count', 1) do
      AngelEvent.receive_text(@params)
      angel_event = AngelEvent.last
      assert_equal angel_event.status, :relayed.to_s
    end
  end

  test "forward thank you" do
    @params["Body"] = "on it. thanks bud"
    Text.unstub(:send_text)
    Text.stubs(:send_text).with("8584423699", "Message confirmed by user: #{@params["Body"]}").returns(true)

    AngelEvent.receive_text(@params)
    angel_event = AngelEvent.last
    assert_equal angel_event.status, :saved.to_s
  end

  test "forward spam" do
    @params["Body"] = "0"
    Text.unstub(:send_text)
    AngelEvent.receive_text(@params)
    angel_event = AngelEvent.last
    assert_equal angel_event.status, :fake.to_s
  end

end
