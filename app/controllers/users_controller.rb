class UsersController < ApplicationController
 before_action :configure_sign_up_params, only: [:create]
 before_action :configure_account_update_params, only: [:update]
	def show

    
    
		redirect_to '/users/'+current_user.id.to_s+'/edit'

	end

  def cerrarmes

      #@users = User.all
        connection = ActiveRecord::Base.connection
        connection.execute("UPDATE users SET status='inactivo' WHERE ventas=0 and rol_id!=1;")
        connection.execute("UPDATE users SET status='activo' WHERE ventas!=0 and rol_id!=1;")  

        redirect_to '/'
    
  end


 #############################
  def calcularventas

    #ventas propias
    @userventas = current_user.ventas
    @userventaspor = @userventas * 0.40
    @userventaspor = @userventaspor.round(2)
    #ventas propias

    @ventashijos = 0
    @ventasnietos = 0
    @ventasbisnietos = 0
    @ventastataranietos = 0

    @contadorhijos = 0
    @contadornietos = 0
    @contadorbisnietos = 0
    @contadortataranietos = 0
    #ventas hijos
    User.where(id_padre: current_user.id).each do |hijo|
      @ventashijos = @ventashijos + hijo.ventas
      @contadorhijos = @contadorhijos + 1
      User.where(id_padre: hijo.id).each do |nieto|
        @ventasnietos = @ventasnietos + nieto.ventas
        @contadornietos = @contadornietos + 1
          User.where(id_padre: nieto.id).each do |bisnieto|
              @ventasbisnietos = @ventasbisnietos + bisnieto.ventas
              @contadorbisnietos = @contadorbisnietos + 1
               User.where(id_padre: bisnieto.id).each do |tataranieto|
                  @ventastataranietos = @ventastataranietos + tataranieto.ventas
                  @contadortataranietos = @contadortataranietos + 1
               end
          end

      end

    end
    #ventas hijos

    @ventashijospor = @ventashijos * 0.08
    @ventasnietospor = @ventasnietos * 0.06
    @ventasbisnietospor = @ventasbisnietos * 0.04
    @ventastataranietospor = @ventastataranietos * 0.02

    @ventashijospor = @ventashijospor.round(2)
    @ventasnietospor = @ventasnietospor.round(2)
    @ventasbisnietospor = @ventasbisnietospor.round(2)
    @ventastataranietospor = @ventastataranietospor.round(2)

    @totalganar = @userventaspor + @ventashijospor + @ventasnietospor + @ventasbisnietospor + @ventastataranietospor
    @totalganar = @totalganar.round(2)
  end
#############################


  def compresion

      @users = User.all
      connection = ActiveRecord::Base.connection
      @users.each do |user|

        

            @hijos = User.where(id_padre: user.id.to_s)


            @hijos.each do |hijo|

              if user.id_padre != nil
              connection.execute("UPDATE users SET id_padre='"+user.id_padre+"' WHERE status='inactivo' and rol_id!=1;")   
              end
            end

        

        

      end

      redirect_to '/users/'+current_user.id.to_s+'/red'

  end

	def index
    if current_user.rol_id != 1
      redirect_to '/'
    else
		@users = User.all
    end
		
	end

  def red
    @url = request.fullpath
    if @url != '/users/'+current_user.id.to_s+'/red'
        redirect_to '/'
    else
      @red = User.where(id_padre: current_user.id.to_s)
      calcularventas
    end

    
    #@numero = '8'
    #@nietos = User.where(id_padre: @numero)
  end

	def edit
    @url = request.fullpath

    if current_user.rol_id != 1
      if @url != '/users/'+current_user.id.to_s+'/edit'
        redirect_to '/'
      else
  		@user = current_user
      end
    else
      @user = User.find(params[:id])
    end
	end

	def new
     if current_user.rol_id != 1
      redirect_to '/'
     else
		 @user_admin = User.new
     @instructores = User.count
     end
	end

  def member


    @url = request.fullpath
    if @url != '/users/'+current_user.id.to_s+'/member'
        redirect_to '/'
    else
       @member = User.new
    end
  end

  def create

    @user = User.new(user_params)
    @user.password = @user.email

    if User.exists?(email: @user.email)

      respond_to do |format|

        if current_user.rol_id == 1
          format.html { redirect_to "/users/new", notice: 'El usuario que desea incluir ya existe' }
        else
          format.html { redirect_to "/users/"+current_user.id.to_s+'/member', notice: 'El usuario que desea incluir ya se encuentra registrado' }
        end

      end

    else
        respond_to do |format|
              if @user.save
                
                      @usuarios = User.all

                      @usuarios.each do |user|

                        @mensajesuser = user.mensajes

                              if user.mensajes.first

                              else
                                connection = ActiveRecord::Base.connection
                                connection.execute("INSERT INTO mensajes (sujeto,mensaje,status,tipo,created_at,updated_at, user_id)
                                VALUES ('Mensaje de Bienvenida','Diprone te da la Bienvenida a nuestra plataforma, estamos orgullosos de que seas parte de nuestra familia y estés dispuesto a compartir tu conocimiento a millones de estudiantes alrededor del mundo','0','bienvenida',now(),now(), "+user.id.to_s+");") 
                              end

                      end

                format.html { redirect_to "/users", notice: 'El usuario se ha creado satisfactoriamente' }
                format.json { redirect_to '/users', status: :created, location: @user }
              else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
              end
        end
    end
  end

  def password
  	@user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @nombre = @user.email
    @user.destroy
    respond_to do |format|
      format.html { redirect_to '/users', notice: 'El usuario '+@nombre+' fué eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def update
  	@user = User.find(params[:id])
  	
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/users/'+current_user.id.to_s+'/edit', notice: 'El usuario '+@user.email+' fué actualizado satisfactoriamente' }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to '/users/'+current_user.id.to_s+'/edit' }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
      params.require(:user).permit(:sign_up, keys: [:foto, :nombre, :apellido, :telefono, :codigop, :ciudad, :pais, :direccion, :biografia, :profesion, :password, :password_confirmation, :id_padre, :ventas, :status])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
      params.require(:user).permit(:account_update, keys: [:foto, :nombre, :apellido, :telefono, :codigop, :ciudad, :pais, :direccion, :biografia, :profesion, :password, :password_confirmation, :id_padre, :ventas, :status])
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user= User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre, :apellido, :telefono, :codigop, :ciudad, :pais, :direccion, :biografia, :profesion, :foto, :email, :password, :password_confirmation, :rol_id, :id_padre, :ventas, :status)
    end
  
end