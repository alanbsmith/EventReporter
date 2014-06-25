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
    @args = args
  end

  def validate?
    true
  end

  def execute
    if validate?
      run
    else
      invalid_args
    end
  end

  def invalid_args
    puts 'Wrong number of arguments for command.'
    puts self.class.usage
  end
end
