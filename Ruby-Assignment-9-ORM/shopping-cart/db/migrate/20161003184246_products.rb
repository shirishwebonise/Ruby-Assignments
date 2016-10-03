class Products < ActiveRecord::Migration[5.0]
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.numeric :price
      t.integer :discount
      t.belongs_to :category, index: true

      t.timestamps
    end

    puts 'Created table Products'
  end
end
