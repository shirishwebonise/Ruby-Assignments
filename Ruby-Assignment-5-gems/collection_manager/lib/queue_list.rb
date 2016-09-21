require_relative 'list'

##
# QueueList class implementing a typical Queue data structure

class QueueList < List
  def initialize(size = nil)
    super(size)
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
      raise CollectionError::QueueUnderflowError.new
    else
      @list.shift
    end
  end
end
