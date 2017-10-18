class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :house_number
      t.string :city
      t.string :phone
      t.string :plz

      t.timestamps
    end
  end
end
