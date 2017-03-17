class AulasController < ApplicationController
  def index
  end

  def index2
    @aula = Aula.find(params[:id])
  end

  def busqueda
    if params[:search].present?
      Aula.all.each do |aul|
       if(aul.NombreAula == params[:search])
         @aula = aul
       end
      end
    end
  end

  def show
  end

  def new
    @aula = Aula.new
  end

  #/eventoAula?aula_id=2&aula[estadoAire]=Encendido&aula[estadoProyector]=Apagado
  def eventoAula
    @au = Aula.new(aula_params)
    @aula = Aula.find(params[:aula_id])
    @aula.estadoProyector = @au.estadoProyector
    @aula.estadoAire = @au.estadoAire
    @aula.estadoLuces = @au.estadoLuces
    @aula.temperatura = @au.temperatura
    @aula.save
    redirect_to listadoAulas_path
  end

  # Con esta definicion de controlador y a partir de la ruta creada, puedo crear nuevas aulas por URL
  # mediante el siguiente codigo> /cargarAula?aula[NombreAula]=Aula3&aula[Departemento]=Aeronautica&aula[ConsumoAula]=0
  def cargarAula
    @aula = Aula.new(aula_params)
    cumple = true

    Aula.all.each do |aul|
       if(@aula.NombreAula == aul.NombreAula)
          flash[:notice] = 'Ya exite un aula con ese nombre'
          cumple = false
       end
   end
   if(cumple)
     if @aula.save
       flash[:notice] = 'El aula se creó exitosamente!'
       redirect_to listadoAulas_path
     else
       redirect_to listadoAulas_path
     end
   else
    redirect_to listadoAulas_path
   end
  end

  def create
    @aula = Aula.new(aula_params)
    cumple = true
    @aula.estado = "Libre"
    @aula.estadoProyector = "Apagado"
    @aula.estadoAire = "Apagado"
    @aula.estadoLuces = "Apagadas"
    @aula.temperatura = 24.5
    Aula.all.each do |aul|
       if(@aula.NombreAula == aul.NombreAula)
          flash[:notice] = 'Ya exite un aula con ese nombre'
          cumple = false
       end
   end
   if(cumple)
     if @aula.save
       flash[:notice] = 'El aula se creó exitosamente!'
       redirect_to listadoAulas_path
     else
       redirect_to listadoAulas_path
     end
   else
    redirect_to listadoAulas_path
   end
  end

  def edit
    @aula = Aula.find(params[:id])
  end

  def aula_params
      params.require(:aula).permit(:NombreAula, :Departemento, :ConsumoAula, :temperatura, :estadoLuces, :estadoAire, :estadoProyector)
  end

  def update
   @aula = Aula.find params[:id]
   nuevoaula = Aula.new(aula_params)
   cumple = true

   Aula.all.each do |aul|
      if(nuevoaula.NombreAula == aul.NombreAula)&&(@aula.id != aul.id)
         flash[:notice] = 'Ya exite un aula con ese nombre'
         cumple = false
      end
  end
  if(cumple)
    if @aula.update_attributes (aula_params)
      flash[:notice] = 'El aula se actualizo exitosamente!'
      redirect_to listadoAulas_path
    else
      redirect_to listadoAulas_path
    end
  else
   redirect_to listadoAulas_path
  end
end

  def destroy
      @aula = Aula.find(params[:id])
     if @aula.present?
       @aula.destroy
       flash[:notice] = 'El aula se elimino exitosamente!'
     end
     redirect_to listadoAulas_path
   end
end
