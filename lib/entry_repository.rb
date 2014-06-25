require 'csv'
require 'pry'

class EntryRepository
  attr_reader :csv, :entries, :type

  def initialize(type)
    @type    = type
    @entries = []
    @csv     = []
  end

  def load(filename)
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_entries
    @entries = []
    @csv.each do |row|
      entries << build_entry(row)
    end
    entries
  end

  def build_entry(row)
    type.build(row)
  end
end
