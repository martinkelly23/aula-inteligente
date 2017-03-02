class AgregarUseridYAulaidAIngreso < ActiveRecord::Migration
  def change
    add_column :ingresos, :user_id, :integer
    add_column :ingresos, :aula_id, :integer
  end
end
