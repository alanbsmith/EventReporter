class Command
  attr_reader :obj, :args

  def self.aliases
    []
  end

  def self.description
  end

  def self.usage
  end

  def initialize(obj, args)
    @obj = obj
    @args = args.to_s.downcase
  end

  def validate?
    true
  end

  def execute
  end
end
