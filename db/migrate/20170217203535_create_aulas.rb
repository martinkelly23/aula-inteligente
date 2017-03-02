class CreateAulas < ActiveRecord::Migration
  def change
    create_table :aulas do |t|
      t.string :NombreAula
      t.string :Departemento
      t.integer :ConsumoAula

      t.timestamps null: false
    end
  end
end
