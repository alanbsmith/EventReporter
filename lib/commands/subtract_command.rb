require './lib/command'
require './lib/finder'

class SubtractCommand < Command
  def self.aliases
    ['s', 'subtract']
  end

  def self.description
    'Removes matching results from the existing queue.'
  end

  def self.usage
    <<-USAGE
Usage:
  subtract <attribute> <condition>
    USAGE
  end
  
  def validate?
    args.count >= 2
  end

  def run
    finder = Finder.new(obj.queue_entries)
    results = finder.find(parse_args)
    puts "Removing #{results.count} results from the queue."
    obj.subtract_from_queue(results)
  end

  def parse_args
    hash = {}
    attribute, *values = args
    hash.store attribute.to_sym, values
    hash
  end
end
