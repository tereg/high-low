require 'bcrypt'

class User < ActiveRecord::Base
  
  include BCrypt

	validates :first_name, :last_name, :username, :email, presence: true  
  validates :username, :email, uniqueness: true 

  has_many  :daily_activities
  
  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end
end

