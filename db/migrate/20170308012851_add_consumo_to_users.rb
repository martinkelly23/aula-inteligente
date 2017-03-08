class AddConsumoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :consumo, :integer
  end
end
