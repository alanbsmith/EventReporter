require 'table_print'
require 'csv'

class Queue
  attr_reader :data

  def initialize
    @data = []
  end

  def load(data)
    @data = data
  end

  def count
    data.count
  end

  def clear
    @data = []
  end

  def print_by(attribute)
    sorted_entries = data.sort_by {|entry| entry.send(attribute)  }
    tp sorted_entries
  end

  def save(filename)
    headers = [:_, :regdate, :first_name, :last_name, :homephone, :email_address, :street, :city, :state, :zipcode]
    CSV.open(filename, 'wb', headers: headers, write_headers: true) do |csv|
      data.each do |d|
        csv << [
          d.id, d.regdate, d.first_name, d.last_name, d.homephone,
          d.email_address, d.street, d.city, d.state, d.zipcode
        ]
      end
    end
  end
end
