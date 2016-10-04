require 'app/models/line_item'

class LineItemsController
  def index
    LineItem.all.to_json
  end
end
