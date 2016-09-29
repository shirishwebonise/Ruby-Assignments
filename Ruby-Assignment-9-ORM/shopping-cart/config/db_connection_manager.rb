require 'yaml'
require 'rubygems'

module DBConnectionManager
  def self.connect
    @dbconfig = YAML.load(File.read('config/database.yml'))
    ActiveRecord::Base.establish_connection @dbconfig[$environment]
  end
end
