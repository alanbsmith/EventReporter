require 'csv'

class EntryRepository
  attr_reader :csv, :entries, :type

  def initialize(type)
    @type    = type
    @entries = []
    @csv     = []
  end

  def load(filename)
    if File.file?(filename)
      @csv = CSV.open(filename, headers: true, header_converters: :symbol)
      true
    else
      false
    end
  end

  def build_entries
    @entries = []
    @csv.each do |row|
      entries << build_entry(row)
    end
    entries
  rescue StandardError
    false
  end

  def build_entry(row)
    type.build(row)
  end
end
