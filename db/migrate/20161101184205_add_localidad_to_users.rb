class AddLocalidadToUsers < ActiveRecord::Migration
  def change
    add_column :users, :localidad, :string
  end
end
