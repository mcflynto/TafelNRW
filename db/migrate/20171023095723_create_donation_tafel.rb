class CreateDonationTafel < ActiveRecord::Migration[5.1]
  def change
    create_table :donation_tafels do |t|
      t.references :donations
      t.references :tafels
      t.integer :amount

      t.timestamps

    end
  end
end
