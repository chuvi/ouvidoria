class DestinosController < ApplicationController
  
  include ApplicationHelper
  
  def index
    @menu = "destinos"
    @destinos = Destino.all(:order => :nome)
  end
  
  def new
    @destino = Destino.new
  end
  
  def create
    @destino = Destino.new(params[:destino])
    if @destino.save
      flash[:message] = notice_message 'Destino cadastrado com sucesso'
      redirect_to destinos_path
    else
      flash[:message] = error_message 'Problemas no cadastro do destino'
      render :action => :new
    end
    
  end
  
  def edit
    @destino = Destino.find(params[:id])
  end
  
  def update    
    @destino = Destino.find(params[:id])
    if @destino.update_attributes(params[:destino])
      flash[:message] = notice_message 'Destino alterado  com sucesso'
      redirect_to destinos_path
    else
      flash[:message] = error_message 'Problemas ao editar destino'
      render :action => :edit
    end
  end
  
  def destroy
  end
  
end
