require 'app/models/category'

class CategoriesController
  def self.find(id=nil)
    if !id.nil?
      categories = Category.find(id)
    else
      categories = Category.all
    end
    categories.to_json
  end

  def self.create(params)
    category = Category.new(params)
  end
end
