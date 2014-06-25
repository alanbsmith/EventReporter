class Command
  attr_reader :obj, :args

  def self.aliases
    []
  end

  def self.description
  end

  def self.usage
  end

  def initialize
  end

  def validate?
    true
  end

  def execute
  end
end
