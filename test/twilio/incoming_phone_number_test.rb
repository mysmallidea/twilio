require 'test_helper'

class IncomingPhoneNumberTest < Test::Unit::TestCase #:nodoc: all
  context "An incoming phone number" do
    setup do
      Twilio.connect('mysid', 'mytoken')
    end

    should "be retrievable individually" do
      assert_equal  stub_response(:get, :incoming_phone_number, :resource => 'IncomingPhoneNumbers/PNe536dfda7c6184afab78d980cb8cdf43'),
        Twilio::IncomingPhoneNumber.get('PNe536dfda7c6184afab78d980cb8cdf43')
    end
    
    should "be retrievable as a list" do
      assert_equal stub_response(:get, :incoming_phone_numbers, :resource => 'IncomingPhoneNumbers'),
        Twilio::IncomingPhoneNumber.list
    end

    should "be able to create a number" do
      assert_equal stub_response(:post, :incoming_phone_numbers, :resource => 'IncomingPhoneNumbers'),
        Twilio::IncomingPhoneNumber.create(:area_code => '666')
    end
    
    should "be able to update a number by Sid" do
      assert_equal stub_response(:put, :incoming_phone_numbers, :resource => 'IncomingPhoneNumbers/1234567890'),
        Twilio::IncomingPhoneNumber.update('1234567890')
    end
    
    
    context "using deprecated API" do
      setup do
        @connection = Twilio::Connection.new('mysid', 'mytoken')
        @incoming = Twilio::IncomingPhoneNumber.new(@connection)
      end

      should "be retrievable individually" do
        assert_equal stub_response(:get, :incoming_phone_number, :resource => 'IncomingPhoneNumbers/PNe536dfda7c6184afab78d980cb8cdf43'), 
          @incoming.get('PNe536dfda7c6184afab78d980cb8cdf43')
      end
    end
  end
end