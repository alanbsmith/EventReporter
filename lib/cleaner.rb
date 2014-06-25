require_relative '../lib/attendee'
require 'ValidateEmail'

class Cleaner

  def first_name(raw_first_name)
    raw_first_name.to_s.capitalize
  end

  def last_name(raw_last_name)
    raw_last_name.to_s.capitalize
  end

  def email(raw_email)
    if ValidateEmail.validate(raw_email)
      raw_email
    else
      'N/A'
    end
  end

  def home_phone(raw_phone)
    digits = raw_phone.to_s.scan(/\d/).join
    if digits.length >= 10
      "(#{digits[0..2]}) #{digits[3..5]}-#{digits[6..-1]}"
    else
      "N/A"
    end
  end

  def zipcode(raw_zipcode)
    raw_zipcode.to_s.rjust(5,"0")[0..4]
  end

end
