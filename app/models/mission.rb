class Mission < ApplicationRecord
  include FriendlyIdAble

  validates_presence_of :description, :start_time

  has_many :tapes
  has_many :channels
  has_many :media
end
