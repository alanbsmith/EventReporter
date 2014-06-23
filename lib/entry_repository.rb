require 'csv'
require 'pry'

class EntryRepository
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def format
    contents = CSV.open @file_name, headers: true, header_converters: :symbol
    contents.each do |row|
    name = row[:first_name]
    end
  end
end


if __FILE__== $0
  file_name = './data/event_attendees.csv'
  repo = EntryRepository.new(file_name)
  repo.format
end
