class CreateTransportersTafels < ActiveRecord::Migration[5.1]
  def change
    create_table :transporters_tafels, id:false do |t|
      t.belongs_to :transporter,  index: true
      t.belongs_to :tafel,     index: true
    end
  end
end
