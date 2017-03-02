class LogrosController < ApplicationController
  def index

  end

  def show
  end

  def new
    @logro = Logro.new
  end

  def create
    @logro = Logro.new(logro_params)
    cumple = true

    Logro.all.each do |logr|
       if(@logro.nombre == logr.nombre)
          flash[:notice] = 'Ya exite un logro con ese nombre'
          cumple = false
       end
       if(@logro.valor_min <= logr.valor_max)&&(@logro.valor_max >= logr.valor_min)
         flash[:notice] = 'El puntaje del logro se superpone con otro'
         cumple = false
       end
   end

   if(@logro.valor_min >= @logro.valor_max)
     flash[:notice] = 'El rango de punajes ingresado es inválido'
     cumple = false
   end

   if(cumple)
     if @logro.save
       flash[:notice] = 'El Logro se creó exitosamente!'
       redirect_to listadoLogros_path
     else
       redirect_to listadoLogros_path
     end
   else
    redirect_to listadoLogros_path
   end
  end

  def edit
    @logro = Logro.find(params[:id])
  end

  def logro_params
      params.require(:logro).permit(:nombre, :valor_min, :valor_max)
  end

  def update
   @logro = Logro.find params[:id]
   nuevoLogro = Logro.new(logro_params)
   cumple = true

   Logro.all.each do |logr|
      if(nuevoLogro.nombre == logr.nombre)&&(@logro.id != logr.id)
         flash[:notice] = 'Ya exite un logro con ese nombre'
         cumple = false
      end
      if(nuevoLogro.valor_min <= logr.valor_max)&&(nuevoLogro.valor_max >= logr.valor_min)&&(@logro.id != logr.id)
        flash[:notice] = 'El puntaje del logro se superpone con otro'
        cumple = false
      end
  end

  if(nuevoLogro.valor_min >= nuevoLogro.valor_max)
    flash[:notice] = 'El rango de punajes ingresado es inválido'
    cumple = false
  end

  if(cumple)
    if @logro.update_attributes (logro_params)
      flash[:notice] = 'El Logro se actualizo exitosamente!'
      redirect_to listadoLogros_path
    else
      redirect_to listadoLogros_path
    end
  else
   redirect_to listadoLogros_path
  end

end

    def destroy
      @logro = Logro.find(params[:id])
     if @logro.present?
       @logro.destroy
       flash[:notice] = 'El Logro se elimino exitosamente!'
     end
     redirect_to listadoLogros_path
    end
end
