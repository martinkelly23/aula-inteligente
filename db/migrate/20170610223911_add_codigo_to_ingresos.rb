class AddCodigoToIngresos < ActiveRecord::Migration
  def change
    add_column :ingresos, :codigo, :string
  end
end
