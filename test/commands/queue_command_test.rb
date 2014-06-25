require './test/test_helper'
require './lib/commands/queue_command'
require 'minitest/mock'

class QueueCommandTest < MiniTest::Test 
  def test_it_exists
    assert QueueCommand
  end

  def test_it_has_aliases
    assert_respond_to QueueCommand, :aliases
    assert_includes QueueCommand.aliases, 'queue'
  end

  def test_it_has_a_description
    assert_respond_to QueueCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to QueueCommand, :usage
  end

  def test_it_calls_print_queue_when_printing
    obj = MiniTest::Mock.new
    obj.expect(:print_queue, [], [])
    QueueCommand.new(obj, ['print']).execute
    obj.verify
  end

  def test_it_calls_clear_queue_when_clearing
    obj = MiniTest::Mock.new
    obj.expect(:clear_queue, [], [])
    QueueCommand.new(obj, ['clear']).execute
    obj.verify
  end
  
  def test_it_calls_clear_queue_when_clearing
    obj = MiniTest::Mock.new
    obj.expect(:count_queue, [], [])
    QueueCommand.new(obj, ['count']).execute
    obj.verify
  end

  def test_it_calls_clear_queue_when_clearing
    obj = MiniTest::Mock.new
    obj.expect(:save_queue, [], ['file.csv'])
    QueueCommand.new(obj, ['save', 'file.csv']).execute
    obj.verify
  end
end
