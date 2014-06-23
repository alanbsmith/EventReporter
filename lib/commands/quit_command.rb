class QuitCommand
  attr_reader :obj

  def self.aliases
    ['q', 'quit']
  end

  def initialize(obj)
    @obj = obj
  end

  def execute
    obj.running = false
  end
end
