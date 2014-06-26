require './lib/command'

class AttributesCommand < Command
  def self.aliases
    ['attributes']
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
