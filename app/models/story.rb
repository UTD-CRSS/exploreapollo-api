class Story < ApplicationRecord
  include FriendlyIdAble

  has_and_belongs_to_many :moments

  validates_presence_of :description
end
