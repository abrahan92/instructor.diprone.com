class AddRolIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :rol, index: true
    add_foreign_key :users, :rols
  end
end
