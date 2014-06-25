require './test/test_helper'
require './lib/finder'

class FinderTest < MiniTest::Test
  class Entry
    attr_reader :id, :first_name, :last_name

    def initialize(row)
      @id = row[:id]
      @first_name = row[:first_name]
      @last_name = row[:last_name]
    end
  end

  def entries
    @entries ||= 
    [
      Entry.new(first_name: 'John', last_name: 'Doe'),
      Entry.new(first_name: 'Alex', last_name: 'Johnson'),
      Entry.new(first_name: 'John', last_name: 'Smith'),
      Entry.new(first_name: 'Jane', last_name: 'Doe')
    ]
  end

  def test_it_exists
    assert Finder
  end

  def test_it_accepts_an_array_of_entries
    f = Finder.new(entries)
    assert_equal entries, f.entries
  end

  def test_it_can_find_by_key_and_value
    f = Finder.new(entries)
    result = f.find(first_name: 'Alex').first
    assert_equal 'Alex', result.first_name
    assert_equal 'Johnson', result.last_name
    
    doe, smith = f.find(first_name: 'John').sort_by { |e| e.last_name }
    assert_equal 'John', doe.first_name
    assert_equal 'Doe', doe.last_name

    assert_equal 'John', smith.first_name
    assert_equal 'Smith', smith.last_name
  end

  def test_it_can_find_by_multiple_values
    f = Finder.new(entries)
    jane, alex = f.find(first_name: ['Jane', 'Alex']).sort_by { |e| e.last_name }

    assert_equal 'Jane', jane.first_name
    assert_equal 'Doe', jane.last_name

    assert_equal 'Alex', alex.first_name
    assert_equal 'Johnson', alex.last_name
  end

  def test_it_can_find_by_multiple_columns
    f = Finder.new(entries)
    result = f.find(first_name: 'John', last_name: 'Doe').first
    assert_equal 'John', result.first_name
    assert_equal 'Doe', result.last_name
  end

  def test_it_can_find_by_multiple_columns_and_values
    f = Finder.new(entries)
    john, jane, smith = f.find(first_name: ['John', 'Jane'], last_name: ['Doe', 'Smith']).sort_by { |e| e.last_name }
    assert_equal 'John', john.first_name
    assert_equal 'Doe', john.last_name
    assert_equal 'Jane', jane.first_name
    assert_equal 'Doe', jane.last_name
    assert_equal 'John', smith.first_name
    assert_equal 'Smith', smith.last_name
  end
end
