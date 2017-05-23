class MyClient < ActiveRecord::Base
  has_many :my_items, inverse_of: :my_client
  validates :name, presence: true, uniqueness: true
  validates :details, presence: true
end
