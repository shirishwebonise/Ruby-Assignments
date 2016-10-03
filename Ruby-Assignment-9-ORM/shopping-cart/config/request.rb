
class Request
  attr_reader :params, :path, :method, :form_data
  def initialize(request)
    @form_data = request.body.read
    @params = request.params
    @path = request.path_info
    @method = request.request_method.upcase
  end
end
