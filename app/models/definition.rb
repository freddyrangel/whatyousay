class Definition < ActiveRecord::Base
  belongs_to  :word
  belongs_to  :user
  has_many    :votes
end
