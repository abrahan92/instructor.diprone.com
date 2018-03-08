class AddUserIdToMensajes < ActiveRecord::Migration[5.0]
  def change
    add_reference :mensajes, :user, index: true
    add_foreign_key :mensajes, :users
  end
end
