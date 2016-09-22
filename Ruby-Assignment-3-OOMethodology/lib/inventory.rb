
class Inventory
  def initialize
    @products = []
  end

  def add(product)
    @products.push product
  end

  def product(id)
    find_product(id)
  end

  def remove(id)
    product_to_delete = find_product(id)
    @products.delete( product_to_delete )
  end

  def search_with_name(name)
    @products.select{ |product| product.name.include? name}.collect {|product| product.to_s}
  end

  def list_products
    @products.each do |product|
      print product.to_s
    end
  end

  def decrement_stock(product_id)
    product = find_product(product_id)
    
    if product.stock_item > 0
      product.stock_item -= 1
      return true
    end

    return false
  end

  private
    def find_product(id)
      @products.find{ |product| product.id == id }
    end
end
