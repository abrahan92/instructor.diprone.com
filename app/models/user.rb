
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


 
dragonfly_accessor :foto
has_many :mensajes, dependent: :destroy
has_many :cursos, dependent: :destroy
belongs_to :rol
  def remember_me
    (super == nil) ? '1' : super
    end
end
