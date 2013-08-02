class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.integer :gender
      t.string :user_id
      t.string :login
      t.string :password_digest
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
