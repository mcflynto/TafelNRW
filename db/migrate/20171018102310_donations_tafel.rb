class DonationsTafel < ActiveRecord::Migration[5.1]
  def change
    create_table :donations_tafel, id:false do |t|
      t.belongs_to :donations,  index: true
      t.belongs_to :tafel,     index: true
    end
  end
end
