require './lib/command'

class QuitCommand < Command
  def self.aliases
    ['q', 'quit', 'exit']
  end

  def self.description
    'Quits the program.'
  end

  def self.usage
    <<-USAGE
Usage:
  quit
  USAGE
  end

  def run
    obj.running = false
  end
end
