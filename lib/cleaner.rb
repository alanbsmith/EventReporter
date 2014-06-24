require_relative '../lib/attendee'
require 'ValidateEmail'

class Cleaner

  def first_name(raw_first_name)
    raw_first_name.capitalize
  end

  def last_name(raw_last_name)
    raw_last_name.capitalize
  end

  def email(raw_email)
    if ValidateEmail.validate(raw_email)
      raw_email
    else
      nil
    end
  end

  def home_phone(raw_phone)
    digits = raw_phone.to_s.scan(/\d/).join
    digits.rjust(10,"0")[0...10]
  end

  def zipcode(raw_zipcode)
    raw_zipcode.to_s.rjust(5,"0")[0..4]
  end

end


if __FILE__== $0

end
