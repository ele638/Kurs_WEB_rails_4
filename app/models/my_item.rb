class MyItem < ActiveRecord::Base
  belongs_to :my_client
  belongs_to :my_rack

  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :position, presence: true, numericality: { greater_than: 0 }
  validates :my_client_id, presence: true
  validates :my_rack_id, presence: true

end
