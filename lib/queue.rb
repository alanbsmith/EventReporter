require 'table_print'
require 'csv'
require 'io/console'

class Queue
  attr_reader :data, :iterations

  def initialize
    @data = []
  end

  def load(data)
    @data = data
  end

  def count
    data.count
  end

  def add(data)
    @data.concat(data)
  end

  def subtract(to_remove)
    @data = data - to_remove
  end

  def clear
    @data = []
  end

  def print_by(attribute)
    sorted_entries = data.sort_by {|entry| entry.send(attribute)  }
    handle_loop(sorted_entries)
  end

  def handle_loop(sorted_entries)
    @iterations = 0
    sorted_entries.each_slice(10) do |slice|
      break if display_set(slice)
    end
  end

  def display_set(set)
    @iterations += 1
    tp set
    puts "Showing matches: #{start_range} - #{end_range}", ''
    if remaining_entries > 10
      chr = get_character
      return true if chr == 'q'
    end
    false
  end

  def start_range
    ((iterations - 1) * 10) + 1
  end

  def end_range
    if remaining_entries <= 10
      (start_range - 1) + remaining_entries
    else
      iterations * 10
    end
  end

  def remaining_entries
    data.count - (iterations-1) * 10
  end

  def get_character
    puts 'Press Space or Enter to continue. Q to Quit', ''
    STDIN.getch.downcase
  end

  def save(filename)
    headers = [:_, :regdate, :first_name, :last_name, :homephone, :email_address, :street, :city, :state, :zipcode]
    CSV.open(filename, 'wb') do |csv|
      csv << headers
      data.each do |d|
        csv << [
          d.id, d.regdate, d.first_name, d.last_name, d.homephone,
          d.email_address, d.street, d.city, d.state, d.zipcode
        ]
      end
    end
  end
end
