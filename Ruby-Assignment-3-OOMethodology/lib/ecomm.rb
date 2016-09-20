#!/usr/bin/env ruby -wKU

require_relative 'file_ops'
require_relative 'menu'
require_relative 'product'
require_relative 'inventory'
require_relative 'order'
require 'pstore'

INVENTORY_FILE = "inventory"
ORDERS_FILE = "orders"

def play
  inventory = Inventory.new
  FileOps.readFile(INVENTORY_FILE).each{|product| inventory.add(product)}

  searchAction = Proc.new do
    print "\nenter product name to search "
    search_name = gets.chomp
    inventory.searchWithName(search_name).each {|product| puts product.to_s}
  end

  while true do
    UserMenu.displayMenuTypeOfUser
    type_of_user = gets.chomp.to_i

    if !([1,2].include? type_of_user)
      puts "wrong input, enter again\n"
      next
    end

    if type_of_user == $ONE
      UserMenu.greetCustomer

      while true do
        UserMenu.displayCustomerMenu

        selected_option = gets.chomp.to_i

        case selected_option
        when $ONE
          inventory.listProducts
        when $TWO
          searchAction.call
        when $THREE
          order = UserMenu.getOrderInfo
          if inventory.decrementStock(order.productId)
            FileOps.saveToFile(ORDERS_FILE, order, order.id)
            FileOps.saveToFile(INVENTORY_FILE, inventory.product(order.productId), order.productId)
            puts "Order Placed!"
          else
            puts "Product is out of stock!"
          end
        when $FOUR
          exit
        else
          puts "you have made a wrong choice, try again"
        end
      end
    else
      while true do
        UserMenu.displayShopkeeperMenu

        selected_option = gets.chomp.to_i

        case selected_option
        when $ONE
          product = UserMenu.getProductInfo
          inventory.add product
          print product
          FileOps.saveToFile(INVENTORY_FILE, product, product.id)
        when $TWO
          print "\nenter product id of product to remove "
          product_id = gets.chomp
          productToRemove = inventory.product product_id
          inventory.remove product_id
          FileOps.deleteFromFile(INVENTORY_FILE, productToRemove)
        when $THREE
          inventory.listProducts
        when $FOUR
          searchAction.call
        when $FIVE
          print "\nEnter info of product to update "
          newProductInfo = UserMenu.getProductNewInfo
          FileOps.saveToFile(INVENTORY_FILE, newProductInfo, newProductInfo.id)
          print inventory.product(product_id)
        when $SIX
          exit
        else
          puts "you have made a wrong choice, try again"
        end
      end
    end
  end
end