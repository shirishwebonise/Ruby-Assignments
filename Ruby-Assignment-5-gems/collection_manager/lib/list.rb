require_relative 'errors/collection_errors'

##
# List class implementing a list collection
module List
  include CollectionErrors

  ## 
  # This method appends an element to the list
  def push(object)
    if(@size && @list.length >= @size)
      max_size_error("List")
    else
      @list.push(object)
    end
  end
end
