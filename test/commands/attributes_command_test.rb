require './test/test_helper'
require './lib/commands/attributes_command'
require 'minitest/mock'

class AttributesCommandTest < MiniTest::Test 
  def test_it_exists
    assert AttributesCommand
  end

  def test_it_has_aliases
    assert_respond_to AttributesCommand, :aliases
    assert_includes AttributesCommand.aliases, 'attributes'
  end

  def test_it_has_a_description
    assert_respond_to AttributesCommand, :description
  end

  def test_it_has_a_usage
    assert_respond_to AttributesCommand, :usage
  end
  
  def test_it_calls_attributes_on_obj
    obj = MiniTest::Mock.new
    obj.expect(:attributes, [], [])
    AttributesCommand.new(obj, []).execute
    obj.verify
  end
end
