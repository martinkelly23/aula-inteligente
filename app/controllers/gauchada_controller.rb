class GauchadaController < ApplicationController
  def index
  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end
end
