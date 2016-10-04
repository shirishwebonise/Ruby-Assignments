require 'app/models/product'

class ProductsController
  def index
    Product.all.to_json
  end

  def show(id)
    Product.find(id).to_json
  end

  def create(params)
    Product.create(params).to_json
  end

  def update(params, id)
    Product.find(id).update(params).to_json
  end

  def destroy(id)
    Product.find(id).destroy.to_json
  end
end
