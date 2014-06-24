class Finder
  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def find(opts = {})
    results = entries
    opts.each do |key, value|
      value = Array(value).map(&:downcase)
      results = results.select { |entry| value.include?(entry[key].downcase) }
    end
    results
  end
end
