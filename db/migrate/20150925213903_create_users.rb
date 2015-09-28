class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :unique => true
      t.string :name
      t.string :password_digest
      t.boolean :admin
      
      t.timestamps null: false
    end
  end
end
