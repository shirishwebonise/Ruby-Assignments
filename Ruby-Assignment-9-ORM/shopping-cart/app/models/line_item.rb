require 'app/models/model'

class LineItem < Model
  belongs_to :cart
end
