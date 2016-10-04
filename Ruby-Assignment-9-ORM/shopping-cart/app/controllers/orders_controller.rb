require 'app/models/order'

class OrdersController
  def create
    Orders.create({"status":"init", "delivery_address":""})
  end
end
