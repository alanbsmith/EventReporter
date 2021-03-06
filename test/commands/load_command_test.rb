require './test/test_helper'
require './lib/commands/load_command'
require 'minitest/mock'

class LoadCommandTest < Minitest::Test
  def test_it_exists
    assert LoadCommand
  end
  
  def test_it_has_aliases
    assert_respond_to LoadCommand, :aliases
    assert_includes LoadCommand.aliases, 'l'
    assert_includes LoadCommand.aliases, 'load'
  end

  def test_it_has_a_description
    assert_respond_to LoadCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to LoadCommand, :usage
  end

  def test_it_calls_load_on_obj
    obj = MiniTest::Mock.new
    obj.expect(:load, [], ['file.csv'])
    LoadCommand.new(obj, ['file.csv']).execute
    obj.verify
  end
end
