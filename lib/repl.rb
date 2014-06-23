class REPL
  attr_accessor :running
  attr_reader :commands

  def initialize(commands)
    @commands = commands
    @running = false
  end

  def run
    @running = true

    while running
      command = get_input
      process(command)
    end
  end

  def get_input
    print '> '
    gets.strip.downcase
  end

  def process(command)
    cmd_obj = commands.find { |cmd| cmd.aliases.include?(command) }
    if cmd_obj
      cmd_obj.new(self).execute
    else
      puts 'Unrecognized command.'
    end
  end
end
