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
  FileOps.read_file(INVENTORY_FILE).each{|product| inventory.add(product)}

  search_action = Proc.new do
    print "\nenter product name to search "
    search_name = gets.chomp
    inventory.search_with_name(search_name).each {|product| puts product.to_s}
  end

  while true do
    UserMenu.display_menu_type_of_user
    type_of_user = gets.chomp.to_i

    if !([1,2].include? type_of_user)
      puts "wrong input, enter again\n"
      next
    end

    if type_of_user == $ONE
      UserMenu.greet_customer

      while true do
        UserMenu.display_customer_menu

        selected_option = gets.chomp.to_i

        case selected_option
        when $ONE
          inventory.list_products
        when $TWO
          search_action.call
        when $THREE
          order = UserMenu.get_order_info
          if inventory.decrement_stock(order.product_id)
            FileOps.save_to_file(ORDERS_FILE, order, order.id)
            FileOps.save_to_file(INVENTORY_FILE, inventory.product(order.product_id), order.product_id)
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
        UserMenu.display_shopkeeper_menu

        selected_option = gets.chomp.to_i

        case selected_option
        when $ONE
          product = UserMenu.get_product_info
          inventory.add product
          print product
          FileOps.save_to_file(INVENTORY_FILE, product, product.id)
        when $TWO
          print "\nenter product id of product to remove "
          product_id = gets.chomp
          product_to_remove = inventory.product product_id
          inventory.remove product_id
          FileOps.delete_from_file(INVENTORY_FILE, product_to_remove)
        when $THREE
          inventory.list_products
        when $FOUR
          search_action.call
        when $FIVE
          print "\nEnter info of product to update "
          new_product_info = UserMenu.get_product_new_info
          FileOps.save_to_file(INVENTORY_FILE, new_product_info, new_product_info.id)
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