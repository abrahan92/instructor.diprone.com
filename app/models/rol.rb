class Rol < ApplicationRecord
	has_many :users
	has_many :permisos
end
