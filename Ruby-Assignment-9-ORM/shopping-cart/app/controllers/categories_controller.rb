require 'app/models/category'

class CategoriesController
  def index
    Category.all.to_json
  end

  def show(id)
    Category.find(id).to_json
  end

  def create(params)
    Category.create(params).to_json
  end

  def update(params, id)
    Category.find(id).update(params).to_json
  end

  def destroy(id)
    Category.find(id).destroy.to_json
  end
end
