
class Order < Model
  has_many :products, through: :line_items
end
