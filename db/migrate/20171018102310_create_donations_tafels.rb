class CreateDonationsTafels < ActiveRecord::Migration[5.1]
  def change
    create_table :donations_tafels, id: false do |t|
      t.belongs_to :donation,  index: true
      t.belongs_to :tafel,     index: true
    end
  end
end
