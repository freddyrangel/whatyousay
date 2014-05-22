class User < ActiveRecord::Base

  has_many :definitions

  validates :user_name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i, message: "debe tener el formato correcto."}
end
