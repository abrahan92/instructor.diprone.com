class Clase < ApplicationRecord
	belongs_to :seccion
	dragonfly_accessor :archivo
end
