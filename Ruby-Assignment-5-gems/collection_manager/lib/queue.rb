require_relative 'list'

class Queue < List
  def initialize(size = nil)
    super()
    @size = size
  end

  def push(object)
    if(@list.length < @size)
      @list.push(object)
    else
      puts "Queue full!"
    end
  end

  def remove()
    if(@list.length == 0)
      puts "Queue empty!"
    else
      @list.pop
    end
  end

  def to_s
    @list
  end
end
