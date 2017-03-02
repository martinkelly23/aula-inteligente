class CreateLogros < ActiveRecord::Migration
  def change
    create_table :logros do |t|
      t.string :nombre
      t.integer :valor_min
      t.integer :valor_max

      t.timestamps null: false
    end
  end
end
