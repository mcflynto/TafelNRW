class CreateAdress < ActiveRecord::Migration[5.1]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :city
      t.string :phone
      t.string :plz

      t.timestamps
    end
  end
end
