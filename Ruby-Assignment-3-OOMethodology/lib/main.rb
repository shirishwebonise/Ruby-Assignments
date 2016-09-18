#!/usr/bin/env ruby -wKU

require './product'
require './inventory'
require './order'
require 'pstore'

inventory = Inventory.new

# read the file for inventory
dbInventory = PStore.new("inventory")
dbInventory.transaction(true) do
  dbInventory.roots.each do |data_root_name|
    inventory.add dbInventory[data_root_name]
  end
end

# write data to file
def saveToFile(fileName, data, key)
	fileContent = PStore.new(fileName)

	fileContent.transaction do
		fileContent[key] = data
	end
end

def updateProduct(product)
	saveToFile("inventory", product, product.id)
end

while true do
	puts "are you.."
	print "1 - costomer \n2 - shopkeeper\n=> "
	type_of_user = gets.chomp.to_i

	if !([1,2].include? type_of_user)
		puts "wrong input"
		exit
	end

	if type_of_user == 1
		puts "\nHello customer!"

		while true do
			puts "\nwhat's your wish?"
			puts "	1 - see products"
			puts "	2 - search for a product"
			puts "	3 - buy a product"
			puts "	4 - EXIT"
			print "=> "

			selected_option = gets.chomp.to_i

			case selected_option
			when 1
				inventory.listProducts
			when 2
				print "\nenter product name to search "
				search_name = gets.chomp
				inventory.searchWithName search_name
			when 3
				print "\nenter order id "
				order_id = gets.chomp
				print "\nenter product id "
				product_id = gets.chomp
				print "\nenter buyer name "
				buyer_name = gets.chomp
				print "\nenter credit card number "
				credit_card_number = gets.chomp
				print "\nenter cvv "
				cvv = gets.chomp.to_i
				order = Order.new(order_id, product_id, buyer_name, credit_card_number, cvv)
				saveToFile("orders", order, order.id)
			when 4
				exit
			else
				puts "you have made a wrong choice, try again"
			end
		end
	else
		while true do
			puts "\nenter your choice"
			puts "	1 - add a product"
			puts "	2 - remove a product"
			puts "	3 - list all products"
			puts "	4 - search for a product"
			puts "	5 - edit a product"
			puts "	6 - EXIT"
			print "=> "

			selected_option = gets.chomp.to_i

			case selected_option
			when 1
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
				inventory.add product
				print inventory.product id
				#saveProductInFile product
				saveToFile("inventory", product, product.id)
			when 2
				print "\nenter product id of product to remove "
				product_id = gets.chomp
				inventory.remove product_id
			when 3
				inventory.listProducts
			when 4
				print "\nenter product name to search "
				search_name = gets.chomp
				inventory.searchWithName search_name
			when 5
				print "\nenter product id of product to edit "
				product_id = gets.chomp
				print inventory.product product_id
				print "\nediting stock,"
				print "\nenter new stock => "
				stock = gets.chomp.to_i
				inventory.setStockOfItem product_id, stock
				updateProduct inventory.product product_id
				print inventory.product product_id
			when 6
				exit
			else
				puts "you have made a wrong choice, try again"
			end
		end
	end
end