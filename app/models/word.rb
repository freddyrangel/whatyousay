class Word < ActiveRecord::Base
  has_many :definitions

  validates_uniqueness_of :name
  validates_presence_of :name
end
