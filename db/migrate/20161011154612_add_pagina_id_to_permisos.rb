class AddPaginaIdToPermisos < ActiveRecord::Migration[5.0]
  def change
    add_reference :permisos, :pagina, index: true
    add_foreign_key :permisos, :paginas
  end
end
