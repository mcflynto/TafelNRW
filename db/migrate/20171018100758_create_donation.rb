class CreateDonation < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.references :donator
      t.references :transporter
      t.string :food
      t.integer :amount
      t.string :unit
      t.date :expiry_date
      t.boolean :ordered
      t.date :delivery_date


      t.timestamps
    end
  end
end
