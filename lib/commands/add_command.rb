require './lib/command'
require './lib/finder'

class AddCommand < Command
  def self.aliases
    ['a', 'add']
  end

  def self.description
    'Adds results to the existing queue.'
  end

  def self.usage
    <<-USAGE
Usage:
  add <attribute> <condition>
    USAGE
  end

  def validate?
    args.count >= 2
  end

  def run
    f = Finder.new(obj.entries)
    results = f.find(parse_args)
    puts "Adding #{results.count} entries to the queue."
    obj.add_to_queue(results)
  end

  def parse_args
    hash = {}
    attribute, *values = args
    hash.store attribute.to_sym, values
    hash
  end
end
