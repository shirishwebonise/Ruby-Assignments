
class Order < Model
  belongs_to :cart
  has_many :products, through: :line_items
end
