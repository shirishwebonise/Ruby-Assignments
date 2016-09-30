require 'app/models/model'

class Product < Model
  belongs_to :category
end
