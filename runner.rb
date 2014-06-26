require './lib/event_reporter'
Dir['./lib/commands/*.rb'].each { |file| require file }

EventReporter.new([LoadCommand, FindCommand, QueueCommand, AddCommand, SubtractCommand]).run
