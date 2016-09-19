
class Inventory
  def initialize
    @products = []
  end

  def add(product)
    @products.push product
  end

  def product(id)
    findProduct(id)
  end

  def remove(id)
    product_to_delete = findProduct(id)
    @products.delete( product_to_delete )
  end

  def searchWithName(name)
    @products.select{ |product| product.name.include? name}.collect {|product| product.to_s}
  end

  def listProducts
    @products.each do |product|
      print product.to_s
    end
  end

  def decrementStock(productId)
    product = findProduct(productId)
    
    if product.stockItem > 0
      product.stockItem -= 1
      return true
    end

    return false
  end

  private
    def findProduct(id)
      @products.find{ |product| product.id == id }
    end
end
