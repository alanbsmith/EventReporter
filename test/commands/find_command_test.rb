require './test/test_helper'
require './lib/commands/find_command'

class FindCommandTest < MiniTest::Test 
  def test_it_exists
    assert FindCommand
  end

  def test_it_has_aliases
    assert_respond_to FindCommand, :aliases
    assert_includes FindCommand.aliases, 'f'
    assert_includes FindCommand.aliases, 'find'
  end

  def test_it_has_a_description
    assert_respond_to FindCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to FindCommand, :usage
  end
end
