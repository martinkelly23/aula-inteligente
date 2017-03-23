class AddHoraSalToIngresos < ActiveRecord::Migration
  def change
    add_column :ingresos, :horaSal, :datetime
  end
end
