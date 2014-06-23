require './test/test_helper'
require './lib/finder'

class FinderTest < MiniTest::Test
  def entries
    [
      { first_name: 'John', last_name: 'Smith' },
      { first_name: 'Jane', last_name: 'Doe' },
      { first_name: 'Alex', last_name: 'Johnson' }
    ]
  end

  def test_it_exists
    assert Finder
  end

  def test_it_accepts_an_array_of_entries
    f = Finder.new(entries)
    assert_equal entries, f.entries
  end
end
