require 'config/action'

class Framework
  def self.app
    @app ||= begin
      Rack::Builder.new do
        map "/" do
          run ->(env) {[202, {'Content-Type' => 'text/plain'}, ['Welcome!']] }
        end
      end
    end
  end
end

def route(pattern, &block)
  Framework.app.map(pattern) do
    run Action.new(&block)
  end
end
