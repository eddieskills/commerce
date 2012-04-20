class AddTotalToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :total, :decimal, :precision => 8, :scale => 2, :default => 0
  end
end
