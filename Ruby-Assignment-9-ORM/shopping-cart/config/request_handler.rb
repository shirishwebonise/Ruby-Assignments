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

  end

  private
    def instance_of(controller)
      controller_name = controller.capitalize+"Controller"
      puts controller_name
      Object.const_get(controller_name).new
    end
end
