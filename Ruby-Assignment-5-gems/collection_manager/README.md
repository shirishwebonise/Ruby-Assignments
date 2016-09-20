Collection Manager
==========

Ruby gem to create and manage collections of objects. It allows to create and add collections viz. Stacks, Queues(used as QueueList) with the given size(optional). Will map your collections as key value pairs using a Hash object, so you can access a specific collection using the program generated key.

## Gem installation
    $ gem install 'collection_manager'

## Using the gem
In your .rb file, require the gem 
    $ require 'collection_manager'

## Example usage
    $ cm = CollectionManager.new
    $ s = Stack.new
    $ cm.add s
    $ cm.add(Stack.new 4)
    $ cm.add(Queue.new)
    $ cm.add(Queue.new 100)
    
### Stack Example
    $ s = Stack.new 4
    $ s.push 20
    $ s.push "hello"
    $ s.pop

### QueueList Example
    $ s = Stack.new 4
    $ s.push 20
    $ s.push "hello"
    $ s.pop
