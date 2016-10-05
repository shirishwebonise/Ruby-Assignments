require 'app/models/order'
require 'app/models/line_item'

class OrdersController
  def create
    Orders.create({"status":"init", "delivery_address":""})
  end

  def add_to_cart(order_id, product_id)
    begin
      order = Order.find(order_id)
    rescue
      order = Order.new(status: 'init', delivery_address: '')
    end
    li = LineItem.create(order_id:order_id, quantity:1)
    order.line_items << li
  end

  def remove_from_cart(order_id, product_id)
    begin
      order = Order.find(order_id)
      order.destroy
    rescue
    end
  end
end
