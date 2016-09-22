require_relative 'list'
require_relative 'errors/collection_errors'

##
# QueueList class implementing a typical Queue data structure
class QueueList
  include CollectionErrors
  include List

  def initialize(size = nil)
    @list = Array.new
    @size = size
  end

  ## 
  # This method implements remove functionality of a Queue (FIFO)
  #
  # Example:
  #   >> s = QueueList.new
  #   >> s.push("else")
  #   >> s.push("something")
  #   >> s.remove()
  # => "else"
  def remove()
    if(@list.length == 0)
      min_size_error(self.class)
    else
      @list.shift
    end
  end
end
