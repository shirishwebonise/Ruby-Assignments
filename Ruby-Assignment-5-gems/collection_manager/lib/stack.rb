require_relative 'list'
require_relative 'errors/collection_errors'

##
# Stack class implementing a typical stack data structure
class Stack < List
  def initialize(size = nil)
    super(size)
  end

  ## 
  # This method implements pop functionality of a stack (LIFO)
  #
  # Example:
  #   >> s = Stack.new
  #   >> s.push("else")
  #   >> s.push("something")
  #   >> s.pop()
  # => "something"
  def pop()
    if(@list.length == 0)
      raise CollectionErrors::StackUnderflowError.new
    else
      @list.pop
    end
  end
end
