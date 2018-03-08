require 'httparty'
class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

  # GET /cursos
  # GET /cursos.json



 def jsontodb
    @cursos = Curso.abc

    #render :json => @products
    redirect_to "/users/"+current_user.id.to_s+"/cursos"

  end

  def index
    #Curso.abc
    @url = request.fullpath
    if @url != '/users/'+current_user.id.to_s+'/cursos'
      redirect_to '/'
    else
      @user = User.find(params[:user_id])
    end
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
     @curso = Curso.find(params[:id])
    redirect_to '/users/'+current_user.id.to_s+'/cursos/'+@curso.id.to_s+'/edit'
  end

  # GET /cursos/new
  def new

    @url = request.fullpath

    if @url != '/users/'+current_user.id.to_s+'/cursos/new'
      redirect_to '/'
    else
      @user = User.find(params[:user_id])
      @cursocount = Curso.count
    end

  end

  # GET /cursos/1/edit
  def edit
     
     @url = request.fullpath
     @idcurso = params[:id]
     @cursoacceder = Curso.find(@idcurso)
     
     if @cursoacceder.user_id != current_user.id 
       redirect_to '/'
     else
       @user = User.find(params[:user_id])
       @cusosecc = @curso.seccions.count
     end

          
      
    


  end

  # POST /cursos
  # POST /cursos.json
  def create
    @user = current_user
    @curso = @user.cursos.create!(curso_params)
    #@sku = Sku.new(sku_params)

    redirect_to '/users/'+@user.id.to_s+'/cursos'
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    @user = User.find(params[:user_id])

respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to '/users/'+current_user.id.to_s+'/cursos', notice: 'El Curso fue actualizado Satisfactoriamente' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to "/users/"+current_user.id.to_s+"/cursos", notice: 'El Curso fue eliminado Satisfactoriamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:titulo, :subtitulo, :idioma, :categoria, :subcategoria, :nivel, :status, :resumen, :portada)
    end
end
