require './lib/repl'
Dir['./lib/commands/*.rb'].each { |file| require file }

REPL.new([QuitCommand, HelpCommand]).run
