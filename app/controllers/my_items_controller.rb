class MyItemsController < ApplicationController
  before_action :set_my_item, only: [:show, :edit, :update, :destroy]
  before_action :check_app_auth, except: [:index, :show, :set_my_client]

  # GET /my_items
  # GET /my_items.json
  def index
    @my_client = MyClient.find(params[:my_client_id])
    @my_items = params.blank? ?
      @my_client.my_items :
      @my_client.my_items.search(params)
  end

  # GET /my_items/1
  # GET /my_items/1.json
  def show
    @my_client = MyClient.find(params[:my_client_id])
    @my_item = @my_client.my_items.find(params[:id])
  end

  # GET /my_items/new
  def new
    @my_client = MyClient.find(params[:my_client_id])
    @my_item = @my_client.my_items.build
    @my_item.build_my_rack
    @my_item.my_rack.build_my_room
  end

  # GET /my_items/1/edit
  def edit
    @my_client = MyClient.find(params[:my_client_id])
    @my_item = @my_client.my_items.find(params[:id])
  end

  # POST /my_items
  # POST /my_items.json
  def create
    @my_client = MyClient.find(params[:my_client_id])
    @my_item = @my_client.my_items.build(my_item_params)
    if (my_item_params[:my_rack_id].blank?)
      @my_item.my_rack = MyRack.new(my_item_params[:my_rack_attributes])
      if (my_item_params[:my_rack_attributes][:my_room_id].blank?)
        @my_item.my_rack.my_room = MyRoom.create(my_item_params[:my_rack_attributes][:my_room_attributes])
        @my_item.my_rack.my_room_id = @my_item.my_rack.my_room.id
      else
        @my_item.my_rack.my_room = MyRoom.find(my_item_params[:my_rack_attributes][:my_room_id])
      end
      @my_item.my_rack.save
      @my_item.my_rack_id = @my_item.my_rack.id
    else
      @my_item.my_rack = MyRack.find(my_item_params[:my_rack_id])
    end
    respond_to do |format|
      if @my_item.save
        format.html { redirect_to my_client_my_item_path(@my_client, @my_item), notice: 'Объект успешно создан.' }
        format.json { render :show, status: :created, location: @my_item }
      else
        format.html { render :new }
        format.json { render json: @my_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_items/1
  # PATCH/PUT /my_items/1.json
  def update
    @my_client = MyClient.find(params[:my_client_id])
    @my_item = @my_client.my_items.find(params[:id])
    respond_to do |format|
      if @my_item.update(my_item_params)

        format.html { redirect_to my_client_my_item_path(@my_client, @my_item), notice: 'Объект успешно обновлен.' }
        format.json { render :show, status: :ok, location: @my_item }
      else
        format.html { render :edit }
        format.json { render json: @my_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_items/1
  # DELETE /my_items/1.json
  def destroy
    @my_client = MyClient.find(params[:my_client_id])
    @my_item.destroy
    respond_to do |format|
      format.html { redirect_to @my_client, notice: 'Объект успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_item
      @my_item = MyItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_item_params
      params.require(:my_item).permit(
        :height, :width, :length, :weight, :incoming_date, :my_client_id, :issue_date, :my_rack_id, :position,
        my_rack_attributes: [:number, :my_room_id, :places, :height, :width, :length, :max_weight,
          my_room_attributes: [:name, :volume]
        ])
    end
end
