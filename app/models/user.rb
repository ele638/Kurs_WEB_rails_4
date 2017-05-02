class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 3}, confirmation: true,
            if: Proc.new { |u| u.new_record? or !u.password.blank? }

  has_many :role_users  
end
