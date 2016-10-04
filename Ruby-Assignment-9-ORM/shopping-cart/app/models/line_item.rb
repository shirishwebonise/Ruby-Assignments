require 'app/models/model'

class LineItem < Model
  belongs_to :order
  has_one :product
end
