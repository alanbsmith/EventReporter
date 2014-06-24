require './test/test_helper'
require './lib/commands/help_command'

class HelpCommandTest < MiniTest::Test 
  def test_it_exists
    assert HelpCommand
  end

  def test_it_has_aliases
    assert_respond_to HelpCommand, :aliases
    assert_includes HelpCommand.aliases, 'h'
    assert_includes HelpCommand.aliases, 'help'
  end

  def test_it_has_a_description
    assert_respond_to HelpCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to HelpCommand, :usage
  end
end
