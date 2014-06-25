require './lib/command'

class QuitCommand < Command
  def self.aliases
    ['q', 'quit']
  end

  def self.description
    'Quits the program.'
  end

  def self.usage
    'Usage: quit'
  end

  def execute
    obj.running = false
  end
end
