class MyClient < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :details, presence: true
end
