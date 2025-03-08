class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: "Cliente cadastrado com sucesso."
    else
      render :new
    end
  end
  
  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client, notice: "Cliente atualizado com sucesso."
    else
      render :edit
    end
  end
  
  def destroy
    @client.destroy

    redirect_to client_path, notice: "Cliente excluído com sucesso."
  end

  
  private
  def client_params
    params.require(:client).permit(:name, :email, :phone, :address)
  end
end