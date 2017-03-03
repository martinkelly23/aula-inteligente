class AddCodigoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :codigo, :string
  end
end
