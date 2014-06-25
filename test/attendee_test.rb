require_relative '../test/test_helper.rb'
require_relative '../lib/attendee'

class AttendeeTest < Minitest::Test

  def test_it_exists
    assert Attendee
  end

  def test_it_creates_an_attendee
    data = {id: "1" ,registration: "11/12/08 10:47",first_name:"Allison",last_name: "Nguyen", email:"arannon@jumpstartlab.com",phone: "6154385000", street: "3155 19th St NW", state: "Washington, DC",zipcode: "20010"}
    cleaner = Cleaner.new
    attendee = Attendee.new(data, cleaner)
    assert data, attendee
  end
end
