class Users::SessionsController < Devise::SessionsController
 before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   
  def new

     @usuarios = User.all.count

     if @usuarios != 0
     super
     else
      super

      connection = ActiveRecord::Base.connection
      connection.execute("INSERT INTO users (email,encrypted_password,created_at,updated_at, rol_id,ventas,status)
VALUES ('mendozaabrahan@gmail.com','$2a$04$OrNQrkQgW17zoyngh4biwu0BN2tcN04ejX1WIoc/pZLyQZi.3t.MW',now(),now(), 1,0,'activo');") 

     end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end



  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:nombre, :apellido])
   end
end
