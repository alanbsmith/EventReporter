require_relative '../lib/cleaner'

class Attendee
  def self.build(data)
    cleaner = Cleaner.new
    new(data, cleaner)
  end

  attr_reader :id,
              :registration,
              :first_name,
              :last_name,
              :phone,
              :email,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data, cleaner)
    @id           = data[:id]
    @registration = data[:registration]
    @first_name   = cleaner.first_name(data[:first_name])
    @last_name    = cleaner.last_name(data[:last_name])
    @home_phone   = cleaner.home_phone(data[:home_phone])
    @email        = cleaner.email(data[:email])
    @street       = data[:street]
    @city         = data[:city]
    @state        = data[:state]
    @zipcode      = cleaner.zipcode(data[:zipcode])
  end

end

if __FILE__== $0
  raw_zipcode = 924
  raw_phone   = "(432) 654,12-34"
  data        = {home_phone: raw_phone, zipcode: raw_zipcode}
  cleaner     = Cleaner.new
  attendee    = Attendee.new(data, cleaner)
  p attendee
end
