require 'config/request'
require 'config/request_handler'
require 'byebug'
Dir["app/controllers/*_controller.rb"].each {|file| require file }

class Router
  include RequestHandler
  @@content_type = {'Content-Type' => 'text/json'}
  @@NOT_FOUND = 404

  def call(env)
    @request = Request.new(Rack::Request.new(env))
    @response = handle_request
  end

  private
    def handle_request
      resp_status = 200

      section = @request.path.split('/')[1]
      case @request.method
      when "GET"
        resp_data = handle_get_request section, @request
      when "POST"
        resp_data = handle_post_request section, @request
      when "PATCH"
        resp_data = handle_patch_request section, @request
      when "DELETE"
        resp_data = handle_delete_request section, @request
      else
        resp_status = 501 # not implemented/not supported
        resp_data = "Method not implemented"
      end

      [resp_status, @@content_type, [resp_data]]
    end
end
