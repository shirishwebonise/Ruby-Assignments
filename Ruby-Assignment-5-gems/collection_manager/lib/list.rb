require_relative 'collection'

##
# List class implementing a list collection

class List < Collection
  def initialize(size = nil)
    super()
    @list = Array.new
    @size = size
  end

  ## 
  # This method appends an element to the list

  def push(object)
    if(@size && @list.length >= @size)
      puts "Stack full!"
    else
      @list.push(object)
    end
  end

  ##
  # Defines to string method
  def to_s
    @list
  end
end
