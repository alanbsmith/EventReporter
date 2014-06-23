gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/entry_repository'
require '../data/event_attendees'

class EntryRepositoryTest < Minitest::Test

  def test_it_exists
    assert EntryRepository
  end

  def test_it_takes_an_argument
    file_name = 'event_attendees.csv'
    repo = EntryRepository.new(file_name)
    assert_equal 'event_attendees.csv', repo.file_name
  end

  # Format is functional, but how do I test it?
#   def test_it_formats_the_file
#     file_name = './data/event_attendees.csv'
#     repo = EntryRepository.new(file_name)
#     assert ??????
#   end
# end
