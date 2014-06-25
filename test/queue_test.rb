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

  def test_it_prints_the_whole_queue_by_default
    que  = Queue.new
    que.load(data)
    attribute = :last_name
    p que.print_by(attribute)
  end
end
