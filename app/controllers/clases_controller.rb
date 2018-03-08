class ClasesController < ApplicationController
  before_action :set_clase, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /clases
  # GET /clases.json
  def index
    @seccion = Seccion.find(params[:seccion_id])
    @curso = Curso.find(params[:curso_id])
    @clases = Seccion.all
  end

  def download
    #redirect_to '/'
  @clase = Clase.find(params[:id])
  send_data @clase.archivo.url, filename: @clase.archivo_name
  end

  # GET /clases/1
  # GET /clases/1.json
  def show
    @seccion = Seccion.find(params[:seccion_id])
    @curso = Curso.find(params[:curso_id])
    
  end

  # GET /clases/new
  def new
    @seccion = Seccion.find(params[:seccion_id])
    @curso = Curso.find(params[:curso_id])
    @clase = Clase.new
    @clases = Clase.count
  end

  # GET /clases/1/edit
  def edit
     @curso = Curso.find(params[:curso_id])
     @seccion = Seccion.find(params[:seccion_id])
     @clase = Clase.find(params[:id])
  end

  # POST /clases
  # POST /clases.json
  def create
    @seccion = Seccion.find(params[:seccion_id])
    @curso = Curso.find(params[:curso_id])

    @clase = Clase.new(clase_params)
    respond_to do |format|
      if @clase.save
        format.html { redirect_to '/users/'+current_user.id.to_s+'/cursos/'+@curso.id.to_s+'/seccions/'+@seccion.id.to_s+'/clases', notice: 'La clase se ha creado satisfactoriamente' }
        #format.json { render :show, status: :created, location: @clase }
      else
        format.html { render :new }
        #format.json { render json: @clase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clases/1
  # PATCH/PUT /clases/1.json
  def update
    @seccion = Seccion.find(params[:seccion_id])
    @curso = Curso.find(params[:curso_id])
    respond_to do |format|
      if @clase.update(clase_params)
        format.html { redirect_to '/users/'+current_user.id.to_s+'/cursos/'+@curso.id.to_s+'/seccions/'+@seccion.id.to_s+'/clases', notice: 'La clase ha sido actualizada satisfactoriamente' }
        format.json { render :show, status: :ok, location: @clase }
      else
        format.html { render :edit }
        format.json { render json: @clase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clases/1
  # DELETE /clases/1.json
  def destroy
    @seccion = Seccion.find(params[:seccion_id])
    @curso = Curso.find(params[:curso_id])
    @clase.destroy
    respond_to do |format|
      format.html { redirect_to '/users/'+current_user.id.to_s+'/cursos/'+@curso.id.to_s+'/seccions/'+@seccion.id.to_s+'/clases', notice: 'La clase ha sido eliminada satisfactoriamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clase
      @clase = Clase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clase_params
      params.require(:clase).permit(:titulo, :resumen, :archivo, :seccion_id)
    end
end
