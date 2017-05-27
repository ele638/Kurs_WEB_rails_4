class MyClientsController < ApplicationController
  before_action :set_my_client, only: [:show, :edit, :update, :destroy]
  before_action :check_app_auth, except: [:index, :show, :set_my_client]

  # GET /my_clients
  # GET /my_clients.json
  def index
    @my_clients = MyClient.all
  end

  # GET /my_clients/1
  # GET /my_clients/1.json
  def show
  end

  # GET /my_clients/new
  def new
    @my_client = MyClient.new
  end

  # GET /my_clients/1/edit
  def edit
  end

  # POST /my_clients
  # POST /my_clients.json
  def create
    @my_client = MyClient.new(my_client_params)
    respond_to do |format|
      if @my_client.save
        format.html { redirect_to @my_client, notice: 'Клиент успешно создан.' }
        format.json { render :show, status: :created, location: @my_client }
      else
        format.html { render :new }
        format.json { render json: @my_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_clients/1
  # PATCH/PUT /my_clients/1.json
  def update
    respond_to do |format|
      if @my_client.update(my_client_params)
        format.html { redirect_to @my_client, notice: 'Клиент успешно обновлен.' }
        format.json { render :show, status: :ok, location: @my_client }
      else
        format.html { render :edit }
        format.json { render json: @my_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_clients/1
  # DELETE /my_clients/1.json
  def destroy
    @my_client.my_items.each{|x| x.destroy}
    @my_client.destroy
    respond_to do |format|
      format.html { redirect_to my_clients_url, notice: 'Клиент успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_client
      @my_client = MyClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_client_params
      params.require(:my_client).permit(:name, :details)
    end
end
