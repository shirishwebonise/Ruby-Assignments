require_relative 'stack'
require_relative 'queue_list'
require_relative 'errors/collection_errors'
##
# Collection Manager Class to manage collections

class CollectionManager
  include CollectionErrors
  def initialize
    @collections = Array.new
  end

  ##
  # Adds a new collection to the Hash object
  #
  # Example: 
  #   >> cm = CollectionManager.new
  #   >> cm.add(Stack.new)
  #
  # Arguments:
  #   a collection object, eg. Stack or Queue
  #   
  def add(collection_name, size=nil)
    begin
      @collections.push( Object.const_get(collection_name).new(size) )
    rescue
      not_a_class_error(collection_name)
    end
  end

  ##
  # Deletes a collection from the Hash object
  #
  # Example: 
  #   >> cm.delete(1)
  #
  # Arguments:
  #   id of the collection
  #
  def delete(index)
    obj = find index
    @collections.delete(index)
    obj = nil
  end

  ##
  # Returns a collection form the Hash id with key as id
  #
  # Example: 
  #   >> cm.find(1)
  #   => value at key 1 in the Hash object
  # Arguments:
  #   id of the collection
  #
  def find(index)
    @collections[index]
  end

  ##
  # Returns all the collections
  def all
    @collections
  end
end