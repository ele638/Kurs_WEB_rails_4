json.extract! my_room, :id, :name, :volume, :created_at, :updated_at
json.url my_room_url(my_room, format: :json)
