require 'csv'
require 'pry'

class EntryRepository
  attr_reader :csv, :entries, :type

  def initialize(type)
    @type    = type
    @entries = []
  end

  def load(filename = './data/event_attendees.csv')
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_entries
    @csv.each do |row|
      entries << build_entry(row)
    end
    entries
  end

  def build_entry(row)
    type.build(row)
  end


end


if __FILE__== $0

end
