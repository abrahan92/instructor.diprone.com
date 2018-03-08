class AddSeccionIdToClases < ActiveRecord::Migration[5.0]
  def change
    add_reference :clases, :seccion, index: true
    add_foreign_key :clases, :seccions
  end
end
