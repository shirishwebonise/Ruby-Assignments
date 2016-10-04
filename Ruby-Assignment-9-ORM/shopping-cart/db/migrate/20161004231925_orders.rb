class Orders < ActiveRecord::Migration[5.0]
  def self.up
    create_table :orders do |t|
      t.string :status
      t.string :delivery_address
    end
  end

  def self.down
  end
end
