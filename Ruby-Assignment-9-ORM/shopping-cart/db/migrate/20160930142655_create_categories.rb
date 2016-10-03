
class CreateCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :tax

      t.timestamps
    end

    puts 'Created table Categories'
  end
end
