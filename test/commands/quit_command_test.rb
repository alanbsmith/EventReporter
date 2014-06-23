require './test/test_helper'
require 'minitest/mock'
require './lib/commands/quit_command'

class QuitCommandTest < MiniTest::Test 
  def test_it_exists
    assert QuitCommand
  end

  def test_it_has_aliases
    assert_respond_to QuitCommand, :aliases
    assert_includes QuitCommand.aliases, 'q'
    assert_includes QuitCommand.aliases, 'quit'
  end

  def test_it_has_a_description
    assert_respond_to QuitCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to QuitCommand, :usage
  end

  def test_it_sets_running_to_false
    mock = MiniTest::Mock.new
    mock.expect(:running=, [], [false])
    QuitCommand.new(mock, nil).execute
    mock.verify
  end
end
