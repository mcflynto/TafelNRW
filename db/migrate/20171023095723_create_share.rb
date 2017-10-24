class CreateShare < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.references :donation
      t.references :organization
      t.integer :amount

      t.timestamps
    end
  end
end
