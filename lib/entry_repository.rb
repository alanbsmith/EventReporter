require 'csv'

class EntryRepository
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def format
    contents = CSV.open @filename, headers: true, header_converters: :symbol
    contents.each do |row|
    name = row[:first_name]
    end
  end
end
