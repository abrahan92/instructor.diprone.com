class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.string :subtitulo
      t.string :idioma
      t.string :categoria
      t.string :subcategoria
      t.string :nivel
      t.string :status
      t.string :resumen
      t.string :portada_uid
      t.string :portada_name

      t.timestamps
    end
  end
end
