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
    repo.load(filename)
    repo.build_entries
    puts "Loaded #{repo.entries.count} items from #{filename}."
  end

  def set_queue(data)
    @queue.load(data)
  end

  def print_queue
    @queue.print_by(:last_name)
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
end
