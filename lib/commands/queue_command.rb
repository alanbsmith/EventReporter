require './lib/command'

class QueueCommand < Command
  def self.aliases
    ['queue']
  end

  def self.description
    'Queue allows storage and manipulation of the results of a find search.'
  end

  def self.usage
    <<-USAGE
Usage:
  queue clear
  queue count
  queue print
  queue print <attribute>
  queue save <filename>
    USAGE
  end

  def validate?
    if args[0] == 'save' && !args[1]
      false
    else
      true
    end
  end

  def run
    if args[0] && respond_to?(args[0])
      self.send(args[0])
    else
      invalid_args
    end
  end

  def print
    sort = args[1] || 'id'
    obj.print_queue(sort.downcase)
  end

  def clear
    puts 'The queue has been cleared.'
    obj.clear_queue
  end

  def count
    puts "Queue Count: #{obj.count_queue}"
  end

  def save
    puts "The queue has been saved to #{args[1]}."
    obj.save_queue(args[1])
  end
end
