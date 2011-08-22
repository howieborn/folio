class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
	  t.string :name
	  t.string :email
	  t.string :encrypted_password
	  t.string :salt
	  t.string :remember_token
	  t.boolean :admin, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
