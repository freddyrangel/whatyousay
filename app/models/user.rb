class User < ActiveRecord::Base
  has_many :definitions

  validates_presence_of :user_name, :email
  validates_uniqueness_of :user_name, :email
end
