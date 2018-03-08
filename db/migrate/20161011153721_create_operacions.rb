class CreateOperacions < ActiveRecord::Migration[5.0]
  def change
    create_table :operacions do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
