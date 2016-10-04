class ChangeOrders < ActiveRecord::Migration[5.0]
  def change
    change_table :orders do |t|
      t.timestamps
    end
  end
end
