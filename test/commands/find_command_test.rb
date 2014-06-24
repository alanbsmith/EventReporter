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

  def test_it_can_handle_a_single_attribute_and_condition
    f = FindCommand.new(nil, 'state CO')
    expected_state = { state: ['CO'] }
    assert_equal expected_state, f.parse_args

    f = FindCommand.new(nil, 'zipcode 80021')
    expected_zipcode = { zipcode: ['80021'] }
    assert_equal expected_zipcode, f.parse_args
  end

  def test_it_can_handle_a_single_attribute_and_multiple_conditions
    f = FindCommand.new(nil, 'state (CO, CA)')
    expected = { state: ['CO', 'CA'] }
    assert_equal expected, f.parse_args
  end

  def test_it_can_handle_multiple_attributes_with_a_single_condition
    f = FindCommand.new(nil, 'state CO and zipcode 80021')
    expected = { state: ['CO'], zipcode: ['80021'] }
    assert_equal expected, f.parse_args
  end

  def test_it_can_handle_multiple_attributes_with_multiple_conditions
    f = FindCommand.new(nil, 'state (CO, CA) and zipcode (80021, 92507)')
    expected = { state: ['CO', 'CA'], zipcode: ['80021', '92507'] }
    assert_equal expected, f.parse_args
  end
end
