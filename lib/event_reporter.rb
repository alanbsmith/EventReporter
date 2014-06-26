require './lib/repl'
require './lib/entry_repository'
require './lib/attendee'
require './lib/queue'

class EventReporter < REPL
  attr_reader :repo, :queue

  def initialize(commands = [])
    super
    @repo = EntryRepository.new(Attendee)
    @queue = Queue.new
  end

  def entries
    repo.entries
  end

  def load(filename)
    if repo.load(filename)
      repo.build_entries
    end
  end

  def set_queue(data)
    @queue.load(data)
  end

  def print_queue(by_column)
    @queue.print_by(by_column)
  end

  def clear_queue
    @queue.clear
  end

  def count_queue
    @queue.count
  end

  def save_queue(filename)
    @queue.save(filename)
  end

  def add_to_queue(data)
    @queue.add(data)
  end

  def subtract_from_queue(data)
    @queue.subtract(data)
  end

  def queue_entries
    @queue.data
  end
end
