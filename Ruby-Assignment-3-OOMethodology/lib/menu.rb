require_relative 'order'
require_relative 'product'

module UserMenu
  $ONE = 1
  $TWO = 2
  $THREE = 3
  $FOUR = 4
  $FIVE = 5
  $SIX = 6

  def self.greet_customer
    puts "\nHello customer!"
  end

  def self.display_menu_type_of_user
    puts "are you.."
    puts "1 - costomer"
    puts "2 - shopkeeper"
    print "=> "
  end

  def self.display_customer_menu
    puts "\nwhat's your wish?"
    puts "  1 - see products"
    puts "  2 - search for a product"
    puts "  3 - buy a product"
    puts "  4 - EXIT"
    print "=> "
  end

  def self.get_order_info
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

  def self.display_shopkeeper_menu
    puts "\nenter your choice"
    puts "  1 - add a product"
    puts "  2 - remove a product"
    puts "  3 - list all products"
    puts "  4 - search for a product"
    puts "  5 - edit a product"
    puts "  6 - EXIT"
    print "=> "
  end

  def self.get_product_info
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

  def self.get_product_new_info
    self.get_product_info
  end
end
