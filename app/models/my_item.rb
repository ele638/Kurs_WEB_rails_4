class MyItem < ActiveRecord::Base
  belongs_to :my_client, inverse_of: :my_items
  belongs_to :my_rack

  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :position, presence: true, numericality: { greater_than: 0 }
  validates :my_client_id, presence: true
  validates :my_rack_id, presence: true
  validates_uniqueness_of :my_rack_id, :scope => :position

  def self.search(search)
    results = MyItem.all
    if !search[:height].blank?
      results = results.where(height: search[:height])
    end
    if !search[:width].blank?
      results = results.where(width: search[:width])
    end
    if !search[:length].blank?
      results = results.where(length: search[:length])
    end
    if !search[:weight].blank?
      results = results.where(weight: search[:weight])
    end
    if !search[:position].blank?
      results = results.where(position: search[:position])
    end
    if !search[:date_from].blank?
      results = results.where("incoming_date >= ? OR issue_date >= ?", search[:date_from], search[:date_from] )
    end
    if !search[:date_to].blank?
      results = results.where("incoming_date <= ? OR issue_date <= ?", search[:date_to], search[:date_to] )
    end
    if !search[:client_name].blank?
      results = results.joins(:my_client).where("my_clients.name LIKE '%#{search[:client_name]}%'")
    end
    if !search[:rack_number].blank?
      results = results.joins(:my_rack).where("my_racks.number = ?", search[:rack_number])
    end
    if !search[:room_name].blank?
      results = results.joins(:my_rack => [:my_room]).where("my_rooms.name LIKE '%#{search[:room_name]}%'")
    end
    results
  end
end
