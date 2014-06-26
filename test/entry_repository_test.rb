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

  def test_it_creates_a_csv_object
    repo = EntryRepository.new(nil)
    repo.load('./test/fixtures/dummy_data.csv')
    assert repo.csv.is_a? CSV
  end

  def test_it_doesnt_load_a_nonexisting_file
    repo = EntryRepository.new(nil)
    repo.load('./test/fixtures/does_not_exist.csv')
    assert_equal 0, repo.csv.count
  end

  def test_it_builds_entries
    repo = EntryRepository.new(TestType)
    repo.load('./test/fixtures/dummy_data.csv')
    repo.build_entries
    assert_equal 4, repo.entries.count
  end
end
