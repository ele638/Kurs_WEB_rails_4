class MyRoom < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :volume, presence: true, numericality: { greater_than: 0 }
end
