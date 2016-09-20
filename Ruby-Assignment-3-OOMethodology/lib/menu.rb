require_relative 'order'
require_relative 'product'

module UserMenu
  $ONE = 1
  $TWO = 2
  $THREE = 3
  $FOUR = 4
  $FIVE = 5
  $SIX = 6

  def self.greetCustomer
    puts "\nHello customer!"
  end

  def self.displayMenuTypeOfUser
    puts "are you.."
    puts "1 - costomer"
    puts "2 - shopkeeper"
    print "=> "
  end

  def self.displayCustomerMenu
    puts "\nwhat's your wish?"
    puts "  1 - see products"
    puts "  2 - search for a product"
    puts "  3 - buy a product"
    puts "  4 - EXIT"
    print "=> "
  end

  def self.getOrderInfo
    print "\nenter order id "
    order_id = gets.chomp
    print "\nenter product id "
    product_id = gets.chomp
    print "\nenter buyer name "
    buyer_name = gets.chomp
    print "\nenter credit card number "
    credit_card_number = gets.chomp
    print "\nenter cvv "
    cvv   = gets.chomp.to_i
    order = Order.new(order_id, product_id, buyer_name, credit_card_number, cvv)
    return order
  end

  def self.displayShopkeeperMenu
    puts "\nenter your choice"
    puts "  1 - add a product"
    puts "  2 - remove a product"
    puts "  3 - list all products"
    puts "  4 - search for a product"
    puts "  5 - edit a product"
    puts "  6 - EXIT"
    print "=> "
  end

  def self.getProductInfo
    print "\nenter product id "
    id = gets.chomp
    print "\nenter product name "
    name = gets.chomp
    print "\nenter product price "
    price = gets.chomp.to_i
    print "\nenter product stock "
    stock = gets.chomp.to_i
    print "\nenter the company "
    company = gets.chomp
    product = Product.new(id, name, price, stock, company)
    return product
  end

  def self.getProductNewInfo
    self.getProductInfo
  end
end
