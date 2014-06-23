require './lib/repl'
require './lib/commands/quit_command'
require './lib/commands/help_command'

REPL.new([QuitCommand, HelpCommand]).run
