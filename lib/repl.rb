require './lib/commands/help_command'
require './lib/commands/quit_command'

class REPL
  attr_accessor :running
  attr_reader :commands

  def initialize(commands = [])
    @commands = [QuitCommand, HelpCommand].concat(commands).uniq
    @running = false
  end

  def run
    @running = true

    while running
      command, *args = get_input
      process(command, args)
    end
  end

  def get_input
    print '> '
    gets.strip.split
  end

  def process(command, args)
    cmd_obj = commands.find { |cmd| cmd.aliases.include?(command) }
    if cmd_obj
      cmd_obj.new(self, args).execute
    else
      puts 'Unrecognized command.'
    end
  end
end
