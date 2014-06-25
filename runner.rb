require './lib/repl'
Dir['./lib/commands/*.rb'].each { |file| require file }

REPL.new([LoadCommand, FindCommand]).run
