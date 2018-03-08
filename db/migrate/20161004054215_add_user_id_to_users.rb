class AddUserIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :cursos, :user, index: true
    add_foreign_key :cursos, :users
  end
end
