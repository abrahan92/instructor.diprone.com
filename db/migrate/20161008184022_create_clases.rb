class CreateClases < ActiveRecord::Migration[5.0]
  def change
    create_table :clases do |t|
      t.string :titulo
      t.string :resumen
      t.string :archivo_uid
      t.string :archivo_name

      t.timestamps
    end
  end
end
