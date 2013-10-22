class Students < ActiveRecord::Migration
  def up #defines method to create columns in the table
  	create_table :students do |t|
  		t.column :first_name, :string
  		t.column :last_name, :string
  		t.column :email_address, :string
  		t.column :password, :string
  		t.column :confirm_password, :string
  	end
  end

  def down #used for rollback
  	drop_table :books
  end
end
