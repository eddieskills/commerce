class AddTotalProductsToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :totalProducts, :integer, :default => 0

  end
end
