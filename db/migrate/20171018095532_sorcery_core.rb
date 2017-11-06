class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :password_confirmation
      t.string :salt
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.references :organization

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
