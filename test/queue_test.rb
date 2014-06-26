require_relative '../test/test_helper.rb'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
  class Entry
    attr_reader :id, :last_name

    def initialize(row)
      @id = row[:id]
      @last_name = row[:last_name]
    end
  end

  def data
    @data ||=
    [
      Entry.new({ id: 1, last_name: 'Dostoevsky' }),
      Entry.new({ id: 2, last_name: 'Bonhoeffer'}),
      Entry.new({ id: 3, last_name: 'Tolstoy'}),
      Entry.new({ id: 4, last_name: 'Kierkegaard'})
    ]
  end
  def test_it_exists
    assert Queue
  end

  def test_it_loads_data
    que = Queue.new
    que.load(data)
    assert_equal 4, que.data.count
  end

  def test_it_counts_attendees
    que = Queue.new
    que.load(data)
    assert_equal 4, que.count
  end

  def test_it_clears_the_queue
    que = Queue.new
    que.load(data)
    assert [], que.clear
  end

  def test_it_adds_to_the_queue
    que = Queue.new
    que.load(data)
    assert_equal 4, que.count
    que.add([1, 2])
    assert_equal 6, que.count
  end

  def test_it_subtracts_from_the_queue
    que = Queue.new
    que.load([1, 2, 3, 4, 5, 6])
    que.subtract([1, 2])
    assert_equal [3, 4, 5, 6], que.data
  end
end
