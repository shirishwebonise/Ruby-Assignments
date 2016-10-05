require 'byebug'
module RequestHandler
  def handle_get_request(controller, request)
    data = []

    id_parameter = request.path.split('/')[2]
    case id_parameter
    when nil
      data = instance_of(controller).index
    when /^[0-9]+$/
      data = instance_of(controller).show(id_parameter)
    else
      data = nil
    end

    data
  end

  def handle_post_request(controller, request)
    instance_of(controller).create(request.params)
  end

  def handle_delete_request(controller, request)
    id_parameter = request.path.split('/')[2]
    instance_of(controller).destroy(id_parameter) if !id_parameter.nil?
  end

  def handle_patch_request(controller, request)
    byebug
    split_path = request.path.split('/')
    if split_path.length == 5
      order_id = split_path[2]
      product_id = split_path[4]
      return OrdersController.new.add_to_cart(order_id, product_id) if request.path.split('/')[3] == 'add'
      return OrdersController.new.remove_from_cart(order_id, product_id) if request.path.split('/')[3] == 'remove'
    end
    byebug
    id_parameter = request.path.split('/')[2]
    instance_of(controller).update(request.params, id_parameter) if !id_parameter.nil?
  end

  private
    def instance_of(controller)
      controller_name = controller.capitalize+"Controller"
      puts controller_name
      Object.const_get(controller_name).new
    end
end
