require_relative '../test/test_helper.rb'
require 'minitest/mock'
require_relative '../lib/entry_repository'

class EntryRepositoryTest < Minitest::Test
  class TestType
    def self.build(row)
      new
    end
  end

  def test_it_exists
    assert EntryRepository
  end

  def test_it_loads_the_data
    repo = EntryRepository.new(nil)
    repo.load('./data/dummy_data.csv')
    assert repo.csv.is_a? CSV
    assert_equal 4, repo.csv.count
  end

  def test_it_builds_entries
    repo = EntryRepository.new(TestType)
    repo.load('./data/dummy_data.csv')
    repo.build_entries
    assert_equal 4, repo.entries.count
  end
end
