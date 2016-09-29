require 'active_record'
require './config/db_connection_manager'

class CreateCategories< ActiveRecord::Migration[5.0]
  def up
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :tax

      t.timestamps
    end

    puts 'Created table Categories'
  end

  def down
    drop_table :categories
    puts 'Dropped table Categories'
  end
end

DBConnectionManager.connect
CreateCategories.migrate(ARGV[0])
