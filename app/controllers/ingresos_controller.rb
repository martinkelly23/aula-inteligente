class IngresosController < ApplicationController

# http://localhost:3000/nuevoIngreso?ingreso[HoraEntrada]=1&ingreso[HoraSalida]=9999&ingreso[ConsumoParcial]=50&ingreso[aula_id]=1&ingreso[codigo]=1
# PARA QUE SEA ENTRADA PONGO HORAENTRADA EN 1 EN LO QUE MANDA ARDUINO
# PARA QUE SEA SALIDA PONGO HORASALIDA EN 1 EN LO QUE MANDA ARDUINO
  def nuevoIngreso
    @ingreso = Ingreso.new(ingreso_params)
    cumple = true

   if(@ingreso.HoraEntrada == 1) # Significa que es una entrada
     @ingreso.horaEnt = Time.zone.now
     @ingreso.ConsumoParcial = 0

     User.all.each do |usr|
      if(usr.codigo == @ingreso.codigo)
        @ingreso.user_id = usr.id
      end
     end

     @aula = Aula.find(@ingreso.aula_id) #Busco el aula de la cual el usuario ingresa
     @aula.estado = "En uso"
     @aula.save #Guardo la modificacion hecha en el aula
     if(cumple)
       if @ingreso.save
         flash[:notice] = 'El nuevo ingreso se registro exitosamente!'
         redirect_to listadoIngresos_path
       else
         redirect_to listadoIngresos_path
       end
     else
      redirect_to listadoIngresos_path
     end
   end

   if(@ingreso.HoraSalida == 1) # Significa que es una salida
     @ingresoAux = Ingreso.where(aula_id: @ingreso.aula_id).first
     @ingresoAux.horaSal = Time.zone.now
     @ingresoAux.HoraSalida = 1
     @ingresoAux.ConsumoParcial = @ingreso.ConsumoParcial
     @aula = Aula.find(@ingreso.aula_id) #Busco el aula de la cual el usuario sale
     @aula.ConsumoAula += @ingresoAux.ConsumoParcial #Sumo al aula el consumo del usuario
     @aula.estado = "Libre"
     @aula.save #Guardo la modificacion hecha en el aula

     @usuario = User.find(@ingresoAux.user_id) #Busco el usuario que uso el aula

     @usuario.consumo += @ingresoAux.ConsumoParcial  #VER ESTO QUE EN LA BD EL USUARIO NO TIENE NADA!
     @usuario.save
     if(cumple)
       if @ingresoAux.save
         flash[:notice] = 'El ingreso se completo exitosamente!'
         redirect_to listadoIngresos_path
       else
         redirect_to listadoIngresos_path
       end
     else
      redirect_to listadoIngresos_path
     end
   end
  end

  def destroy
    @ingreso = Ingreso.find(params[:id])
   if @ingreso.present?
     @ingreso.destroy
     flash[:notice] = 'El ingreso se elimino exitosamente!'
   end
   redirect_to listadoIngresos_path
  end

  def ingreso_params
      params.require(:ingreso).permit(:HoraEntrada, :HoraSalida, :ConsumoParcial, :codigo, :aula_id)
  end

end
