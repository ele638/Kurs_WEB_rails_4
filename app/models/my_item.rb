class MyItem < ActiveRecord::Base
  belongs_to :my_client
  belongs_to :my_rack

end
