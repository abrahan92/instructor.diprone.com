class AddOperacionIdToPermisos < ActiveRecord::Migration[5.0]
  def change
    add_reference :permisos, :operacion, index: true
    add_foreign_key :permisos, :operacions
  end
end
