$:.unshift File.dirname(__FILE__)
require 'config/router'
require 'config/db_connection_manager'

$environment = 'development'

DBConnectionManager::connect

run Router.new
