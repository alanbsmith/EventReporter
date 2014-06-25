require './lib/command'

class FindCommand < Command
  attr_reader :hash

  def self.aliases
    ['f', 'find']
  end

  def self.description
  end

  def self.usage
  end

  def initialize(obj, args)
    super
    @hash = {}
  end

  def execute
  end

  def parse_args
    groups = args.split('and').map(&:strip)
    groups.each do |group|
      handle_group(group)
    end
    hash
  end

  private

  def parse_grouped_values(values)
    values = values.split(',').map(&:strip)
    values.collect do |value|
      value.gsub(/[\(\)]+/, '')
    end
  end

  def handle_group(group)
    attribute, *values = group.split
    values = values.join(' ')
    if values =~ /\(.*?\)/
      hash.store attribute.to_sym, parse_grouped_values(values)
    else
      hash.store attribute.to_sym, Array(values)
    end
  end
end
