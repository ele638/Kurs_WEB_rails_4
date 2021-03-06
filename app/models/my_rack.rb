class MyRack < ActiveRecord::Base
  belongs_to :my_room, inverse_of: :my_racks
  validates :number, presence: true, uniqueness: {scope: :my_room_id}, numericality: { greater_than: 0 }
  validates :places, presence: true, numericality: { greater_than: 0 }
  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :max_weight, presence: true, numericality: { greater_than: 0 }
  validates :my_room_id, presence: true
  accepts_nested_attributes_for :my_room
  def collection_select_name
  	"#{my_room.name}: #{number}"
  end
end
