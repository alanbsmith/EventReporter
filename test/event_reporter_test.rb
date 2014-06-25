require './test/test_helper'
require './lib/event_reporter'

class EventReporterTest < MiniTest::Test
  def test_it_exists
    assert EventReporter
  end

  def test_it_inherits_from_repl
    assert_equal REPL, EventReporter.superclass
  end

  def test_it_has_a_repo
    r = EventReporter.new
    assert r.repo
  end

  def test_it_has_a_queue
    r = EventReporter.new
    assert r.queue
  end

  def test_it_responds_with_entries
    r = EventReporter.new
    assert_equal [], r.entries
  end

  def test_it_can_load_data_into_a_repo
    r = EventReporter.new
    assert_equal [], r.entries
    r.load('./test/fixtures/dummy_data.csv')
    assert_equal 4, r.entries.count
  end

  def test_it_can_set_the_queue
    r = EventReporter.new
    assert_equal [], r.queue.data
    r.set_queue([1, 2, 3])
    assert_equal [1, 2, 3], r.queue.data
  end

  def test_it_can_print_the_queue
    r = EventReporter.new
    assert r.respond_to?(:print_queue)
  end
end
