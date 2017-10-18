class CreateTafelsTransporters < ActiveRecord::Migration[5.1]
  def change
    create_table :tafels_transporters, id:false do |t|
      t.belongs_to :transporter,  index: true
      t.belongs_to :tafel,     index: true
    end
  end
end
