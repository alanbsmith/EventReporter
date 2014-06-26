require './lib/command'

class LoadCommand < Command
  def self.aliases
    ['l', 'load']
  end

  def self.description
    'Loads a specified file into the repository.'
  end

  def self.usage
    <<-USAGE
Usage:
  load <filename>
    USAGE
  end

  def run
    file = args.first || './data/event_attendees.csv'
    if entries = obj.load(file)
      puts "Loaded #{entries.count} entries."
    else
      puts "File not found: #{file}"
    end
  end
end
