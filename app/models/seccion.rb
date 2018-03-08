class Seccion < ApplicationRecord

	belongs_to :curso
	has_many :clases, dependent: :destroy
end
