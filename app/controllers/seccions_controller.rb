class SeccionsController < ApplicationController
  before_action :set_seccion, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /seccions
  # GET /seccions.json
  def index
    @curso = Curso.find(params[:curso_id])
    @seccions = Seccion.all
  end

  # GET /seccions/1
  # GET /seccions/1.json
  def show
    @curso = Curso.find(params[:curso_id])
  end

  # GET /seccions/new
  def new
     
    @curso = Curso.find(params[:curso_id])
    @seccion = Seccion.new
    @secciones = Seccion.count
    
end

  # GET /seccions/1/edit
  def edit
     @user = current_user
     @curso = Curso.find(params[:curso_id])
     @seccion = Seccion.find(params[:id])
  end

  # POST /seccions
  # POST /seccions.json
  def create
     @curso = Curso.find(params[:curso_id])
    @seccion = Seccion.new(seccion_params)
    respond_to do |format|
      if @seccion.save
        format.html { redirect_to '/users/'+current_user.id.to_s+'/cursos/'+@curso.id.to_s+'/seccions/', notice: 'La sección se ha creado satisfactoriamente' }
        #format.json { render :show, status: :created, location: @seccion }
      else
        format.html { render :new }
        #format.json { render json: @seccion.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /seccions/1
  # PATCH/PUT /seccions/1.json

  def update
    @curso = Curso.find(params[:curso_id])
    @seccion = Seccion.find(params[:id])
    respond_to do |format|
      if @seccion.update(seccion_params)
        format.html { redirect_to '/users/'+current_user.id.to_s+'/cursos/'+@curso.id.to_s+'/seccions/', notice: 'La sección ha sido actualizada satisfactoriamente' }
        
      else
        format.html { render :edit }
     
      end
    end
  end

  # DELETE /seccions/1
  # DELETE /seccions/1.json
  def destroy
    @curso = Curso.find(params[:curso_id])
    @seccion.destroy

    respond_to do |format|
      format.html { redirect_to '/users/'+current_user.id.to_s+'/cursos/'+@curso.id.to_s+'/seccions', notice: 'La sección ha sido eliminada satisfactoriamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seccion
      @seccion = Seccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seccion_params
      params.require(:seccion).permit(:titulo, :descripcion, :curso_id)
    end
end
