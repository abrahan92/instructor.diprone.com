require 'httparty'
require 'json'
class Curso < ApplicationRecord
	include HTTParty	
	belongs_to :user
	dragonfly_accessor :portada
	has_many :seccions, dependent: :destroy
	
	
def self.abc

		 @json = get("http://192.168.0.106:3000/cursos.json")
		 @json = @json.to_json
		 @parsed_json = ActiveSupport::JSON.decode(@json)
		 #@current = @parsed_json['profesors']
		

		 @no = ""

		 for curso in @parsed_json
		    @size = Curso.count
		 	curso["id"] = @size + 1
		 	curso["user_id"] = 15
		 	Curso.create! curso
		 end

return @no

end

end
