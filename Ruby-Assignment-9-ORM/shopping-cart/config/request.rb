
class Request
  attr_reader :params, :path, :method
  def initialize(request)
    @params = request.body.read
    @path = request.path_info
    @method = request.request_method.upcase
  end
end
