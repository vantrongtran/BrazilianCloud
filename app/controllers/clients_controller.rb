class ClientsController < ApplicationController
  respond_to :html

  before_action :load_client, only: %w(show edit update destroy)

  def index
    @clients = Client.all.page(params[:page])
  end

  def show
    @invoices = @client.invoices.page(params[:page])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = "Created"
      respond_with :edit, @client
    else
      flash[:error] = @client.errors.full_messages.uniq.join(", ")
      respond_with :new, :client
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:notice] = "Updated"
      respond_with :edit, @client
    else
      flash[:error] = @user.errors.full_messages.uniq.join(", ")
      respond_with :edit, @client
    end
  end

  def destroy
    if @client.destroy
      flash[:notice] = "Deleted"
    else
      flash[:error] = "Can not delete"
    end
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :address, :phone)
  end

  def load_client
    @client = Client.find(params[:id])
  end
end
