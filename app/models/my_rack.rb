class MyRack < ActiveRecord::Base
  belongs_to :my_room, inverse_of: :my_racks
  validates :number, presence: true, uniqueness: {scope: :my_room_id}, numericality: { greater_than: 0 }
  validates :places, presence: true, numericality: { greater_than: 0 }
  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :max_weight, presence: true, numericality: { greater_than: 0 }
  validates :my_room_id, presence: true
  accepts_nested_attributes_for :my_room, :allow_destroy => true
  def collection_select_name
  	"#{my_room.name}: #{number}"
  end

  def FOC_room (params) # Find Or Create
    if !out_room = MyRoom.find_by_name(params[:name])
      out_room = MyRoom.create(params)
    end
    out_room
  end

  def DON_room (room_id) # Delete Or not
    if MyRack.where(my_room_id: room_id).size == 0
      MyRoom.find(room_id).destroy
    end
  end

end
