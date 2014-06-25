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
    # do some complicated stuff
  end

  def clear
    @data = []
    #clears the data
  end

  def print_by (attribute) #send is calling a method on an existing instance
    sorted_entries = data.sort_by {|entry| entry.send(attribute)  }
    print sorted_entries
    # sorted = data.sort_by { |x| x.send(sort_by) }
    # QueuePrinter.new(sorted).print
  end

  def save
    #saves queue as a new csv file

  end
end

if __FILE__== $0

end
