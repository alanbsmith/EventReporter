require './lib/command'

class LoadCommand < Command
  def self.aliases
    ['l', 'load']
  end

  def self.description
    'Loads a specified file into the repository.'
  end

  def self.usage
    <<-USAGE
Usage:
  load <filename>
    USAGE
  end

  def validate?
    args.count == 1
  end

  def run
    obj.load(args.first)
  end
end
