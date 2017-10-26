class CreateShare < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.references :donation
      t.references :organization
      t.integer :amount
      t.boolean :pick_up
      t.date :pick_up_date

      t.timestamps
    end
  end
end
