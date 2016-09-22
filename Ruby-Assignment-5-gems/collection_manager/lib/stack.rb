require_relative 'list'
require_relative 'errors/collection_errors'

##
# Stack class implementing a typical stack data structure
class Stack
  include CollectionErrors
  include List

  def initialize(size = nil)
    @list = Array.new
    @size = size
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
      min_size_error(self.class)
    else
      @list.pop
    end
  end
end
