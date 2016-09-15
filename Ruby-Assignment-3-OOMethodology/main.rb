#!/usr/bin/env ruby -wKU

require './product'
require './inventory'
require 'pstore'

inventory = Inventory.new

# read the file for inventory
dbstore = PStore.new("inventory")
dbstore.transaction(true) do
  dbstore.roots.each do |data_root_name|
    inventory.add dbstore[data_root_name]
  end
end

# save a product in the file
def saveProductInFile(product)
	dbstore = PStore.new("inventory")

	dbstore.transaction do
		dbstore[product.id] = product		
	end
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
				saveProductInFile product
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
				print inventory.product product_id
			when 6
				exit
			else
				puts "you have made a wrong choice, try again"
			end
		end
	end
end