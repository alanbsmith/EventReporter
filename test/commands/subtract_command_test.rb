require './test/test_helper'
require './lib/commands/subtract_command'
require 'minitest/mock'

class SubtractCommandTest < MiniTest::Test 
  def test_it_exists
    assert SubtractCommand
  end

  def test_it_has_aliases
    assert_respond_to SubtractCommand, :aliases
    assert_includes SubtractCommand.aliases, 's'
    assert_includes SubtractCommand.aliases, 'subtract'
  end

  def test_it_has_a_description
    assert_respond_to SubtractCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to SubtractCommand, :usage
  end

  def test_it_calls_set_queue_on_obj
    obj = MiniTest::Mock.new
    obj.expect(:subtract_from_queue, [], [[]])
    obj.expect(:queue_entries, [], [])
    SubtractCommand.new(obj, ['state', 'CO']).execute
    obj.verify
  end
  
  def test_it_can_handle_a_single_attribute_and_condition
    f = SubtractCommand.new(nil, ['state', 'co'])
    expected_state = { state: ['co'] }
    assert_equal expected_state, f.parse_args

    f = SubtractCommand.new(nil, ['zipcode', '80021'])
    expected_zipcode = { zipcode: ['80021'] }
    assert_equal expected_zipcode, f.parse_args
  end
end
