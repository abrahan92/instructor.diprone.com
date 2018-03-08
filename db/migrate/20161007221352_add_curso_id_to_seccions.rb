class AddCursoIdToSeccions < ActiveRecord::Migration[5.0]
  def change
    add_reference :seccions, :curso, index: true
    add_foreign_key :seccions, :cursos
  end
end
