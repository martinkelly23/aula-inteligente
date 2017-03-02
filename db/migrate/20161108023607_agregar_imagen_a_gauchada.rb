class AgregarImagenAGauchada < ActiveRecord::Migration
  def change
    add_column :gauchadas, :imagen, :string
  end
end
