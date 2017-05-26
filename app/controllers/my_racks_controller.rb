class MyRacksController < ApplicationController
  before_action :set_my_rack, only: [:show, :edit, :update, :destroy]
  before_action :check_app_auth, except: [:index, :show, :set_my_client]

  # GET /my_racks
  # GET /my_racks.json
  def index
    @my_room = MyRoom.find(params[:my_room_id])
    @my_racks = @my_room.my_racks
  end

  # GET /my_racks/1
  # GET /my_racks/1.json
  def show
    @my_room = MyRoom.find(params[:my_room_id])
    @my_racks = @my_room.my_racks.find(params[:id])
  end

  # GET /my_racks/new
  def new
    @my_room = MyRoom.find(params[:my_room_id])
    @my_rack = @my_room.my_racks.build
  end

  # GET /my_racks/1/edit
  def edit
    @my_room = MyRoom.find(params[:my_room_id])
    @my_racks = @my_room.my_racks.find(params[:id])
  end

  # POST /my_racks
  # POST /my_racks.json
  def create
    @my_room = MyRoom.find(params[:my_room_id])
    @my_rack = @my_room.my_racks.new(my_rack_params)
    respond_to do |format|
      if @my_rack.save
        format.html { redirect_to my_room_my_rack_path(@my_room, @my_rack), notice: 'Стелаж успешно создан.' }
        format.json { render :show, status: :created, location: @my_rack }
      else
        format.html { render :new }
        format.json { render json: @my_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_racks/1
  # PATCH/PUT /my_racks/1.json
  def update
    @my_room = MyRoom.find(params[:my_room_id])
    respond_to do |format|
      if @my_rack.update(my_rack_params)
        format.html { redirect_to my_room_my_rack_path(@my_room, @my_rack), notice: 'Стелаж успешно обновлен.' }
        format.json { render :show, status: :ok, location: @my_rack }
      else
        format.html { render :edit }
        format.json { render json: @my_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_racks/1
  # DELETE /my_racks/1.json
  def destroy
    @my_room = MyRoom.find(params[:my_room_id])
    @my_rack.destroy
    respond_to do |format|
      format.html { redirect_to @my_room, notice: 'Стелаж успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_rack
      @my_rack = MyRack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_rack_params
      params.require(:my_rack).permit(:number, :my_room_id, :places, :height, :width, :length, :max_weight)
    end
end
