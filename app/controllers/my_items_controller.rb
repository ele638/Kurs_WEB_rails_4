class MyItemsController < ApplicationController
  before_action :set_my_item, only: [:show, :edit, :update, :destroy]

  # GET /my_items
  # GET /my_items.json
  def index
    @my_items = MyItem.all
  end

  # GET /my_items/1
  # GET /my_items/1.json
  def show
  end

  # GET /my_items/new
  def new
    @my_item = MyItem.new
  end

  # GET /my_items/1/edit
  def edit
  end

  # POST /my_items
  # POST /my_items.json
  def create
    @my_item = MyItem.new(my_item_params)

    respond_to do |format|
      if @my_item.save
        format.html { redirect_to @my_item, notice: 'My item was successfully created.' }
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
    respond_to do |format|
      if @my_item.update(my_item_params)
        format.html { redirect_to @my_item, notice: 'My item was successfully updated.' }
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
    @my_item.destroy
    respond_to do |format|
      format.html { redirect_to my_items_url, notice: 'My item was successfully destroyed.' }
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
      params.require(:my_item).permit(:height, :width, :length, :weight, :incoming_date, :my_client_id, :issue_date, :my_rack_id, :position)
    end
end
