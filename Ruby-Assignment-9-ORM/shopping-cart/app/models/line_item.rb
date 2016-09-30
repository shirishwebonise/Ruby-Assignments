require 'app/models/model'

class LineItem < Model
  has_one :product
end
