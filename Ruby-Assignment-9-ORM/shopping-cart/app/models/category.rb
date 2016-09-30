require 'app/models/model'

class Category < Model
  has_many :products
end
