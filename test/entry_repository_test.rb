gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/entry_repository'
# require_relative '../data/event_attendees.csv'

class EntryRepositoryTest < Minitest::Test

  def test_it_exists
    assert EntryRepository
  end

  def test_it_takes_an_argument
    filename = 'event_attendees.csv'
    repo = EntryRepository.new(filename)
    assert_equal 'event_attendees.csv', repo.filename
  end

  def test
  end
end
