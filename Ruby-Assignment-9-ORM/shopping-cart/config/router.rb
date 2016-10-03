require 'config/request'
Dir["app/controllers/*_controller.rb"].each {|file| require file }

class Router
  @@content_type = {'Content-Type' => 'text/json'}
  @@NOT_FOUND = 404

  def call(env)
    @request = Request.new Rack::Request.new(env)
    @response = handle_request
  end

  private
    def handle_request
      resp_status = 202

      case @request.path.split('/')[1]
      when 'categories'
        resp_data = handle_get_request 'categories' if @request.method == "GET"
      when 'products'
        resp_data = handle_get_request 'products' if @request.method == "GET"
      else
        resp_data = "Not Found".to_json
        resp_status = @@NOT_FOUND
      end

      [resp_status, @@content_type, [resp_data]]
    end

    def handle_get_request(controller)
      data = []

      case @request.path.split('/')[2]
      when nil
        data = instance_of(controller).index
      when /^[0-9]+$/
        data = instance_of(controller).find(@request.params[:id])
      else
        data = nil
      end

      data
    end

    def instance_of(controller)
      controller_name = controller.capitalize+"Controller"
      puts controller_name
      Object.const_get(controller_name).new
    end
end
