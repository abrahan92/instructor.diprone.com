class CreateMensajes < ActiveRecord::Migration[5.0]
  def change
    create_table :mensajes do |t|
      t.string :sujeto
      t.string :mensaje
      t.string :status
      t.string :tipo
      t.timestamps
    end
  end
end
