require_relative 'collection'
require_relative 'stack'
require_relative 'queue_list'
##
# Collection Manager Class to manage collections

class CollectionManager
  def initialize
    @current_id = 0;
    @collections = Hash.new
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
  def add(collection)
    @current_id += 1
    @collections[@current_id] = collection
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
  def delete(id)
    @collections.delete(id)
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
  def find(id)
    @collections[id]
  end

  ##
  # Returns all the collections
  def all
    @collections
  end
end