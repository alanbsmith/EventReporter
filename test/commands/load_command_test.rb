require './test/test_helper'
require './lib/commands/load_command'

class LoadCommandTest < Minitest::Test
  def test_it_exists
    assert LoadCommand
  end

  def test_it_inherits_from_the_command_class
  end

  def test_it_takes_an_argument_filename
    filename = "people.csv"
    command = LoadCommand.new(filename)
    assert_equal "people.csv", command.load_file(filename)
  end
end
