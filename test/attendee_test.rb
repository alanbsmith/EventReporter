require_relative '../test/test_helper.rb'
require_relative '../lib/attendee'

class AttendeeTest < Minitest::Test

  def data
    {
      id: "1" ,
      registration: "11/12/08 10:47",
      first_name:"Allison",
      last_name: "Nguyen",
      email:"arannon@jumpstartlab.com",
      home_phone: "615.438-5000",
      street: "3155 19th St NW",
      city: "Washington",
      state: "DC",
      zipcode: "20010"
    }
  end

  def test_it_exists
    assert Attendee
  end

  def test_it_has_clean_attributes
    attendee = Attendee.build(data)
    assert attendee.id,                 "id"
    assert attendee.registration,       "rg"
    assert attendee.first_name,         "fn"
    assert attendee.last_name,          "ln"
    assert attendee.home_phone,         "pn"
    assert attendee.email,              "em"
    assert attendee.street,             "sr"
    assert attendee.city,               "ct"
    assert attendee.state,              "st"
    assert attendee.zipcode,            "zp"
  end
end
