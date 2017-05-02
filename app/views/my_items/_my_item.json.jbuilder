json.extract! my_item, :id, :height, :width, :length, :weight, :incoming_date, :my_client_id, :issue_date, :my_rack_id, :position, :created_at, :updated_at
json.url my_item_url(my_item, format: :json)
