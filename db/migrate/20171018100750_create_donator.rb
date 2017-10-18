class CreateDonator < ActiveRecord::Migration[5.1]
  def change
    create_table :donators do |t|
      t.references :address
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
