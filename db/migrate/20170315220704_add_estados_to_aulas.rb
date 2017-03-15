class AddEstadosToAulas < ActiveRecord::Migration
  def change
    add_column :aulas, :estado, :string
    add_column :aulas, :estadoLuces, :string
    add_column :aulas, :estadoProyector, :string
    add_column :aulas, :estadoAire, :string
    add_column :aulas, :temperatura, :float
  end
end
