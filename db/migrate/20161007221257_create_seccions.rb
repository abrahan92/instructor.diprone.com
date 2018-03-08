class CreateSeccions < ActiveRecord::Migration[5.0]
  def change
    create_table :seccions do |t|
      t.string :titulo
      t.string :descripcion

      t.timestamps
    end
  end
end
