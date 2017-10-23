class CreateDonationOrganization < ActiveRecord::Migration[5.1]
  def change
    create_table :donation_organizations do |t|
      t.references :donations
      t.references :organizations
      t.integer :amount

      t.timestamps
    end
  end
end
