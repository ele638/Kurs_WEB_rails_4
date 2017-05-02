class MyRack < ActiveRecord::Base
  belongs_to :my_room

  def collection_select_name
  	"#{my_room.name}: #{number}"
  end
end
