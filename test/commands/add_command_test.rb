require './test/test_helper'
require './lib/commands/add_command'
require 'minitest/mock'

class AddCommandTest < MiniTest::Test 
  def test_it_exists
    assert AddCommand
  end

  def test_it_has_aliases
    assert_respond_to AddCommand, :aliases
    assert_includes AddCommand.aliases, 'a'
    assert_includes AddCommand.aliases, 'add'
  end

  def test_it_has_a_description
    assert_respond_to AddCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to AddCommand, :usage
  end

  def test_it_calls_set_queue_on_obj
    obj = MiniTest::Mock.new
    obj.expect(:add_to_queue, [], [[]])
    obj.expect(:entries, [], [])
    AddCommand.new(obj, ['state', 'CO']).execute
    obj.verify
  end
  
  def test_it_can_handle_a_single_attribute_and_condition
    f = AddCommand.new(nil, ['state', 'co'])
    expected_state = { state: ['co'] }
    assert_equal expected_state, f.parse_args

    f = AddCommand.new(nil, ['zipcode', '80021'])
    expected_zipcode = { zipcode: ['80021'] }
    assert_equal expected_zipcode, f.parse_args
  end
end
