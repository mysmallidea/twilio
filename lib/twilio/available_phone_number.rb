module Twilio
  # An IncomingPhoneNumber resource represents a phone number given to you by 
  # Twilio to receive incoming phone calls. 
  # Example:
  #   Twilio.connect('my_twilio_sid', 'my_auth_token')
  #   Twilio::IncomingPhoneNumber.list
  class AvailablePhoneNumber < TwilioObject
    def list(country_code='US'optional = {})
      Twilio.get("/AvailablePhoneNumber/#{country_code}/Local", :query => optional) 
    end
    
    def get(incoming_sid)
      Twilio.get("/IncomingPhoneNumbers/#{incoming_sid}") 
    end
    
    def create(options = {})
      options = Hash[options.map{|k,v| [k.to_s.convert_to_camel_case,v]}]
      Twilio.post("/IncomingPhoneNumbers", :body => options)
    end
    
    def update(incoming_sid, options = {})
      options = Hash[options.map{|k,v| [k.to_s.convert_to_camel_case,v]}]
      Twilio.put("/IncomingPhoneNumbers/#{incoming_sid}", :body => options)
    end
    
  end
end