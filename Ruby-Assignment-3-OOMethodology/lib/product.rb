
class Product
	def initialize(id, name, price, stock_item, company_name)
		@id = id
		@name = name
		@price = price
		@stockItem = stock_item
		@companyName = company_name
	end

	attr_reader :id
	attr_accessor :name, :price, :stockItem, :companyName

	def to_s
		"\nId : " + @id.to_s +
		"\n	Name : " + @name +
		"\n	Price : " + @price.to_s +
		"\n	Stock : " + @stockItem.to_s +
		"\n	Company : " + @companyName + "\n"
	end
end
