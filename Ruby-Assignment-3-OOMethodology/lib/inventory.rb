
class Inventory
	def initialize
		@products = []
	end

	def add(product)
		@products.push product
	end

	def product(id)
		@products.find{ |product| product.id == id }
	end

	def remove(id)
		@products.delete_if{ |product| product.id == id }
	end

	def searchWithName(name)
		@products.select{ |product| product.name.include? name}.each {|product| product.to_s}
	end

	def setStockOfItem(id, stock)
		@products.find{ |product| product.id == id }.stockItem = stock
	end

	def listProducts
		@products.each do |product|
			print product.to_s
		end
	end
end
