class LineItems < ActiveRecord::Migration[5.0]
  def self.up
    create_table :line_items do |t|
      t.belongs_to :order
      t.integer :quantity
    end
  end
  def self.down
  end
end
