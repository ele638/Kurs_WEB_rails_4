class MyRoom < ActiveRecord::Base
  has_many :my_racks, inverse_of: :my_room
  validates :name, presence: true, uniqueness: true
  validates :volume, presence: true, numericality: { greater_than: 0 }
end
