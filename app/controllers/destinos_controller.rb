class DestinosController < ApplicationController
  
  include ApplicationHelper
  
  def index
    @menu = "destinos"
    @busca = params[:busca]
    @destinos = @busca.blank? ? [] : Destino.search(@busca)  
  end
  
  def new
    @menu = "destinos"
    @destino = Destino.new
  end
  
  def create
    @destino = Destino.new(params[:destino])
    if @destino.save
      flash[:message] = notice_message 'Destino cadastrado com sucesso'
      redirect_to destinos_path
    else      
      render :action => :new
    end
    
  end
  
  def edit
    @menu = "destinos"
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
