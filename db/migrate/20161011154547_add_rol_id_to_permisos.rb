class AddRolIdToPermisos < ActiveRecord::Migration[5.0]
  def change
    add_reference :permisos, :rol, index: true
    add_foreign_key :permisos, :rols
  end
end
