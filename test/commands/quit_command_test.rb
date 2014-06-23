require './test/test_helper'
require 'minitest/mock'
require './lib/commands/quit_command'

class QuitCommandTest < MiniTest::Test 
  def test_it_exists
    assert QuitCommand
  end

  def test_it_has_aliases
    assert QuitCommand.aliases
    assert_includes QuitCommand.aliases, 'q'
    assert_includes QuitCommand.aliases, 'quit'
  end

  def test_it_sets_running_to_false
    mock = MiniTest::Mock.new
    mock.expect(:running=, [], [false])
    QuitCommand.new(mock).execute
    mock.verify
  end
end
