$:.unshift File.dirname(__FILE__)
require 'config/framework'
require 'app/controllers/categories_controller'
require 'config/db_connection_manager'

$environment = 'development'

DBConnectionManager::connect

route("/categories#create") do
  status 200
  CategoriesController.new(form_data)
end

route("/categories") do
  status 200
  CategoriesController.find(params['id'])
end



run Framework.app
