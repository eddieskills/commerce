class SwitchToDevise < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  		t.remove :email, :hashed_password, :salt
  	end
  end

  def down
  	change_table :users do |t|
  		t.string :email
  		t.string :hashed_password
  		t.string :salt
  	end
  end
end
