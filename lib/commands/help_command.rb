require './lib/command'

class HelpCommand < Command
  def self.aliases
    ['h', 'help']
  end

  def self.description
    'Displays available commands or help information for a command.'
  end

  def self.usage
    <<-USAGE
Usage:
  help
  help <command>
    USAGE
  end

  def run
    if args.count > 0
      help_for(args)
    else 
      help
    end
  end

  def help_for(args)
    cmd = obj.commands.find { |command| command.aliases.include?(args.first) }
    if cmd
      puts cmd.description
      puts cmd.usage
    else
      puts "Unable to find help for #{args.first}."
    end
  end

  def help
    puts 'Available commands:'
    obj.commands.each do |command|
      puts "* #{command.aliases.join(', ')}"
    end
  end
end
