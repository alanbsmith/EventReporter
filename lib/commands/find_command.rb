require './lib/command'

class FindCommand < Command
  def self.aliases
    ['f', 'find']
  end

  def self.description
  end

  def self.usage
  end

  def initialize(obj, args)
    @obj = obj
    @args = args
  end

  def execute
  end
end
