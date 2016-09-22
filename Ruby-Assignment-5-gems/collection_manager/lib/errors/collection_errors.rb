
module CollectionErrors
  def not_a_class_error(class_name)
    puts "Cannot instantiate: " + class_name.to_s
    puts "No such class exists"
  end

  def max_size_error(collection_type="Collection")
    puts collection_type.to_s + " is full!"
  end

  def min_size_error(collection_type="Collection")
    puts collection_type.to_s + " is empty!"
  end
end
