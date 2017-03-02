class CreateIngresos < ActiveRecord::Migration
  def change
    create_table :ingresos do |t|
      t.integer :HoraEntrada
      t.integer :HoraSalida
      t.integer :ConsumoParcial

      t.timestamps null: false
    end
  end
end
