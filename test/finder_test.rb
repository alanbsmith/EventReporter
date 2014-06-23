require './test/test_helper'
require './lib/finder'

class FinderTest < MiniTest::Test
  def entries
    [
      { first_name: 'John', last_name: 'Doe' },
      { first_name: 'Alex', last_name: 'Johnson' },
      { first_name: 'John', last_name: 'Smith' },
      { first_name: 'Jane', last_name: 'Doe' }
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
    result = f.find(first_name: 'Alex')
    assert_equal [{first_name: 'Alex', last_name: 'Johnson'}], result
    
    result = f.find(first_name: 'John').sort_by { |e| e[:last_name] }
    assert_equal [{first_name: 'John', last_name: 'Doe'}, {first_name: 'John', last_name: 'Smith'}], result
  end

  def test_it_can_find_by_multiple_values
    f = Finder.new(entries)
    result = f.find(first_name: ['Jane', 'Alex']).sort_by { |e| e[:last_name] }
    assert_equal [{first_name: 'Jane', last_name: 'Doe'}, {first_name: 'Alex', last_name: 'Johnson'}], result
  end

  def test_it_can_find_by_multiple_columns
    f = Finder.new(entries)
    result = f.find(first_name: 'John', last_name: 'Doe')
    assert_equal [{first_name: 'John', last_name: 'Doe'}], result
  end

  def test_it_can_find_by_multiple_columns_and_values
    f = Finder.new(entries)
    result = f.find(first_name: ['John', 'Jane'], last_name: ['Doe', 'Smith']).sort_by { |e| e[:last_name] }
    assert_equal [
      { first_name: 'John', last_name: 'Doe' },
      { first_name: 'Jane', last_name: 'Doe' },
      { first_name: 'John', last_name: 'Smith' }
    ], result
  end
end
