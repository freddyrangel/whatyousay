class WordSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :definitions
end
