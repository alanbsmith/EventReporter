require 'readline'
require './lib/commands/help_command'
require './lib/commands/quit_command'

class REPL
  attr_accessor :running
  attr_reader :commands, :comp

  def initialize(commands = [])
    @commands = [QuitCommand, HelpCommand].concat(commands).uniq
    @running = false
    setup_auto_completion
  end

  def setup_auto_completion
    aliases = @commands.collect { |c| c.aliases }.flatten
    comp = proc { |s| aliases.grep(/^#{Regexp.escape(s)}/) }
    Readline.completion_append_character = ' '
    Readline.completion_proc = comp
  end

  def run
    @running = true

    puts intro if intro

    while running
      command, *args = get_input
      process(command, args)
    end
  end

  def intro
  end

  def get_input
    Readline.readline('> ', true).strip.split
  end

  def process(command, args)
    puts
    cmd_obj = commands.find { |cmd| cmd.aliases.include?(command) }
    if cmd_obj
      cmd_obj.new(self, args).execute
    else
      puts 'Unrecognized command.'
    end
    puts
  end
end
