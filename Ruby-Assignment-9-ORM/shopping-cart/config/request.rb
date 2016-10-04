require 'byebug'

class Request
  attr_reader :params, :path, :method
  def initialize(request)
    @params = request.params
    @path = request.path_info
    @method = request.request_method.upcase
  end
end
