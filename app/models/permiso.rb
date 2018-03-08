class Permiso < ApplicationRecord
	belongs_to :rol
	belongs_to :pagina
	belongs_to :operacion
end
