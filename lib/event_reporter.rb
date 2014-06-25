require './lib/repl'
require './lib/entry_repository'
require './lib/attendee'

class EventReporter < REPL
  attr_reader :repo, :queue

  def initialize(commands = [])
    super
    @repo = EntryRepository.new(Attendee)
    @queue = []
  end

  def entries
    repo.entries
  end

  def load(filename)
    repo.load(filename)
    repo.build_entries
  end

  def set_queue(data)
    @queue = data
  end
end
