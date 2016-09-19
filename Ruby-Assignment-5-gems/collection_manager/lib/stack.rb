require_relative 'list'

##
# Stack class implementing a typical stack data structure

class Stack < List
  def initialize(size = nil)
    super()
    @size = size
  end

  ## 
  # This method implements push functionality of a stack
  #
  # Example:
  #   >> s = Stack.new
  #   >> s.push("something")
  #   >> s.push(20)

  def push(object)
    if(@size && @list.length >= @size)
      puts "Stack full!"
    else
      @list.push(object)
    end
  end

  ## 
  # This method implements pop functionality of a stack
  #
  # Example:
  #   >> s = Stack.new
  #   >> s.push("something")
  #   >> s.pop()
  # => "something"
  def pop()
    if(@list.length == 0)
      puts "Stack empty!"
    else
      @list.pop
    end
  end

  def to_s
    @list
  end
end
