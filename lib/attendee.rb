require_relative '../lib/cleaner'

class Attendee
  def self.build(data)
    cleaner = Cleaner.new
    new(data, cleaner)
  end

  attr_reader :id,
              :regdate,
              :first_name,
              :last_name,
              :homephone,
              :email_address,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data, cleaner)
    @id            = data[:_]
    @regdate       = data[:regdate]
    @first_name    = cleaner.first_name(data[:first_name])
    @last_name     = cleaner.last_name(data[:last_name])
    @homephone     = cleaner.home_phone(data[:homephone])
    @email_address = cleaner.email(data[:email_address])
    @street        = data[:street]
    @city          = data[:city]
    @state         = data[:state]
    @zipcode       = cleaner.zipcode(data[:zipcode])
  end
end
