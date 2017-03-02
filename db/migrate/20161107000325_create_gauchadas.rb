class CreateGauchadas < ActiveRecord::Migration
  def change
    create_table :gauchadas do |t|
      t.string :descripcion
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
