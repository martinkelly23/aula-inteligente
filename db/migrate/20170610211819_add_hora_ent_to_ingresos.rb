class AddHoraEntToIngresos < ActiveRecord::Migration
  def change
    add_column :ingresos, :horaEnt, :datetime
  end
end
