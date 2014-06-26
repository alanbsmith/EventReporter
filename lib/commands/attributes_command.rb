require './lib/command'

class AttributesCommand < Command
  def self.aliases
    ['attributes']
  end
  
  def self.description
    'Lists the available attributes for use in query commands.'
  end

  def self.usage
    <<-USAGE
Usage:
  attributes
    USAGE
  end

  def run
    attributes = obj.attributes
    if attributes.count > 0
      puts "Available attributes: #{attributes.join(', ')}"
    else
      puts 'No attributes available.'
    end
  end
end
