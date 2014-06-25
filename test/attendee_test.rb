require_relative '../test/test_helper.rb'
require_relative '../lib/attendee'

class AttendeeTest < Minitest::Test

  def data
    {
      _: "1",
      regdate: "11/12/08 10:47",
      first_name:"Allison",
      last_name: "Nguyen",
      email_address:"arannon@jumpstartlab.com",
      homephone: "615.438-5000",
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
    assert data[:_], attendee.id
    assert data[:regdate], attendee.regdate
    assert data[:first_name], attendee.first_name
    assert data[:last_name], attendee.last_name
    assert data[:homephone], attendee.homephone
    assert data[:email_address], attendee.email_address
    assert data[:street], attendee.street
    assert data[:city], attendee.city
    assert data[:state], attendee.state
    assert data[:zipcode], attendee.zipcode
  end
end
