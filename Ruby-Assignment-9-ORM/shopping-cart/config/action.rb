require 'json'

class Action
  attr_reader :headers, :body, :request, :form_data

  def initialize(&block)
    @block = block
    @status = 200
    @headers = {"Content-Type" => "json"}
    @body = ""
  end

  def status(value = nil)
    value ? @status = value : @status
  end

  def params
    request.params
  end

  def form_data
    @form_data
  end

  def call(env)
    @request = Rack::Request.new(env)
    @body = self.instance_eval(&@block)
    @form_data = env["rack.request.form_hash"]
    [status, headers, [body]]
  end
end
