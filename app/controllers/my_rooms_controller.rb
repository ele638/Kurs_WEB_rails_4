class MyRoomsController < ApplicationController
  before_action :set_my_room, only: [:show, :edit, :update, :destroy]

  # GET /my_rooms
  # GET /my_rooms.json
  def index
    @my_rooms = MyRoom.all
  end

  # GET /my_rooms/1
  # GET /my_rooms/1.json
  def show
  end

  # GET /my_rooms/new
  def new
    @my_room = MyRoom.new
  end

  # GET /my_rooms/1/edit
  def edit
  end

  # POST /my_rooms
  # POST /my_rooms.json
  def create
    @my_room = MyRoom.new(my_room_params)

    respond_to do |format|
      if @my_room.save
        format.html { redirect_to @my_room, notice: 'My room was successfully created.' }
        format.json { render :show, status: :created, location: @my_room }
      else
        format.html { render :new }
        format.json { render json: @my_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_rooms/1
  # PATCH/PUT /my_rooms/1.json
  def update
    respond_to do |format|
      if @my_room.update(my_room_params)
        format.html { redirect_to @my_room, notice: 'My room was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_room }
      else
        format.html { render :edit }
        format.json { render json: @my_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_rooms/1
  # DELETE /my_rooms/1.json
  def destroy
    @my_room.destroy
    respond_to do |format|
      format.html { redirect_to my_rooms_url, notice: 'My room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_room
      @my_room = MyRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_room_params
      params.require(:my_room).permit(:name, :volume)
    end
end
