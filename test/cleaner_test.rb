require_relative '../test/test_helper.rb'
require_relative '../lib/cleaner'
require_relative '../lib/attendee'

class CleanerTest < Minitest::Test

  def test_it_exists
    assert Cleaner
  end

  def test_it_cleans_a_first_name
    raw_first_name = "tErTuLlIaN"
    cleaner        = Cleaner.new
    assert_equal "Tertullian", cleaner.first_name(raw_first_name)
    assert_equal '', cleaner.first_name(nil)
  end

  def test_it_cleans_a_last_name
    raw_last_name = "aQuInAs"
    cleaner       = Cleaner.new
    assert_equal "Aquinas", cleaner.last_name(raw_last_name)
    assert_equal '', cleaner.last_name(nil)
  end

  def test_it_cleans_a_zipcode
    raw_zipcode = 924
    cleaner     = Cleaner.new
    assert_equal "00924", cleaner.zipcode(raw_zipcode)

    raw_zipcode = 12345678
    cleaner     = Cleaner.new
    assert_equal "12345", cleaner.zipcode(raw_zipcode)

    raw_zipcode = nil
    cleaner     = Cleaner.new
    assert_equal "00000", cleaner.zipcode(raw_zipcode)
  end

  def test_it_cleans_phone_numbers
    raw_phone = "(432) 654,12-34"
    cleaner   = Cleaner.new
    assert_equal "(432) 654-1234", cleaner.home_phone(raw_phone)

    raw_phone = nil
    cleaner   = Cleaner.new
    assert_equal "N/A", cleaner.home_phone(raw_phone)

    raw_phone = "6154385000"
    cleaner   = Cleaner.new
    assert_equal "(615) 438-5000", cleaner.home_phone(raw_phone)
  end

  def test_it_validates_email
    raw_email = "jbrabeth.buckley@jumpstartlab.com"
    cleaner   = Cleaner.new
    assert_equal raw_email, cleaner.email(raw_email)

    raw_email = "faker_mc_fakerson.faker.com"
    cleaner   = Cleaner.new
    assert_equal 'N/A', cleaner.email(raw_email)

    raw_email = nil
    cleaner   = Cleaner.new
    assert_equal 'N/A', cleaner.email(raw_email)
  end
end
