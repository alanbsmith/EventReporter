gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/load'

class LoadTest < Minitest::Test

  def test_it_exists
    assert Load
  end

  def test_it_inherits_from_the_command_class
  end

  def test_it_takes_an_argument_filename
    filename = "people.csv"
    command = Load.new(filename)
    assert_equal "people.csv", command.load_file(filename)
  end

end
