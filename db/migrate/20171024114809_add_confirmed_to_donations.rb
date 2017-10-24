# Migration to add a confirmed column to donations. This is used to
# check if a transporter has confirmed the delivery of goods.
class AddConfirmedToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :confirmed, :boolean
  end
end
