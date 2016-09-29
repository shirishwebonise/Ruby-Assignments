require 'app/models/model'

class Product < Model
  has_one :category
end
