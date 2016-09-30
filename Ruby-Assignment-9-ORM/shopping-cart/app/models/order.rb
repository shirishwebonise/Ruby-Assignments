
class Order < Model
  belongs_to :cart
  has_many :line_items
end
