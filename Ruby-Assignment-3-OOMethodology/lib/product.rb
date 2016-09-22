
class Product
  def initialize(id, name, price, stock_item, company_name)
    @id = id
    @name = name
    @price = price
    @stock_item = stock_item
    @company_name = company_name
  end

  attr_reader :id
  attr_accessor :name, :price, :stock_item, :company_name

  def to_s
    "\nId : " + @id.to_s +
    "\n Name : " + @name +
    "\n Price : " + @price.to_s +
    "\n Stock : " + @stock_item.to_s +
    "\n Company : " + @company_name + "\n"
  end
end
