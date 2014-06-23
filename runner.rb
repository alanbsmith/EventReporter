require './lib/repl'
require './lib/commands/quit_command'

REPL.new([QuitCommand]).run
