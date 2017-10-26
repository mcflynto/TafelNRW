# Add a field for a transporter hash value
class AddTransporterHashToTransporters < ActiveRecord::Migration[5.1]
  def change
    add_column :transporters, :transporter_hash, :text
  end
end
