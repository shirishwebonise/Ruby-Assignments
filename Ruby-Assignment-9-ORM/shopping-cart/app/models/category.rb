require 'app/models/model'

class Category < Model
  belongs_to :products
end
