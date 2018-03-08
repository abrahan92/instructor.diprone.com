class CreatePaginas < ActiveRecord::Migration[5.0]
  def change
    create_table :paginas do |t|
      t.string :nombre
      t.string :url

      t.timestamps
    end
  end
end
