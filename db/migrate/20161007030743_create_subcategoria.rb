class CreateSubcategoria < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategoria do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
