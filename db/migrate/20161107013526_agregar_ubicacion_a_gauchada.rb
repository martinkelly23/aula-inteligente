class AgregarUbicacionAGauchada < ActiveRecord::Migration
  def change
    add_column :gauchadas, :ubicacion, :string
    add_column :gauchadas, :titulo, :string
  end
end
