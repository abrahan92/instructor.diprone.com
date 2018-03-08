class CreatePermisos < ActiveRecord::Migration[5.0]
  def change
    create_table :permisos do |t|

      t.timestamps
    end
  end
end
